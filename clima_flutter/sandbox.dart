void main() {
  runTasks();
}

runTasks() async {
  // task1();
  // String data = await task2();
  // task3(data);
  // print(task2()); // prints Future<String>
  // print(await task2()); // prints String
  print(taskA());
  Future.value(() {
    print(taskB());
    return taskB();
  }());
  print(taskB());
  print(taskC());
}

task1() {
  print('initiating task1');
  print('task1 completed');
}

Future<String> task2() async {
  print('initiating task2');
  late String result;
  await Future.delayed(const Duration(seconds: 3), () {
    result = 'data';
    print('task2 completed');
  });
  return result;
}

task3(data) {
  print('initiating task3');
  print('task3 completed with $data');
}

taskA() => 'task A completed';

Future<String> taskB() async {
  late String s;
  await Future.delayed(const Duration(seconds: 5), () {
    s = 'task A completed';
  });
  return s;
}

taskC() => 'task C completed';
