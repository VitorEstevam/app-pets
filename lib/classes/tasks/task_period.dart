// import 'package:app_pets/classes/period_tuple.dart';
// import 'package:app_pets/consts/utils.dart';

// import 'task.dart';

// class TaskPeriod extends Task {
//   PeriodTuple period;

//   TaskPeriod(title, pet, this.period) : super(title, pet) {
//     updateSubTasks();
//   }

//   @override
//   String get subTitle {
//     return period.label;
//   }

//   @override
//   bool checkFutureDate(DateTime date) {
//     // if (compareDates(date, DateTime.now()) < 0) return false;
//     // return weekdays.contains(date.weekday);

//     return false;
//   }

//   @override
//   int getStreak() {
//     var streak = 0;
//     for (var task in subTasks) {
//       if (!task.done) {
//         streak = 0;
//       } else {
//         streak++;
//       }
//     }
//     return streak;
//   }

//   @override
//   void updateSubTasks() {
//     var start = startDate;
//     var end = DateTime.now();
//     final daysToGenerate = end.difference(start).inDays; 

//     for (var i = 0; i < daysToGenerate; i++) {
//       var day = DateTime(start.year, start.month, start.day + (i));

//       if (weekdays.contains(day.weekday)) {
//         var subTask = SubTask(day);

//         if (!subTasks.contains(subTask)) {
//           subTasks.insert(0, subTask);
//         }
//       }
//     }

//     // get next events
//     for (var i = 0; i < 7; i++) {
//       var day = DateTime(end.year, end.month, end.day + (i));

//       if (weekdays.contains(day.weekday)) {
//         var subTask = SubTask(day);

//         if (!subTasks.contains(subTask)) {
//           subTasks.insert(0, subTask);
//         }

//         return;
//       }
//     }
//   }

//   @override
//   void markAsDone() {
//     subTasks[0].markAsDone();
//   }

//   @override
//   TaskStatus getStatus() {
//     return subTasks[0].getStatus();
//   }
// }
