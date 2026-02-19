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

// 프로그램 전체 루프
void runKioskProgram(
  List<Map<String, dynamic>> products,
  List<Map<String, dynamic>> cartList,
) {
  while (true) {
    print('========== 🍔 SMART KIOSK ==========');
    print('1. 메뉴 보기 (상품 목록)');
    print('2. 장바구니 담기');
    print('3. 장바구니 보기 및 수량 조절');
    print('4. 주문하기 (최종 결제)');
    print('0. 종료');
    print('=====================================');
    stdout.write('원하시는 메뉴의 숫자를 입력해주세요.');
    int? input = int.tryParse(stdin.readLineSync() ?? '');

    switch (input) {
      case 1:
        printProductList(products);
        break;

      case 2:
        addToCart(products, cartList);
        break;

      case 3:
        showCart(cartList);
        break;

      case 4:
        processOrder(cartList);
        break;

      case 0:
        print('프로그램을 종료합니다.');
        return;

      default:
        print('잘못된 메뉴선택 입니다. 다시 입력해주세요.');
        break;
    }
  }
}

// (유틸) 숫자 입력 함수
int readIntInput(String prompt) {
  // 사용자로부터 숫자를 안전하게 입력받으세요.
  while (true) {
    stdout.write('$prompt: ');
    // 문자열을 숫자로 반환하게 하기
    // int? input = int.tryParse(stdin.readLineSync() ?? '');
    String input = stdin.readLineSync() ?? '';
    int? value = int.tryParse(input);

    if (value != null && value > 0) {
      return value;
    }
    print('다시 입력해주세요.');
  }
}
// (유틸) 문자열 입력 함수. 빈값만 치는 경우를 방지하기 위해 쓰면 좋음. 여기서는 숫자만 입력받으면 되서 굳이 필요없음

// 이미 있는 메뉴(상품 목록) 출력 함수
void printProductList(List<Map<String, dynamic>> products) {
  // products 리스트를 순회하며 상품 정보를 출력하세요.
  // 리스트 안의 상품 정보를 하나씩 꺼내서 출력을 해야됨
  for (var prd in products) {
    print('${prd['id']}번: ${prd['name']} ${prd['price']}원');
  }
}

// 장바구니 담기 함수. todo앱의 수정로직과 같음!
void addToCart(
  List<Map<String, dynamic>> products,
  List<Map<String, dynamic>> cartList,
) {
  // 상품 번호를 입력받아 cartList를 업데이트하세요.
  int productId = readIntInput('장바구니에 담을 상품번호를 입력하세요.');
  // 1. 선택한 번호가 실제 상품목록 안에 있는지 확인
  // 맵의 변수를 만들어주고
  Map<String, dynamic>? selectProduct;
  for (var prd in products) {
    // 만약 입력한 상품번호가 목록의 제품 아이디와 같다면, 상품목록에 있는게 맞다.
    if (prd['id'] == productId) {
      selectProduct = prd;
      break;
    }
  }
  // 만약 입력한 상품번호가 목록의 제품 아이디에 없다면 존재하지 않음을 알려주고 종료한다.
  if (selectProduct == null) {
    print('존재하지 않는 상품정보 입니다. 다시 입력해주세요.');
    return;
  }

  // 2. 장바구니에 이미 이 상품이 있는지 확인하기. 있으면 기존 항목의 count만 1증가시키기
  bool isExist = false;
  for (var item in cartList) {
    if (item['name'] == selectProduct['name']) {
      // 이미 있다면
      item['count']++;
      isExist = true;
      print('${item['name']}의 수량이 추가되었습니다.');
      break;
    }
  }
  // 3. 장바구니에 없다면 추가하기
  if (!isExist) {
    cartList.add({
      'name': selectProduct['name'],
      'price': selectProduct['price'],
      'count': 1,
    });
    print('${selectProduct['name']}을 장바구니에 담았습니다.');
  }
}

// 장바구니 보기 및 수량 변경 함수
void showCart(List<Map<String, dynamic>> cartList) {
  // 장바구니 목록을 번호로 고르고 수량 수정 여부를 물어보기
  // 장바구니가 비어있는지 부터 확인
  if (cartList.isEmpty) {
    print('장바구니에 담긴 상품이 없습니다.');
    return;
  }
  // 현재 장바구니에 담긴 정보를 출력
  for (var i = 0; i < cartList.length; i++) {
    var item = cartList[i];
    // i + 1 사용자에게 1번부터 보여주기. 총 합이 얼마인지
    int subTotal = item['price'] * item['count'];
    print(
      '${i + 1}번 ${item['name']} | ${item['price']}원 | ${item['count']}개 | 소계: ${subTotal}원',
    );
  }
  // 수량변경 y/n 선택
  // y일 경우 상품 번호와 새 수량을 받아서 업데이트한다. 수량을 0으로 입력 시 해당 항목을 삭제
  stdout.write('수량을 변경하시겠습니까? (y/n)');
  String input = stdin.readLineSync()?.toLowerCase() ?? '';

  if (input == 'y') {
    // 상품 번호를 입력해서 선택.
    int itemNum = readIntInput('수량을 변경할 상품 번호를 입력해주세요.');
    // 컴퓨터가 이해하는 인덱스 번호로 변환한 것
    int index = itemNum - 1;

    // 입력한 번호가 장바구니 범위 안에 있는지 확인하기
    if (index >= 0 && index < cartList.length) {
      int newCount = readIntInput('새로운 수량을 입력하세요.(0 입력시 삭제)');

      if (newCount <= 0) {
        // Todo 삭제 로직과 동일함
        print('${cartList[index]['name']} 항목이 삭제되었습니다.');
        cartList.removeAt(index);
      } else {
        // 수정 로직 동일함.
        // newCount의 값을 리스트 안에 있는 목록 안 카운트의 값에 담아준다.
        cartList[index]['count'] = newCount;
        print('수량이 변경되었습니다.');
      }
    } else {
      print('잘못된 번호입니다.');
    }
  } else if (input == 'n') {
    print('수량변경이 취소되었습니다.');
    return;
  } else {
    print('잘못 입력하셨습니다. (y/n)중 선택해주세요.');
    return;
  }
}

// 주문 및 결제 함수
void processOrder(List<Map<String, dynamic>> cartList) {
  // 결제 로직을 구현하세요. 할인조건 총 액이 30,000원 이상이면 10% 할인 적용
  // 최종 결제 금액 출력하고 장바구니를 비우기
  // 장바구니가 비어있을 경우
  if (cartList.isEmpty) {
    print('결제할 상품이 없습니다.');
    return;
  }

  int total = 0;
  // 반복문으로 모든 상품 가격*수량 total에 더하기
  for (var i = 0; i < cartList.length; i++) {
    // 반복되는 카트리스트의 값을 아이템에 담아주고, 토탈값을 계산해준다.
    var item = cartList[i];
    total += (item['price'] as int) * (item['count'] as int);
  }
  print('최종합계: $total원 입니다.');
  // 할인적용
  if (total >= 30000) {
    total = (total * 0.9).toInt();
  }

  print('3만원 이상 구매시 10% 할인되어서 최종금액: $total원 입니다.');
  print('결제가 완료되었습니다. 이용해주셔서 감사합니다.');

  // 장바구니 비우기
  cartList.clear();
  return;
}
