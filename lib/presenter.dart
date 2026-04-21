import 'package:flutter/material.dart';
import 'package:home_work/utils/assigmentcases.dart';

class Presenter extends StatelessWidget {
  const Presenter({super.key});

  @override
  Widget build(BuildContext context) {
    final cases = Assigmentcases.values;

    return Scaffold(
      appBar: AppBar(title: const Text("Presenter")),
      body: SafeArea(
        child: ListView.builder(
          itemCount: cases.length,
          itemBuilder: (context, index) {
            final item = cases[index];

            return Card(
              margin: const EdgeInsets.all(12),
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: Text(item.title)),
                        body: item.widget,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(item.title, style: const TextStyle(fontSize: 18)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
