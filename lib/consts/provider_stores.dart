import 'package:app_pets/stores/example/store_tasks.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerStores = [
  Provider<StoreTasks>(
    create: (_) => StoreTasks(),
  ),
];
