import 'dart:io';

/*
📌 과제: 콘솔 기반 학생 성적 관리 프로그램 만들기

🎯 목표
- 사용자로부터 점수를 여러 개 입력받는다.
- 0을 입력하면 입력을 종료한다.
- 입력한 점수들의 평균을 계산한다.
- 평균에 따라 학점을 계산한다.
- 결과를 출력한다.

----------------------------------------

🧩 구현 요구사항

1️⃣ 점수 입력
- 점수를 계속 입력받는다.
- 0을 입력하면 종료한다.
- 입력값은 정수만 허용한다.
- 숫자가 아닌 값 입력 시 다시 입력받는다.

예시:
점수를 입력하세요 (종료: 0) : 80
점수를 입력하세요 (종료: 0) : 90
점수를 입력하세요 (종료: 0) : 70
점수를 입력하세요 (종료: 0) : 0

2️⃣ 입력한 점수들을 List<int>에 저장한다.

3️⃣ 평균 계산

4️⃣ 평균에 따라 학점 계산

학점 기준:
90 이상 -> A
80 이상 -> B
70 이상 -> C
60 이상 -> D
그 미만 -> F

5️⃣ 결과 출력

출력 예시:

입력한 점수 목록:
80
90
70

평균: 80.0
학점: B

----------------------------------------

📌 조건
- 모든 코드는 이 main.dart 파일 하나에 작성
- main 함수 안에는 흐름만 작성
- 반드시 아래 함수들을 구현할 것
- 반복문, 조건문, List, 함수 사용 필수
*/

void main() {
  List<int> scoreList = [];

  inputScores(scoreList);

  double averageScore = calculateAverage(scoreList);

  String grade = calculateGrade(averageScore);

  printResult(scoreList, averageScore, grade);
}

