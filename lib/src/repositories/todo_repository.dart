import 'package:dio/dio.dart';
import 'package:todo_list/src/configs/api.dart';
import 'package:todo_list/src/models/todo_model.dart';

class TodoRepository {
  final Dio api = Api().getInstance();
  final String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<TodoModel>> fetchTodos() async {
    final response = await api.get(url);
    final list = response.data as List;

    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
