// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_pets.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StorePets on _StorePets, Store {
  final _$petsAtom = Atom(name: '_StorePets.pets');

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

  final _$actualPetAtom = Atom(name: '_StorePets.actualPet');

  @override
  Pet? get actualPet {
    _$actualPetAtom.reportRead();
    return super.actualPet;
  }

  @override
  set actualPet(Pet? value) {
    _$actualPetAtom.reportWrite(value, super.actualPet, () {
      super.actualPet = value;
    });
  }

  final _$_StorePetsActionController = ActionController(name: '_StorePets');

  @override
  void setPet(Pet _pet) {
    final _$actionInfo =
        _$_StorePetsActionController.startAction(name: '_StorePets.setPet');
    try {
      return super.setPet(_pet);
    } finally {
      _$_StorePetsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask(Pet _pet, Task _task) {
    final _$actionInfo =
        _$_StorePetsActionController.startAction(name: '_StorePets.addTask');
    try {
      return super.addTask(_pet, _task);
    } finally {
      _$_StorePetsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pets: ${pets},
actualPet: ${actualPet}
    ''';
  }
}
