import 'package:better_flutter_form_eg/profile.dart';
import 'package:flutter/material.dart';

class FormSubmission extends StatelessWidget {
  const FormSubmission({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Name - ${profile.name}'),
          Text('Phone no - ${profile.phoneNo}'),
          Image.file(
            profile.profilePic!,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }
}
