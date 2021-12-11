// ignore: file_names
//import 'dart:html';
//import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:biofuture/model/api.dart';
import 'package:biofuture/widgets/appbar_research.dart';
import 'package:biofuture/widgets/button_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
//import 'package:biofuture/widgets/ButtonWidget.dart';
import 'dart:io';

class UploadPaper extends StatefulWidget {
  @override
  _UploadPaperState createState() => _UploadPaperState();
}

class _UploadPaperState extends State<UploadPaper> {
  bool value = false;
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      appBar: appbarResearch(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 5),
          TitleWidget(),
          const SizedBox(height: 8),
          DescriptionWidget(),
          const SizedBox(height: 8),
          Text('Attachment(.pdf, .jpg, .png, etc..'),
          AttachmentWidget(),
          const SizedBox(height: 8),
          Text(
            fileName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text('Website/NCBI'),
          TextField(
            decoration: InputDecoration(
              hintText: '(optional)',
            ),
          ),
          const SizedBox(height: 8),
          Text('GitHub/Gitlab'),
          TextField(
            decoration: InputDecoration(
              hintText: '(optional)',
            ),
          ),
          const SizedBox(height: 8),
          CheckboxListTile(
              title: Text(
                'If you are a UTM student or UTM researcher.',
              ),
              value: this.value,
              onChanged: (bool? value) {
                setState(() {
                  this.value = value!;
                });
              }),
          const SizedBox(height: 10),
          ButtonWidget(
            text: 'Submit',
            onClicked: uploadFile,
            icon: Icons.cloud_upload,
          ),
        ],
      ),
    );
  }

  Widget TitleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Title..',
            ),
          ),
        ),
      ],
    );
  }

  Widget DescriptionWidget() {
    late final TextEditingController controller;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 3),
          TextField(
            //controller: TextEditingController(text: widget.text),
            maxLines: 8,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '(Optional)',
            ),
          ),
        ],
      ),
    );
  }

  Widget AttachmentWidget() {
    return ButtonWidget(
      text: 'Upload',
      icon: Icons.attach_file,
      onClicked: selectFile,
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    final task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');

    Navigator.of(this.context).pop();
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
