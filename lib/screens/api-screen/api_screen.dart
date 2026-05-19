import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_work/core/networks/models/user.dart';
import 'package:home_work/core/networks/services/api.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});
  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  late final Api<User> userApi;
  late Future<List<User>> usersFuture;

  @override
  void initState() {
    super.initState();

    userApi = Api<User>(
      dio: Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')),
      path: '/users',
      fromJson: User.fromJson,
    );

    usersFuture = userApi.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: userApi.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final users = snapshot.data ?? [];

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(users[index].name),
                subtitle: Text(users[index].email),
              );
            },
          );
        },
      ),
    );
  }
}
