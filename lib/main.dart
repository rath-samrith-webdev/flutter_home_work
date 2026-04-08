import 'package:flutter/material.dart';
import 'package:home_work/utils/assigmentcases.dart';

void main() {
  Widget app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Assigmentcases().getCaseWidget(Assigmentcases.case2),
  );
  runApp(app);
}
