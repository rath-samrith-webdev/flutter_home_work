import 'package:dio/dio.dart';
import 'package:home_work/core/networks/models/posts.dart';
import '../models/user.dart';

class Api<T> {
  final Dio dio;
  final String path;
  final T Function(Map<String, dynamic>) fromJson;

  Api({
    required this.dio,
    required this.path,
    required this.fromJson,
  });

  Future<List<T>> getAll() async {
    final response = await dio.get(path);

    return (response.data as List)
        .map((e) => fromJson(e))
        .toList();
  }
}

//assign base url
final dio = Dio(
  BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
  ),
);

// define user api
final userApi = Api<User>(
  dio: dio,
  path: '/users',
  fromJson: User.fromJson,
);

final productApi = Api<Post>(
  dio:dio,
  path:'/products',
  fromJson: Post.fromJson
);
