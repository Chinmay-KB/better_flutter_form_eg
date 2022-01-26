// ignore_for_file: must_be_immutable

import 'package:better_flutter_form_eg/custom_form_field.dart';
import 'package:better_flutter_form_eg/profile.dart';
import 'package:flutter/material.dart';

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
            ),
            CustomTextField(
              hintText: 'Phone No',
              initialValue: _profile.phoneNo,
              onChanged: (value) => _profile.phoneNo = value,
            )
          ],
        ),
      ),
    );
  }
}
