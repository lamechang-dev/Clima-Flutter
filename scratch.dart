import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  String test = await task2();
  print(test);
}

Future<String> task2() async {
  Duration fiveSeconds = Duration(seconds: 5);

  String result;

  await Future.delayed(fiveSeconds, (){
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;

}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}