import 'dart:io';

void main() {
  // 초기 데이터
  List<Map<String, dynamic>> books = [
    {'id': 1, 'title': '플러터 입문', 'isAvailable': true, 'price': 1500},
    {'id': 2, 'title': '다트 문법 정복', 'isAvailable': true, 'price': 1200},
    {'id': 3, 'title': '맛있는 알고리즘', 'isAvailable': true, 'price': 2000},
  ];

  runLibraryProgram(books);
}

// 입출력값
void runLibraryProgram(List<Map<String, dynamic>> books) {
  while (true) {
    print('\n========== 📖 도서 관리 시스템 ==========');
    print('1. 목록 보기 | 2. 도서 대여 | 3. 대여 현황 | 4. 반납하기 | 0. 종료');
    stdout.write('번호 선택: ');
    String? menu = stdin.readLineSync();

    if (menu == '1') {
      showAllBooks(books);
    } else if (menu == '2') {
      rentBook(books);
    } else if (menu == '3') {
      showMyBorrowBooks(books);
    } else if (menu == '4') {
      returnBook(books);
    } else if (menu == '0') {
      print('프로그램을 종료합니다.');
      break;
    } else {
      print('잘못된 입력입니다. 메뉴번호를 골라주세요.');
      return;
    }
  }
}

// 유틸. 공통으로 쓰일 숫자 입력 함수
int readIntInput(String prompt) {
  while (true) {
    stdout.write('$prompt: ');
    int? val = int.tryParse(stdin.readLineSync() ?? '');
    if (val != null) return val;
    print('숫자로 입력해주세요.');
  }
}

// 1. 목록보기
void showAllBooks(List<Map<String, dynamic>> books) {
  // for문을 돌며 대여가능/대여중 상태와 함께 제목 출력
  // 리스트 안의 내용을 하나씩 꺼내기
  for (var book in books) {
    if (book['isAvalable'] == true) {}
  }
}

// 2. 도서대여 (수정 로직)
void rentBook(List<Map<String, dynamic>> books) {
  // 번호를 입력받아 해당 id의 책이 있는지 확인
  // 있다면 isAvailable을 false로 변경
}

// 3. 나의 대여 목록 보기 (필터링 로직)
void showMyBorrowBooks(List<Map<String, dynamic>> books) {
  // isAvailable이 false인 데이터만 골라서 출력
}

// 4. 도서 반납 및 정산 (합산 및 수정 로직)
void returnBook(List<Map<String, dynamic>> books) {
  // 번호를 입력받아 isAvailable을 true로 변경
  // 해당 책의 price룰 출력하며 정산 완료 메시지
}
