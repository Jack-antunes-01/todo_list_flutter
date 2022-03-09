import 'package:dio/dio.dart';
import 'package:todo_list/src/configs/interfaces/api_interface.dart';

class Api implements ApiInterface {
  late final Dio dio;

  Api([Dio? client]) : dio = client ?? Dio();

  @override
  getInstance() {
    return dio;
  }
}
