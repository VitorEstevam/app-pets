import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/classes/tasks/task_weekly.dart';
import 'package:test/test.dart';

void main() {
  test('a', () {
    var task = TaskWeekly("test task",[DateTime.monday, DateTime.saturday]);
    // task.startDate = DateTime(2022,01,16);
    // task.updateSubTasks();
    print(task);
    // var date = task.getNextDate();
    // expect(date, equals(tomorrow));

    // task.markAsDone();
    // expect(task.subTask[0].done, true);
  });


}