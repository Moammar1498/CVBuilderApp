import 'package:cv_builder/utils/cv_fonts.dart';
import 'package:cv_builder/models/user_intro_model.dart';
import 'package:cv_builder/screens/cv_view_edit.dart';
import 'package:flutter/material.dart';

class CVView extends StatefulWidget {
  const CVView({
    super.key,
  });

  @override
  State<CVView> createState() => _CVViewState();
}

class _CVViewState extends State<CVView> {
  late UserIntro userIntro;
  @override
  void initState() {
    userIntro = UserIntro(
        fullName: 'Moammar Qaddafi',
        profession: "Mobile Engineer",
        bioDesc:
            '''Mobile Engineer with hands on experience on cross-platform moble apps (Android & IOS). Desirous to work diligently and willing to develop the technical and interpersonal skills by working in challenging & learning environment.''',
        github: 'https://github.com/Moammar1498',
        linkedIn: 'https://www.linkedin.com/in/moammar1948/',
        slack: '@Moammar-Qaddafi');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userIntro.fullName.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      userIntro.profession.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      userIntro.bioDesc.toString(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.blueAccent,
                  endIndent: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let's Connect",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          CVIconsFont.gitHubIcon,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(userIntro.github)
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          CVIconsFont.slackIcon,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(userIntro.slack),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          CVIconsFont.linkedInIcon,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(userIntro.linkedIn)
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  onTap: () {
                    _navigateAndGetUser(context);
                  },
                  child: Ink(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * .6,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Center(
                      child: Text(
                        'Edit Details',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _navigateAndGetUser(BuildContext context) async {
    UserIntro result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditCV(userIntro: userIntro),
      ),
    );

    if (!mounted) {
      return;
    }
    if (result.fullName.isNotEmpty) {
      final newUser = userIntro.copyWith(
          fullName: result.fullName.toString(),
          profession: result.profession.toString(),
          bioDesc: result.bioDesc.toString(),
          github: result.github.toString(),
          linkedIn: result.linkedIn.toString(),
          slack: result.slack.toString());

      setState(() {
        userIntro = newUser;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Your Profile is Updated!'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
