import 'package:flutter/material.dart';
import 'package:todo_list/src/controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        var todo = controller.todos[index];
        return ListTile(
          leading: Checkbox(
            value: todo.completed,
            fillColor: MaterialStateProperty.all(Colors.black),
            onChanged: (bool? value) {
              setState(() => controller.todos[index].completed = value);
            },
          ),
          title: Text(todo.title!),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        child: Text("Tentar novamente"),
        onPressed: () {
          controller.start();
        },
      ),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List Todo's"),
          actions: [
            IconButton(
                onPressed: () {
                  controller.start();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return stateManagement(controller.state.value);
          },
        ));
  }
}
