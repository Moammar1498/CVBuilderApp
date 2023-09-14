import 'package:cv_builder/widgets/custom_text_field.dart';
import 'package:cv_builder/models/user_intro_model.dart';
import 'package:flutter/material.dart';

class EditCV extends StatefulWidget {
  final UserIntro userIntro;
  const EditCV({
    super.key,
    required this.userIntro,
  });

  @override
  State<EditCV> createState() => _EditCVState();
}

class _EditCVState extends State<EditCV> {
  late final TextEditingController fNameController;
  late final TextEditingController profController;
  late final TextEditingController bioController;
  late final TextEditingController githubController;
  late final TextEditingController linkedInController;
  late final TextEditingController slackController;

  late final FocusNode fNameFocus;
  late final FocusNode profFocus;
  late final FocusNode bioFocus;
  late final FocusNode githubFocus;
  late final FocusNode linkedInFocus;
  late final FocusNode slackFocus;

  @override
  void initState() {
    fNameController =
        TextEditingController(text: widget.userIntro.fullName.toString());
    profController =
        TextEditingController(text: widget.userIntro.profession.toString());
    bioController =
        TextEditingController(text: widget.userIntro.bioDesc.toString());
    githubController =
        TextEditingController(text: widget.userIntro.github.toString());
    linkedInController =
        TextEditingController(text: widget.userIntro.linkedIn.toString());
    slackController =
        TextEditingController(text: widget.userIntro.slack.toString());

    fNameFocus = FocusNode();
    profFocus = FocusNode();
    bioFocus = FocusNode();
    githubFocus = FocusNode();
    slackFocus = FocusNode();
    linkedInFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    fNameController.dispose();
    profController.dispose();
    bioController.dispose();
    githubController.dispose();
    linkedInController.dispose();
    slackController.dispose();
    fNameFocus.dispose();
    profFocus.dispose();
    bioFocus.dispose();
    githubFocus.dispose();
    linkedInFocus.dispose();
    slackFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Edit CV Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  textController: fNameController,
                  textFocus: fNameFocus,
                  isPass: false,
                  leadingIcon: const Icon(null),
                  hintText: 'Full Name',
                  validator: (value) {
                    return null;
                  },
                  onSubmitted: (value) {
                    fieldFocusChange(context, fNameFocus, profFocus);
                  },
                  isMultiLine: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  textController: profController,
                  textFocus: profFocus,
                  isPass: false,
                  leadingIcon: const Icon(null),
                  hintText: 'Profession',
                  validator: (value) {
                    return null;
                  },
                  onSubmitted: (value) {
                    fieldFocusChange(context, profFocus, bioFocus);
                  },
                  isMultiLine: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  textController: bioController,
                  textFocus: bioFocus,
                  isPass: false,
                  leadingIcon: const Icon(null),
                  hintText: 'Short Bio',
                  validator: (value) {
                    return null;
                  },
                  onSubmitted: (value) {
                    fieldFocusChange(context, bioFocus, githubFocus);
                  },
                  isMultiLine: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                    textController: githubController,
                    textFocus: githubFocus,
                    isPass: false,
                    leadingIcon: const Icon(null),
                    hintText: 'GitHub Profile',
                    validator: (value) {
                      return;
                    },
                    onSubmitted: (value) {
                      fieldFocusChange(context, githubFocus, slackFocus);
                    },
                    isMultiLine: false),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                    textController: slackController,
                    textFocus: slackFocus,
                    isPass: false,
                    leadingIcon: const Icon(null),
                    hintText: 'Slack Username',
                    validator: (value) {
                      return;
                    },
                    onSubmitted: (value) {
                      fieldFocusChange(context, slackFocus, linkedInFocus);
                    },
                    isMultiLine: false),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                    textController: linkedInController,
                    textFocus: linkedInFocus,
                    isPass: false,
                    leadingIcon: const Icon(null),
                    hintText: 'LinkedIn Profile',
                    validator: (value) {
                      return;
                    },
                    onSubmitted: (value) {},
                    isMultiLine: false),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  onTap: () {
                    final newUser = widget.userIntro.copyWith(
                        fullName: fNameController.text.toString(),
                        profession: profController.text.toString(),
                        bioDesc: bioController.text.toString(),
                        github: githubController.text.toString(),
                        linkedIn: linkedInController.text.toString(),
                        slack: slackController.text.toString());
                    Navigator.pop(context, newUser);
                  },
                  child: Ink(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * .6,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Center(
                      child: Text(
                        'Save',
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
}

void fieldFocusChange(
    BuildContext context, FocusNode current, FocusNode nextFocus) {
  current.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
