enum taskType{
  unique, weekly, progressive
}

class Task { //unique
  String? title;
  String? description;
  DateTime? date;
  bool done = false;

  Task.unique({this.title, this.description, this.date});
}

  // // Read-only non-final property
  // int? get launchYear => launchDate?.year;

  // // Constructor, with syntactic sugar for assignment to members.
  // Spacecraft(this.name, this.launchDate) {
  //   // Initialization code goes here.
  // }

  // // Named constructor that forwards to the default one.
  // Spacecraft.unlaunched(String name) : this(name, null);

  // // Method.
  // void describe() {
  //   print('Spacecraft: $name');
  //   // Type promotion doesn't work on getters.
  //   var launchDate = this.launchDate;
  //   if (launchDate != null) {
  //     int years =
  //         DateTime.now().difference(launchDate).inDays ~/ 365;
  //     print('Launched: $launchYear ($years years ago)');
  //   } else {
  //     print('Unlaunched');
  //   }
  // }