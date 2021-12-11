import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:biofuture/model/user.dart';
import 'package:biofuture/utils/user_preferences.dart';
import 'package:biofuture/widgets/appbar_widget.dart';
import 'package:biofuture/widgets/button_widget.dart';
import 'package:biofuture/widgets/profile_widget.dart';
import 'package:biofuture/widgets/textfield_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        //child: Builder(
        // builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 12),
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {
                final image =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = await File(image.path).copy(imageFile.path);

                setState(() => user = user.copy(imagePath: newImage.path));
              },
              isEdit: true,
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) => user = user.copy(about: about),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Save',
              icon: Icons.save,
              onClicked: () {
                UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
  //),
  //);
}
