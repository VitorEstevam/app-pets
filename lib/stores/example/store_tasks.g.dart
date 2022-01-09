// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_tasks.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreTasks on _StoreTasks, Store {
  final _$tasksAtom = Atom(name: '_StoreTasks.tasks');

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$_StoreTasksActionController = ActionController(name: '_StoreTasks');

  @override
  void insert(Task t) {
    final _$actionInfo =
        _$_StoreTasksActionController.startAction(name: '_StoreTasks.insert');
    try {
      return super.insert(t);
    } finally {
      _$_StoreTasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
