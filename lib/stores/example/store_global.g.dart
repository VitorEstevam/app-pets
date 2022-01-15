// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_global.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreGlobal on _StoreGlobal, Store {
  final _$tutorialDoneAtom = Atom(name: '_StoreGlobal.tutorialDone');

  @override
  bool get tutorialDone {
    _$tutorialDoneAtom.reportRead();
    return super.tutorialDone;
  }

  @override
  set tutorialDone(bool value) {
    _$tutorialDoneAtom.reportWrite(value, super.tutorialDone, () {
      super.tutorialDone = value;
    });
  }

  final _$petsAtom = Atom(name: '_StoreGlobal.pets');

  @override
  ObservableList<Pet> get pets {
    _$petsAtom.reportRead();
    return super.pets;
  }

  @override
  set pets(ObservableList<Pet> value) {
    _$petsAtom.reportWrite(value, super.pets, () {
      super.pets = value;
    });
  }

  @override
  String toString() {
    return '''
tutorialDone: ${tutorialDone},
pets: ${pets}
    ''';
  }
}
