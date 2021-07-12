import 'package:flutter/material.dart';
import 'package:inputs/baska_sayfa.dart';
import 'package:inputs/form_islemleri.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: TextForm(),
  ));
}
