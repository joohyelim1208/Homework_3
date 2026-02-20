import 'dart:io';

void main() {
  /// 🎬 영화 목록 초기 데이터 세팅
  final List<Map<String, dynamic>> movies = [
    {'id': 1, 'title': '인터스텔라', 'price': 12000, 'availableSeats': 20},
    {'id': 2, 'title': '듄', 'price': 14000, 'availableSeats': 10},
    {'id': 3, 'title': '범죄도시', 'price': 11000, 'availableSeats': 15},
    {'id': 4, 'title': '아바타', 'price': 15000, 'availableSeats': 8},
  ];

  /// 예매 바구니
  List<Map<String, dynamic>> cartList = [];

  runMovieKioskProgram(movies, cartList);
}

/// 🎟️ 프로그램 전체 루프
void runMovieKioskProgram(
  List<Map<String, dynamic>> movies,
  List<Map<String, dynamic>> cartList,
) {
  while (true) {
    print('\n========== 🎟️ MOVIE KIOSK ==========');
    print('1. 영화 목록 보기');
    print('2. 예매 담기');
    print('3. 예매 목록 보기 및 수량 변경/취소');
    print('4. 결제하기');
    print('0. 종료');
    print('=====================================');

    int? input = int.tryParse(stdin.readLineSync() ?? '');

    switch (input) {
      case 1:
        printMovieList(movies);
        break;
      case 2:
        addToCart(movies, cartList);
        break;
      case 3:
        showCart(movies, cartList);
        break;
      case 4:
        processPayment(movies, cartList);
        break;
      case 0:
        print('프로그램을 종료합니다.');
        return;
      default:
        print('잘못된 입력입니다.');
    }
  }
}

/// 🔢 안전한 숫자 입력 함수
int readIntInput(String prompt) {
  while (true) {
    stdout.write('$prompt: ');
    String input = stdin.readLineSync() ?? '';
    int? value = int.tryParse(input);

    if (value != null) {
      return value;
    }

    print('숫자를 다시 입력해주세요.');
  }
}

/// 🎬 영화 목록 출력
void printMovieList(List<Map<String, dynamic>> movies) {
  print('\n[영화 목록]');
  // movies를 순회하면서
  // id / title / price / availableSeats 출력하세요.
  if (movies.isEmpty) {
    print('영화 리스트가 비어있습니다.');
    return;
  }
  for (var movie in movies) {
    print(
      '${movie['id']}번: ${movie['title']} | 가격: ${movie['price']}원 | 예매가능좌석: ${movie['availableSeats']}',
    );
  }
}

/// 🛒 예매 담기
void addToCart(
  List<Map<String, dynamic>> movies,
  List<Map<String, dynamic>> cartList,
) {
  print('\n[예매 담기]');

  int movieId = readIntInput('예매할 영화 번호를 입력하세요');

  // 1: movieId에 해당하는 영화가 실제로 존재하는지 확인하세요. 없다면 안내 후 return
  Map<String, dynamic>? selectMovie;
  for (var movId in movies) {
    if (movId['id'] == movieId) {
      selectMovie = movId;
      print('예매 가능한 영화입니다.');
      break;
    }
  }
  if (selectMovie == null) {
    print('잘못 입력하셨습니다. 다시 입력해주세요.');
    return;
  }

  int ticketCount = readIntInput('예매할 매수를 입력하세요');
  // 2: ticketCount는 1 이상만 허용하세요.
  if (ticketCount <= 0) {
    print('티켓은 1장 이상 예매해주세요.');
  }
  // 3: 이미 cartList에 같은 영화가 있는지 확인하세요. 있다면 기존 count에 누적하세요.
  int existItem = cartList.indexWhere(
    (item) => item['id'] == selectMovie!['id'],
  );
  // 조건이 참일경우 인덱스를 반환, 거짓일 경우 -1반환. 리스트의 인덱스는 0부터 시작이니까
  int currentInCart = (existItem != -1) ? cartList[existItem]['count'] : 0;
  print('@@$currentInCart');
  int totalCount = currentInCart + ticketCount;
  print('@@$totalCount');

  // 4: 남은 좌석(availableSeats)을 초과하지 못하도록 하세요. (이미 담긴 수량 + 새 요청 수량 <= availableSeats)
  if (totalCount > selectMovie['availableSeats']) {
    print('잔여 좌석수를 초과했습니다.');
    print('현재 예매 가능 좌석 수: ${selectMovie['availableSeats']}석');
    return;
  }
  // 5: cartList에 추가 또는 수정 후 안내 문구 출력
  if (existItem != -1) {
    // 이미 카트에 있다면 수량만 추가하기
    cartList[existItem]['count'] = totalCount;
    print('장바구니의 ${selectMovie['title']} 수량을 $totalCount매로 변경했습니다.');
  } else {
    // 카트에 없다면 새로 추가하기!
    cartList.add({
      'id': selectMovie['id'],
      'title': selectMovie['title'],
      'price': selectMovie['price'],
      'count': ticketCount,
    });
  }
  print('추가된 티켓은 ${selectMovie['title']} $ticketCount매 입니다.');
}

