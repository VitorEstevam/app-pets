import 'package:mobx/mobx.dart';

// run builder on cmd to generate the code

// Include this
part 'example.g.dart';
class Example = _Example with _$Example;

// Create the class
abstract class _Example with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}