class Tutorial {
  final String title;
  final String focus;
  final String subtitle;
  final String image;

  Tutorial({
    required this.title,
    required this.focus,
    required this.subtitle,
    required this.image,
  });
}

List<Tutorial> tutorialContents = [
  Tutorial(
    title: 'Connect with the Professionals',
    focus: 'bioinformatics information',
    subtitle:
        'Inquire informations, exchange and forge\n new collaborations in our private chat.',
    image: 'lib/images/Tutorial_Chat.gif',
  ),
  Tutorial(
    title: 'Customize your Profile',
    focus: 'easy',
    subtitle:
        'Customize your profile makes it easier\n for others to recognize and find you.',
    image: 'lib/images/Tutorial_Profile.gif',
  ),
  /*
  Tutorial(
    title: 'Organize your\n bioinformatics information is',
    focus: 'free from doubt',
    subtitle: 'BioFuture is a platform for communication of\n researchers and professionals in the field of\n bioinformatics.',
    image: 'assets/Tutorial_Chat.gif',
  ),
  Tutorial(
    title: 'Join a supportive community',
    focus: '~ BioFuture ~',
    subtitle: 'A place for you to forge new friendship,\n exchange knowledge,\n and share your ideas.',
    image: 'assets/onboarding_image_4.png',
  ),
  */
];
