void main() {
  performTasks();
}

void performTasks() async {
  task1();
  print(task2());
  String? task2Data = await task2();
  task3(task2Data!);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 Complete');
}

Future<String?> task2() async {
  Duration threeSecond = Duration(seconds: 3);
  String? result;
  await Future.delayed(threeSecond, () {
    result = 'Task 2 data';
    print('Task 2 Complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'Task 3 data';
  print('Task 3 complete with $task2Data');
}

// void main() {
//   performTasks();
// }
//
// void performTasks() {
//   task1();
//   task2();
//   task3();
// }
//
// void task1() {
//   String result = 'task 1 data';
//   print('Task 1 Complete');
// }
//
// void task2() {
//   Duration threeSecond = Duration(seconds: 3);
//   Future.delayed(threeSecond, () {
//     String result = 'Task 2 data';
//     print('Task 2 Complete');
//   });
// }
//
// void task3() {
//   String result = 'Task 3 data';
//   print('Task 3 complete');
// }
