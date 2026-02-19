// 메인에는 함수의 흐름만 작성
import 'dart:io';

void main() {
  final List<Map<String, dynamic>> ledgerEntryList = [];

  runLedgerProgram(ledgerEntryList);
}

// 프로그램 루프 함수. 스위치로 각 함수를 연결해주는 역할
void runLedgerProgram(List<Map<String, dynamic>> ledgerEntryList) {
  while (true) {
    printMenu();

    stdout.write('원하시는 메뉴의 번호를 입력해주세요.');
    int? input = int.tryParse(stdin.readLineSync() ?? '');

    switch (input) {
      case 1:
        // 내역추가 수입지출
        addLedgerEntry(ledgerEntryList);
        break;

      case 2:
        // 전체내역 보기
        printAllEntries(ledgerEntryList);
        break;

      case 3:
        // 요약 보기 (총 수입/총 지출/잔액)
        printSummary(ledgerEntryList);
        break;

      case 4:
        // 카테고리별 지출 합계 보기
        printExpenseSummaryByCategory(ledgerEntryList);
        break;

      case 0:
        print('가계부 프로그램을 종료합니다.');
        return;

      default:
        print('잘못된 메뉴 입력입니다. 다시 입력해주세요.');
        break;
    }
  }
}

// 메뉴 출력 함수
void printMenu() {
  // 무엇을 도와줄지 선택지를 보여주는 역할
  print('========== 가계부 ==========');
  print('1. 내역 추가 (수입/지출)');
  print('2. 전체 내역 보기');
  print('3. 요약 보기 (총 수입/총 지출/잔액)');
  print('4. 카테고리별 지출 합계 보기');
  print('0. 종료');
  print('============================');
}

// 유틸리티: 공통으로 적용되는 반복되는 기능, 로직, 변환 등을 재사용하게 묶어놓은 함수
// (잘못된 입력을 걸러주는 역할)문자열 입력 받기. addLedgerEntry가 편해지려면 여기를 동작하도록 바꿔준다.
String readNonEmptyString({required String prompt}) {
  // prompt 출력, null/빈 문자열이면 다시 입력받기 옵션 처리. 올바른 입력값을 받도록 처리해야 함
  while (true) {
    // 사용자에게 어떤 값을 입력해야 될지 알려주고
    stdout.write('$prompt: ');
    String input = stdin.readLineSync() ?? '';
    // 입력값이 null이 아닐 때, 공백을 제거했을 때 비어있지 않은지 확인. 스페이스바만 입력한 경우에도
    if (input != null && input.trim().isNotEmpty) {
      // 올바른 입력값이면 반환하고 종료
      return input.trim();
    }
    print('올바르지 않은 입력값입니다. 다시 입력해주세요.');
  }
}

// (유틸) 양수 정수 입력 받기
int readPositiveInt({required String prompt}) {
  // 와일문을 써야됨
  while (true) {
    // prompt 출력, 숫자 변환 실패 or 0 이하이면 다시 입력받기.
    stdout.write('$prompt: ');
    String input = stdin.readLineSync() ?? '';
    // 문자열을 숫자로 변환 가능하게
    int? value = int.tryParse(input);

    if (value != null && value > 0) {
      return value;
    }
    print('올바르지 않은 입력값입니다. 다시 입력해주세요.');
  }
}

// (유틸) 현재 시간을 문자열로 만드는 함수(방법을 모르겠어서 참고함.)
String? buildNowTimestampString() {
  DateTime now = DateTime.now();
  // padLeft(2, '0')은 "1"월을 "01"월로 맞춰주는 아주 유용한 도구입니다.
  String y = now.year.toString();
  String m = now.month.toString().padLeft(2, '0');
  String d = now.day.toString().padLeft(2, '0');
  String h = now.hour.toString().padLeft(2, '0');
  String min = now.minute.toString().padLeft(2, '0');

  return '$y-$m-$d $h:$min'; // 반환 타입이 String이므로 return이 꼭 필요해요!
}

