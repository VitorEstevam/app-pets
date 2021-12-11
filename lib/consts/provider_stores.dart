import 'package:app_pets/stores/example/example.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerStores = [
  Provider<Example>(
    create: (_) => Example(),
  ),
];
