// 이 파일 하나에서만 작업
// main에서는 흐름만 작성
import 'dart:io';

void main() {
  List<String> todoList = [];

  runTodoProgram(todoList);
}

// 전체 프로그램 실행하는 함수
void runTodoProgram(List<String> todoList) {
  while (true) {
    // 메뉴 반복출력. 와일문 안쪽에 있지 않으면 무한반복 실행
    // 사용자 입력 받아서 기능을 실행
    print('===== TODO 프로그램 =====');
    print('1. 할 일 추가');
    print('2. 할 일 목록 보기');
    print('3. 할 일 삭제');
    print('0. 종료');
    print('========================');
    stdout.write('원하는 목록의 번호를 입력해주세요.');
    int? input = int.tryParse(stdin.readLineSync() ?? '');

    switch (input) {
      case 1:
        addTodo(todoList);
        break;

      case 2:
        printTodoList(todoList);
        break;

      case 3:
        removeTodo(todoList);
        break;

      case 0:
        print('TODO 프로그램을 종료합니다.');
        return;

      default:
        print('잘못된 메뉴선택입니다. 다시 선택해주세요.');
        continue;
    }
  }
}

// 할 일 추가 함수
void addTodo(List<String> todoList) {
  // 사용자로 문자열을 입력받는다
  // 빈 값이면 추가하지 않는다
  stdout.write('추가할 할 일을 입력하세요: ');
  String? todoAdd = stdin.readLineSync()?.trim() ?? '';

  // 정상 입력이면 todoList에 추가
  if (todoAdd.isNotEmpty) {
    todoList.add(todoAdd);
    print('할 일이 추가 완료되었습니다.');
    return;
  } else {
    print('내용이 없습니다. 할 일을 다시 입력해주세요.');
  }
}

// 할 일 목록 출력 함수
void printTodoList(List<String> todoList) {
  // 저장된 모든 할 일을 번호와 함깨 출력
  // 비어있으면 안내메시지 출력
  if (todoList.isNotEmpty) {
    print('할 일 목록 리스트 입니다.');
    // 순서대로 출력을 해야됨. 목록 세로방향
    int i = 0;
    for (var i = 0; i < todoList.length; i++) {
      print('${i + 1}. ${todoList[i]}');
    }
    return;
  } else {
    print('등록된 할 일이 없습니다.');
    return;
  }
}

// 할 일 삭제 함수
void removeTodo(List<String> todoList) {
  // 삭제할 번호를 입력받는다
  // 해당 번호의 항목을 삭제한다
  // 잘못된 번호 입력 시 안내 메시지 출력
  printTodoList(todoList);
  stdout.write('삭제할 번호를 입력하세요: ');
  int? number = int.tryParse(stdin.readLineSync() ?? '');

  // 인덱스를 삭제하는 함수를 사용
  // 사용자가 입력한 인덱스 값이 리스트 사이에 있는지 확인해야 한다. (구조에 대한 힌트를 잘 모르겠어서 방법을 찾아봄)
  if (number != null && number > 0 && number <= todoList.length) {
    // !! 실제 0부터 시작하는 1
    // 인덱스 순서 값을 고려해서 number를 1씩 빼주어야 함
    todoList.removeAt(number - 1);
    print('할 일 목록에서 $number번 항목이 삭제되었습니다.');
  } else {
    print('존재하지 않는 목록입니다. 번호를 다시 입력해주세요.');
  }
}