// 내역 추가 함수.수입/지출 선택-지출. 유틸 필터로 걸러진 깨끗한 데이터를 map으로 만들어 장부 List에 담는다.
void addLedgerEntry(List<Map<String, dynamic>> ledgerEntryList) {
  // 수입/지출 선택
  // 빈 값 불가, 정수만 허용. 리스트에 반환값을 변수에 담아서 넘겨줌!
  // 공통의 유틸리티 활용
  // 사용자가 아래 부분을 입력할 수 있게 만들고, 배열에 추가
  print('1. 수입 / 2. 지출');
  String typeInput = readNonEmptyString(prompt: '유형을 선택하세요. (1번 / 2번)');
  String type = (typeInput == '1') ? '수입' : '지출';
  //
  String title = readNonEmptyString(prompt: '내역명');
  int amount = readPositiveInt(prompt: '금액');
  String category = readNonEmptyString(prompt: '카테고리');
  String? createdAt = buildNowTimestampString(); // 수정해야됨!
  // 유틸함수 사용해서 4가지를 입력받고, 마지막은 현재시간으로 들어갈 수 있게

  // ledgerEntryList에 Map으로 추가
  Map<String, dynamic> addMap = {
    'type': type,
    'title': title,
    'amount': amount,
    'category': category,
    'createdAt': createdAt,
  };
  ledgerEntryList.add(addMap);
  // 사용자가 빈 값이나 잘못된 숫자를 입력했을 때 다시 물어보는 기능
}

// 전체 내역 출력 함수
void printAllEntries(List<Map<String, dynamic>> ledgerEntryList) {
  // 리스트가 비어있을 경우
  if (ledgerEntryList.isEmpty) {
    print('리스트가 비어있습니다.');
    return;
  }
  // 리스트 안의 내역들을 출력해야 함
  print('===== 전체 리스트 내역 =====');
  for (var entry in ledgerEntryList) {
    print(
      '[${entry['createdAt']}] [${entry['type']}] ${entry['title']} | ${entry['category']} | ${entry['amount']}원',
    );
  }
}

// 요약 출력 함수
void printSummary(List<Map<String, dynamic>> ledgerEntryList) {
  // 총 수입, 총 지출, 잔액 계산 및 출력
  // 총 수입은 리스트 안의 amount값들을 더하고, 지출은 빼서 최종 잔액을 계산
  int totalIncome = 0;
  int totalExpence = 0;

  for (var entry in ledgerEntryList) {
    if (entry['type'] == '수입') {
      // totalIncome += entry['amount'] as int; // as: 형변환. dynamic은 뭐든지 담을 수 있는 상자로 연산을 하려면 int타입만 가능하기 때문
      int amount = entry['amount'];
      totalIncome += amount;
    } else if (entry['type'] == '지출') {
      totalExpence += entry['amount'] as int;
    }
  }
}

// 카테고리별 지출 합계 출력 함수
void printExpenseSummaryByCategory(List<Map<String, dynamic>> ledgerEntryList) {
  // 지출(expense)만 대상으로 category별 합산 후 출력
  // map 각 카테고리 이름: 키, 금액: 값
  Map<String, int> categoryTotal = {};

  // 장부 전체의 리스트를 한번 씩 돈다.
  for (var entry in ledgerEntryList) {
    // 지출 내역만 계산
    if (entry['type'] == '지출') {
      // 현재 카테고리에서 이름과 지출만 꺼냄
      String category = entry['category'];
      int amount = entry['amount'] as int;

      // 이 카테고리가 맵에 등록이 되어있는지 확인
      if (categoryTotal.containsKey(category)) {
        // 이미 있다면 기존 금액에 현재 금액을 더한다. !: 확실히 이 값이 존재한다.
        categoryTotal[category] = categoryTotal[category]! + amount;
      } else {
        // 처음 나타난 카테고리면 현재 금액으로 새로 등록함
        categoryTotal[category] = amount;
      }
    }
  }
  // 지출내역이 하나도 없을 시
  if (categoryTotal.isEmpty) {
    print('지출내역이 없습니다.');
    return;
  }
  // 계산이 끝난 맵을 출력함
  categoryTotal.forEach((category, total) => print('[$category] : $total원'));
}
