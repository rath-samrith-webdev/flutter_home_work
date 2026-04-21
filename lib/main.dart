import 'package:flutter/material.dart';
import 'package:home_work/presenter.dart';

void main() {
  Widget app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Presenter(),
  );
  runApp(app);
}
