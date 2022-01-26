// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:better_flutter_form_eg/custom_form_field.dart';
import 'package:better_flutter_form_eg/custom_image_form_field.dart';
import 'package:better_flutter_form_eg/form_submission.dart';
import 'package:better_flutter_form_eg/profile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Better Flutter Form Demo',
      home: FormPage(
          // profile: Profile(
          //   name: 'Chinmay',
          //   phoneNo: '99999999999',
          // ),
          ),
    );
  }
}

class FormPage extends StatelessWidget {
  FormPage({Key? key, Profile? profile})
      : _profile = profile ?? Profile(),
        super(key: key);

  final _formKey = GlobalKey<FormState>();
  Profile _profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Better Flutter Forms'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Name',
              initialValue: _profile.name,
              onChanged: (value) => _profile.name = value,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r"[a-zA-Z]+|\s"),
                )
              ],
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Enter a valid name';
                }
              },
            ),
            CustomTextField(
              maxLength: 10,
              hintText: 'Phone No',
              initialValue: _profile.phoneNo,
              onChanged: (value) => _profile.phoneNo = value,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (val) {
                if (val == null || val.length < 10) {
                  return 'Enter a valid phone no';
                }
              },
            ),
            CustomImageFormField(
              initialValue: _profile.profilePic,
              validator: (val) {
                print('fired');
                if (val == null) return 'Pick a picture';
              },
              onPicked: (_file) => _profile.profilePic = _file,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => FormSubmission(profile: _profile),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
