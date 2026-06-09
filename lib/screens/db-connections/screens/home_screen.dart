import 'package:flutter/material.dart';

class HomeScreendb extends StatefulWidget {
  const HomeScreendb({super.key});

  @override
  State<HomeScreendb> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreendb> {
  @override
  Widget build(BuildContext buildContex) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Hello Db"),
            ),
          ],
        ),
      ),
    );
  }
}