/*
📌 점수 입력 함수

- 사용자로부터 점수를 입력받는다.
- 0을 입력하면 종료한다.
- 입력받은 점수를 scoreList에 추가한다.
*/
void inputScores(List<int> scoreList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 평균 계산 함수

- scoreList에 있는 모든 점수의 평균을 계산한다.
- 점수가 하나도 없으면 0을 반환한다.
*/
double calculateAverage(List<int> scoreList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 학점 계산 함수

- 평균 점수를 기준으로 학점을 반환한다.
*/
String calculateGrade(double averageScore) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 결과 출력 함수

- 입력한 점수 목록 출력
- 평균 출력
- 학점 출력
*/
void printResult(List<int> scoreList, double averageScore, String grade) {
  //
}


***



2. 무한반복 프로그램

import 'dart:io';

/*
📌 과제: 콘솔 기반 할 일(TODO) 관리 프로그램 만들기

🎯 목표
- 사용자로부터 할 일을 입력받아 저장한다.
- 저장된 할 일 목록을 확인할 수 있다.
- 특정 번호의 할 일을 삭제할 수 있다.
- 프로그램을 종료할 수 있다.

----------------------------------------

🧩 프로그램 동작 방식

메뉴를 반복해서 보여준다.

===== TODO 프로그램 =====
1. 할 일 추가
2. 할 일 목록 보기
3. 할 일 삭제
0. 종료
========================

사용자가 번호를 입력하면 해당 기능을 실행한다.
0을 입력하면 프로그램을 종료한다.

----------------------------------------

1️⃣ 할 일 추가

- 문자열로 할 일을 입력받는다.
- 입력받은 내용을 List<String>에 저장한다.
- 빈 문자열은 저장하지 않는다.

예시:
추가할 할 일을 입력하세요: 운동하기

----------------------------------------

2️⃣ 할 일 목록 보기

- 저장된 모든 할 일을 번호와 함께 출력한다.

예시:
1. 운동하기
2. 책 읽기
3. 코딩 공부하기

- 만약 저장된 할 일이 없다면:
  "등록된 할 일이 없습니다." 출력

----------------------------------------

3️⃣ 할 일 삭제

- 삭제할 번호를 입력받는다.
- 해당 번호의 할 일을 삭제한다.
- 존재하지 않는 번호를 입력하면 안내 메시지 출력

예시:
삭제할 번호를 입력하세요: 2

----------------------------------------

📌 구현 조건

- 모든 코드는 이 main.dart 파일 하나에 작성
- 반드시 List<String> 사용
- 반드시 반복문 사용 (while)
- 반드시 조건문 사용 (if / switch)
- 반드시 함수 3개 이상으로 분리
- int.tryParse 사용하여 숫자 변환 처리
- null 처리 반드시 포함

----------------------------------------

📌 main 함수에는 흐름만 작성할 것
*/

void main() {
  List<String> todoList = [];

  runTodoProgram(todoList);
}

/*
📌 전체 프로그램을 실행하는 함수

- 메뉴를 반복 출력한다.
- 사용자 입력을 받아 기능을 실행한다.
*/
void runTodoProgram(List<String> todoList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 할 일 추가 함수

- 사용자로부터 문자열을 입력받는다.
- 빈 값이면 추가하지 않는다.
- 정상 입력이면 todoList에 추가한다.
*/
void addTodo(List<String> todoList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 할 일 목록 출력 함수

- 저장된 모든 할 일을 번호와 함께 출력한다.
- 비어있으면 안내 메시지 출력
*/
void printTodoList(List<String> todoList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 할 일 삭제 함수

- 삭제할 번호를 입력받는다.
- 해당 번호의 항목을 삭제한다.
- 잘못된 번호 입력 시 안내 메시지 출력
*/
void removeTodo(List<String> todoList) {
  // TODO: 구현
  throw UnimplementedError();
}



***



 import 'dart:io';

/*
📌 과제: 콘솔 기반 "간단 가계부" 프로그램 만들기 (난이도: 초급+)

🎯 목표
- 수입/지출 내역을 입력받아 저장한다.
- 저장된 내역을 목록으로 확인한다.
- 총 수입/총 지출/잔액을 계산해서 보여준다.
- 카테고리별(예: 식비/교통/쇼핑) 지출 합계를 보여준다.  ← (난이도 +1)

----------------------------------------

🧩 프로그램 동작 방식

메뉴를 반복해서 보여준다.

========== 가계부 ==========
1. 내역 추가 (수입/지출)
2. 전체 내역 보기
3. 요약 보기 (총 수입/총 지출/잔액)
4. 카테고리별 지출 합계 보기
0. 종료
============================

----------------------------------------

📦 저장 구조 (클래스 없이! 난이도는 조금만 올림)

- 내역 1개는 Map<String, dynamic> 로 표현한다.
- 모든 내역은 List<Map<String, dynamic>> 에 저장한다.

각 내역(Map)은 아래 키를 반드시 가진다:

- 'type'      : String  ('income' 또는 'expense')
- 'title'     : String  (예: "월급", "점심", "지하철")
- 'amount'    : int     (예: 12000)
- 'category'  : String  (예: "식비", "교통", "쇼핑")
- 'createdAt' : String  (예: "2026-02-13 14:20")  // 간단히 문자열로 저장

※ 날짜는 실제 DateTime을 써도 되지만, 초급+라서 문자열로 저장해도 OK

----------------------------------------

1️⃣ 내역 추가 (수입/지출)

입력 흐름:
- 유형을 입력: 1) 수입  2) 지출
- 제목(title) 입력 (빈 값 불가)
- 금액(amount) 입력 (양수 정수만 허용)
- 카테고리(category) 입력 (빈 값 불가)
- createdAt 은 현재 시간으로 자동 저장

예시:
유형을 선택하세요 (1:수입, 2:지출): 2
제목을 입력하세요: 점심
금액을 입력하세요: 9000
카테고리를 입력하세요(예: 식비/교통/쇼핑): 식비
저장 완료!

----------------------------------------

2️⃣ 전체 내역 보기

- 저장된 모든 내역을 번호와 함께 출력한다.
- 예시 출력 포맷(자유):
  1) [지출] 점심 - 9000원 (식비) / 2026-02-13 14:20

- 내역이 없으면:
  "저장된 내역이 없습니다."

----------------------------------------

3️⃣ 요약 보기

- 총 수입 합계
- 총 지출 합계
- 잔액 = 총 수입 - 총 지출

예시:
총 수입: 3000000원
총 지출: 45000원
잔액: 2955000원

----------------------------------------

4️⃣ 카테고리별 지출 합계 보기  (난이도 쪼~끔 업!)

- 지출(expense)만 대상으로 한다.
- category 별로 금액을 합산해서 출력한다.
- Map<String, int> 형태로 합계를 만들어도 된다.

예시:
[카테고리별 지출]
식비: 18000원
교통: 2500원
쇼핑: 15000원

----------------------------------------

📌 구현 조건

- 모든 코드는 이 main.dart 파일 하나에 작성
- 클래스 금지 (이번 과제는 Map/List로 연습)
- 반드시 List<Map<String, dynamic>> 사용
- 반드시 Map<String, int> (카테고리 합계) 사용
- 반복문(while) + switch 사용
- 함수 5개 이상으로 분리
- int.tryParse 사용
- null 처리 반드시 포함
- 금액은 0 이하 입력 시 다시 입력받기

----------------------------------------

📌 main 함수에는 흐름만 작성할 것
*/

void main() {
  final List<Map<String, dynamic>> ledgerEntryList = [];

  runLedgerProgram(ledgerEntryList);
}

/*
📌 프로그램 루프 함수
- 메뉴 출력
- 사용자 입력 처리
- switch로 기능 분기
*/
void runLedgerProgram(List<Map<String, dynamic>> ledgerEntryList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 메뉴 출력 함수
*/
void printMenu() {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 내역 추가 함수
- 수입/지출 선택
- title 입력
- amount 입력
- category 입력
- createdAt 저장
- ledgerEntryList에 Map으로 추가
*/
void addLedgerEntry(List<Map<String, dynamic>> ledgerEntryList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 전체 내역 출력 함수
*/
void printAllEntries(List<Map<String, dynamic>> ledgerEntryList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 요약 출력 함수
- 총 수입, 총 지출, 잔액 계산 및 출력
*/
void printSummary(List<Map<String, dynamic>> ledgerEntryList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 카테고리별 지출 합계 출력 함수
- 지출(expense)만 대상으로 category별 합산 후 출력
*/
void printExpenseSummaryByCategory(List<Map<String, dynamic>> ledgerEntryList) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 (유틸) 문자열 입력 받기
- prompt 출력
- null/빈 문자열이면 다시 입력받기 옵션 처리
*/
String readNonEmptyString({required String prompt}) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 (유틸) 양수 정수 입력 받기
- prompt 출력
- 숫자 변환 실패 or 0 이하이면 다시 입력받기
*/
int readPositiveInt({required String prompt}) {
  // TODO: 구현
  throw UnimplementedError();
}

/*
📌 (유틸) 현재 시간을 문자열로 만드는 함수
- 예: "2026-02-13 14:20"
- DateTime.now()를 사용해서 직접 포맷팅(패딩 포함)
*/
String buildNowTimestampString() {
  // TODO: 구현
  throw UnimplementedError();
}



***



📌 과제: 콘솔 기반 "스마트 키오스크(장바구니) 프로그램"
🎯 목표

상품 목록에서 메뉴를 골라 장바구니에 담는다.

장바구니에 담긴 상품의 수량을 조절하거나 삭제한다.

최종 주문 시 총액을 계산하고 할인 혜택을 적용한다.

🧩 프로그램 동작 방식
메뉴를 반복해서 보여줍니다.

Plaintext

========== 🍔 SMART KIOSK ==========
1. 메뉴 보기 (상품 목록)
2. 장바구니 담기
3. 장바구니 보기 및 수량 조절
4. 주문하기 (최종 결제)
0. 종료
=====================================
📦 데이터 구조 (Map/List 활용)
1️⃣ 상품 목록 (고정 데이터)

프로그램 시작 시 아래 3개 이상의 상품을 List<Map<String, dynamic>>에 넣어둡니다.

키: 'id'(int), 'name'(String), 'price'(int)

2️⃣ 장바구니 (사용자 입력 데이터)

List<Map<String, dynamic>> cartList에 저장합니다.

각 아이템은 아래 키를 가집니다:

'name' : 상품명

'price' : 단가

'count' : 수량 (기본 1)

🛠 주요 기능 요구사항
1️⃣ 메뉴 보기

준비된 상품 목록을 번호와 함께 출력합니다.

2️⃣ 장바구니 담기

상품 번호를 입력받아 cartList에 추가합니다.

(중요) 이미 장바구니에 있는 상품이라면 새로 추가하지 않고, 기존 항목의 'count'(수량)만 1 증가시킵니다. (데이터 흐름 이해의 핵심!)

3️⃣ 장바구니 보기 및 수량 조절

현재 담긴 상품명, 단가, 수량, 소계(단가 * 수량)를 출력합니다.

추가로 "수량을 변경하시겠습니까? (y/n)"를 물어보고, 'y'인 경우 상품 번호와 새 수량을 입력받아 업데이트합니다.

수량을 0으로 입력하면 해당 항목을 삭제합니다.

4️⃣ 주문하기 (최종 결제)

모든 상품의 총액을 계산합니다.

할인 조건: 총액이 30,000원 이상이면 10% 할인을 적용합니다.

최종 결제 금액을 출력하고 장바구니를 비웁니다.

📌 구현 조건
모든 코드는 main.dart 파일 하나에 작성합니다.

클래스 사용 금지 (Map과 List의 구조에 익숙해지는 것이 목적입니다).

함수를 6개 이상으로 분리하세요.

int.tryParse를 사용하여 잘못된 입력(문자 등) 시 예외 처리를 반드시 포함하세요.

main 함수에는 프로그램 전체 흐름만 작성하세요.

💻 시작 코드 (스켈레톤)
이 구조를 복사해서 // TODO 부분을 채워보세요.

Dart

import 'dart:io';

void main() {
  // 상품 목록 데이터 (초기 세팅)
  final List<Map<String, dynamic>> products = [
    {'id': 1, 'name': '불고기버거', 'price': 6500},
    {'id': 2, 'name': '치즈버거', 'price': 5500},
    {'id': 3, 'name': '감자튀김', 'price': 2500},
    {'id': 4, 'name': '콜라', 'price': 2000},
  ];

  // 장바구니 데이터
  List<Map<String, dynamic>> cartList = [];

  runKioskProgram(products, cartList);
}

/*
📌 프로그램 전체 루프
*/
void runKioskProgram(List<Map<String, dynamic>> products, List<Map<String, dynamic>> cartList) {
  // TODO: while문과 switch-case를 사용하여 메뉴를 구성하세요.
}

/*
📌 메뉴(상품 목록) 출력 함수
*/
void printProductList(List<Map<String, dynamic>> products) {
  // TODO: products 리스트를 순회하며 상품 정보를 출력하세요.
}

/*
📌 장바구니 담기 함수
- 상품 번호 입력 받기
- 이미 있다면 수량만 증가, 없다면 새로 추가
*/
void addToCart(List<Map<String, dynamic>> products, List<Map<String, dynamic>> cartList) {
  // TODO: 상품 번호를 입력받아 cartList를 업데이트하세요.
}

/*
📌 장바구니 보기 및 수량 변경 함수
- 현재 장바구니 내용 출력
- 수량 변경 로직 (0이면 삭제)
*/
void showCart(List<Map<String, dynamic>> cartList) {
  // TODO: 장바구니 목록을 보여주고 수량 수정 여부를 물어보세요.
}

/*
📌 주문 및 결제 함수
- 총액 계산 -> 할인 적용 -> 장바구니 비우기
*/
void processOrder(List<Map<String, dynamic>> cartList) {
  // TODO: 결제 로직을 구현하세요.
}

/*
📌 (유틸) 숫자 입력 함수
- 숫자 이외의 값 입력 시 재입력 요청
- 양수만 허용 등의 조건 추가 가능
*/
int readIntInput(String prompt) {
  // TODO: 사용자로부터 숫자를 안전하게 입력받으세요.
  throw UnimplementedError();
}
💡 힌트 및 응원
수량 증가 로직: cartList를 for문으로 돌면서 사용자가 선택한 상품 이름이 이미 존재하는지 먼저 확인하는 것이 포인트입니다.

ToDo 앱과의 연결: ToDo 앱에서 '완료 여부(isDone)'를 바꾸는 것이나, 이 예제에서 '수량(count)'을 바꾸는 것이나 결국 **"리스트 안의 특정 맵(Map) 데이터에 접근해 값을 수정하는 것"**으로 원리는 같습니다.



***



📚 과제: 콘솔 기반 "미니 도서 관리 시스템"
🎯 목표

도서 목록을 확인하고 특정 도서를 대여/반납한다.

현재 대여 중인 도서 목록과 총 대여 권수를 확인한다.

연체료(가상)를 계산하는 로직을 통해 합산 연습을 한다.

🧩 프로그램 동작 방식
Plaintext

========== 📖 도서 관리 시스템 ==========
1. 전체 도서 목록 보기
2. 도서 대여 (상태 변경)
3. 나의 대여 목록 보기 (필터링)
4. 도서 반납 및 정산
0. 종료
=========================================
📦 데이터 구조
1️⃣ 도서 데이터 (List<Map<String, dynamic>> books)

'id': int (1, 2, 3...)

'title': String (도서명)

'isAvailable': bool (true: 대여가능, false: 대여중) <- 가장 핵심!

'price': int (대여료, 예: 1000원)

🛠 구현 요구사항 (키오스크 예제와 비교해 보세요!)
1️⃣ 전체 도서 목록 보기

모든 책의 번호, 제목, 대여 가능 여부를 출력합니다.

예: 1. [대여가능] 클린코드 - 1000원

2️⃣ 도서 대여 (수정 로직)

책 번호를 입력받습니다.

해당 책이 있고, isAvailable이 true일 때만 대여 처리를 합니다.

대여 처리: 해당 책의 isAvailable을 false로 바꿉니다. (ToDo의 완료 체크와 동일)

3️⃣ 나의 대여 목록 보기 (필터링 로직)

books 리스트 중에서 isAvailable이 false인 책들만 찾아 출력합니다.

대여 중인 책이 없으면 "대여 중인 책이 없습니다."를 출력합니다.

4️⃣ 도서 반납 및 정산 (삭제 및 합산 로직)

대여 중인 책 번호를 입력받아 다시 isAvailable을 true로 바꿉니다.

반납할 때 해당 책의 price를 합산하여 "총 대여료 000원입니다"를 출력합니다.

💻 시작 코드 (스켈레톤)
이 코드를 복사해서 키오스크 예제에서 썼던 로직을 떠올리며 채워보세요.

💡 이번 예제의 포인트
Boolean 상태 변경: true를 false로 바꾸는 연습은 ToDo 앱의 isDone 필드를 다루는 것과 100% 일치합니다.

데이터 필터링: 전체 목록 중 특정 조건(isAvailable == false)만 골라내는 법을 배우면, ToDo 앱에서 "완료된 일만 보기" 기능을 쉽게 만들 수 있습니다.