/// 📋 예매 목록 보기 및 수정/취소
void showCart(
  List<Map<String, dynamic>> movies,
  List<Map<String, dynamic>> cartList,
) {
  if (cartList.isEmpty) {
    print('예매된 항목이 없습니다.');
    return;
  }

  print('\n[예매 목록]');
  // cartList를 순회하며 번호 / 제목 / 가격 / 수량 / 소계 출력
  for (var i = 0; i < cartList.length; i++) {
    var item = cartList[i];
    var itemCount = item['price'] * item['count'];
    print(
      // item 대신 i+1을 사용해 리스트안에 순차적인 번호를 부여한다.
      '${i + 1}번: ${item['title']} | 가격: ${item['price']}원 | 선택 좌석 수: ${item['count']}매 | 합계: $itemCount원',
    );
  }

  stdout.write('수량을 변경하시겠습니까? (y/n): ');
  String input = stdin.readLineSync()?.toLowerCase() ?? '';

  if (input == 'y') {
    int itemNumber = readIntInput('변경할 항목 번호를 입력하세요');
    // 컴퓨터 언어 인덱스로 변경
    int index = itemNumber - 1;

    // 1: itemNumber가 범위 안에 있는지 확인
    if (index >= 0 && index < cartList.length) {
      int newCount = readIntInput('변경할 수량 입력 (0 입력 시 삭제)');
      // 2: newCount == 0 이면 해당 항목 삭제
      if (newCount <= 0) {
        // 삭제하기 전 변수에 미리 저장해두어야 삭제 후에도 이름을 기억해서 출력한다.
        String deletedTitle = cartList[index]['title'];
        // 변수에 저장한게 없을 경우, 다른 아이템이 뒤에 있다면 지워진 자리로 온 엉뚱한 다른 타이틀이 출력됨
        cartList.removeAt(index);
        // 저장해둔 이름을 출력
        print('$deletedTitle 항목이 삭제되었습니다.');
      } else {
        // 수량이 1 이상이면 수량 변경
        // 원본 movies에서 해당 아이디를 찾아서 남은 좌석을 체크하고, 잔여좌석 초과/변경가능 조건문
        var leftSeats = movies.firstWhere(
          (item) => item['id'] == cartList[index]['id'],
        );
        if (newCount > leftSeats['availableSeats']) {
          print('남은 잔여 좌석 수: ${leftSeats['availableSeats']}매 이내로 다시 입력해주세요.');
        } else {
          // 1 이상일 때 카트리스트에 뉴카운트 값이 담겨서 출력된다.
          cartList[index]['count'] = newCount;
          print('${cartList[index]['title']}의 수량이 $newCount매로 변경되었습니다.');
        }
      }
    } else {
      print('잘못된 항목 번호입니다.');
      return;
    }

    // 3: 1 이상이면 수량 변경. 단, 남은 좌석 초과 금지
  } else if (input == 'n') {
    print('변경이 취소되었습니다.');
    return;
  } else {
    print('잘못된 입력입니다.');
  }
}

/// 💳 결제하기
void processPayment(
  List<Map<String, dynamic>> movies,
  List<Map<String, dynamic>> cartList,
) {
  if (cartList.isEmpty) {
    print('결제할 항목이 없습니다.');
    return;
  }

  print('\n[결제 진행]');

  int total = 0;

  // 1: 반복문으로 총 금액 계산
  // 반복되는 카트리스트 값을 담아주고 토탈 계산
  for (var i = 0; i < cartList.length; i++) {
    var item = cartList[i];
    // 장바구니 내의 가격과 수량을 곱한 값. as int: 타입캐스팅. 이 데이터의 정체는 int라고 '확정'짓는 것. 데이터타입 '변환'이 아니다.
    // dynamic은 무엇이든 들어갈 수 있기 때문에 컴퓨터는 숫자인지 문자인지 모름
    total += (item['price'] as int) * (item['count'] as int);
  }

  print('현재 금액: $total원 입니다.');

  // 2: 할인 정책 적용 50000원 이상 → 10% | 30000원 이상 → 5% | 그 외 → 할인 없음 | 할인 후 최종 금액 출력
  if (total >= 50000) {
    // toInt를 붙여주지 않으면 더블타입이라고 에러남
    total = (total * 0.9).toInt();
    print('5만원 이상 구매로 10% 할인이 적용되었습니다.');
  } else if (total >= 30000) {
    total = (total * 0.95).toInt();
    print('3만원 이상 구매로 5% 할인이 적용되었습니다.');
  }
  print('적용 후 총 금액: $total원 입니다.');

  stdout.write('결제하시겠습니까? (y/n): ');
  String confirm = stdin.readLineSync()?.toLowerCase() ?? '';

  if (confirm == 'y') {
    // 3: movies의 availableSeats를 cartList 수량만큼 차감
    // 카트의 항목 하나씩 꺼내서 그 해당항목의 영화만 원본리스트에서 차감되어야 함.
    for (var item in cartList) {
      // 원본리스트 안에서 카트리스트 아이템의 id와 일치하는 원본 영화를 찾는다.
      var subtractSeats = movies.firstWhere(
        (movie) => movie['id'] == item['id'],
      );

      // final price = int.tryParse().toString(); 인트타입이 확실하지 않다면 이렇게 해줘도 된다!
      // 찾은 원본 영화의 좌석을 차감 한다. 다이나믹 타입이어서 인트로 확정 지어줘야 에러가 나지 않음..
      subtractSeats['availableSeats'] =
          (subtractSeats['availableSeats'] as int) - (item['count'] as int);
    }
    // 4: 결제 완료 메시지 출력
    print('영화예매 결제가 완료되었습니다.');
    // 5: 카트리스트 비워주기
    cartList.clear();
    return;
  } else {
    print('결제가 취소되었습니다.');
  }
}
