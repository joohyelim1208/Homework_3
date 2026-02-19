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

// 프로그램 전체 루프
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
        break;
    }
  }
}

// 유틸. 안전한 숫자입력 함수
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

// 영화목록 출력
void printMovieList(List<Map<String, dynamic>> movies) {
  print('\n[영화 목록]');
  if (movies.isEmpty) {
    print('리스트가 비어있습니다.');
    return;
  }
  // movies를 순회하면서 id / title / price / availableSeats 출력하세요.
  for (var movie in movies) {
    print(
      '${movie['id']}번: ${movie['title']} | 가격: ${movie['price']}원 | 예매가능좌석: ${movie['availableSeats']}',
    );
  }
}

// 예매 담기
void addToCart(
  List<Map<String, dynamic>> movies,
  List<Map<String, dynamic>> cartList,
) {
  print('\n[예매 담기]');

  int movieId = readIntInput('예매할 영화 번호를 입력하세요');

  // movieId에 해당하는 영화가 실제로 존재하는지 확인하세요.
  // 없다면 안내 후 return. 영화번호를 입력했을 때 리스트 안에 없는지
  Map<String, dynamic>? selectMovie;
  for (var mId in movies) {
    if (mId['id'] == movieId) {
      selectMovie = mId;
      print('예매 가능한 영화입니다.');
      break;
    }
  }
  if (selectMovie == null) {
    print('잘못 입력하셨습니다. 다시 입력해주세요.');
    return;
  }

  int ticketCount = readIntInput('예매할 매수를 입력하세요');
  // 유효성 검사
  if (ticketCount <= 0) {
    // ticketCount는 1 이상만 허용하세요.
    print('티켓은 1장 이상 예매해주세요.');
    return;
  }

  // 중복검사. 상태관리 로직
  // 이미 cartList에 같은 영화가 있는지 확인하세요. 있다면 기존 count에 누적하세요.
  int existItem = cartList.indexWhere(
    (item) => item['id'] == selectMovie!['id'],
  );
  // 조건에 맞는 요소의 인덱스를 반환하고 없으면 -1 반환. 리스트의 인덱스 시작 번호는 0이기 때문. 삼항연산자 사용
  // 이미 카트에 있는 경우
  int currentInCart = (existItem != -1) ? cartList[existItem]['count'] : 0;
  int totalCount = currentInCart + ticketCount;

  // 수량체크
  // 남은 좌석(availableSeats)을 초과하지 못하도록 하세요.
  // (이미 담긴 수량 + 새 요청 수량 <= availableSeats)
  if (totalCount > selectMovie['availableSeats']) {
    // ! (남은 좌석수 부분 출력을 제대로 수정함)
    var leftSeats = selectMovie['availableSeats'] - currentInCart;
    print('잔여 좌석수를 초과했습니다.');
    print('남은 좌석 수: $leftSeats');
    return;
  }

  // 업데이트
  // cartList에 '추가' 또는 '수정' 후 안내 문구 출력
  if (existItem != -1) {
    // 수정. 같은 아이템의 카운트에 총 합 값을 넣어줌
    cartList[existItem]['count'] = totalCount;
  } else {
    // 추가 cartList.add(totalCount); // 맵 형태로 넣어야 됨
    cartList.add({
      'id': selectMovie['id'],
      'title': selectMovie['title'],
      'price': selectMovie['price'],
      // 추가하는거니까!
      'count': ticketCount,
    });
  }
  print('${selectMovie['title']} $ticketCount매를 담았습니다.');
}

// 예매 목록 보기 및 수정/취소
void showCart(
  List<Map<String, dynamic>> movies,
  List<Map<String, dynamic>> cartList,
) {
  if (cartList.isEmpty) {
    print('예매된 항목이 없습니다.');
    return;
  }

  print('\n[예매 목록]');
  // cartList를 순회하며
  // 번호 / 제목 / 가격 / 수량 / 소계 출력
  // 카트안의 아이템 수 만큼 출력함
  for (var i = 0; i < cartList.length; i++) {
    var item = cartList[i];
    print(
      // ! (위에서 카트리스트에 추가한 부분은 availableSeats이 아니라 count여서 수정을 해주었다.)원본 데이터 구조와 내가 만든 데이터 구조를 혼동함
      // class를 사용해서 이름을 고정하지만 Map에서는 어떤 이름을 썼는지 확인하는 습관이 중요
      '${item['id']}번: ${item['title']} | 가격: ${item['price']} | 선택 좌석수: ${item['count']}',
    );

    stdout.write('수량을 변경하시겠습니까? (y/n): ');
    String input = stdin.readLineSync()?.toLowerCase() ?? '';

    if (input == 'y') {
      int itemNumber = readIntInput('변경할 항목 번호를 입력하세요');
      // 인덱스번호로 바꾸기
      int index = itemNumber - 1;

      // itemNumber가 범위 안에 있는지 확인
      if (index >= 0 && index < cartList.length) {
        int newCount = readIntInput('새로운 수량 입력 (0 입력 시 삭제)');
        // newCount == 0 이면 해당 항목 삭제
        if (newCount <= 0) {
          print('${cartList[index]['title']} 항목이 삭제되었습니다.');
          cartList.removeAt(index);
        } else {
          // ! (잔여좌석 초과 시. 리스트에서 해당 영화의 남은 좌석수를 찾아서 담아준다.)
          // 조건에 맞는 첫번째 데이터를 찾아줌
          var leftSeats = movies.firstWhere(
            (item) => item['id'] == cartList[index]['id'],
          );

          if (newCount > leftSeats['availableSeats']) {
            print(
              '남은 잔여 좌석 수: ${leftSeats['availableSeats']} 보다 예매요청 수량이 더 많습니다.\n다시 입력해주세요.',
            );
          } else {
            // 1 이상이면 새로운 항목 추가해주기
            cartList[index]['count'] = newCount;
            print('수량이 변경되었습니다.');
          }
        }
      }
    } else if (input == 'n') {
      print('수량변경을 취소합니다.');
      return;
    } else {
      print('잘못된 입력입니다.');
    }
  }
}

// 결제하기
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

  // 반복문으로 총 금액 계산
  for (var i = 0; i < cartList.length; i++) {
    // 반복되는 카트리스트 값을 아이템에 담아주고 토탈계산
    var item = cartList[i];
    total += (item['price'] as int) * (item['count'] as int);
  }
  print('총 결제 금액: $total원 입니다.');

  // 할인 정책 적용
  // 50000원 이상 → 10% | 30000원 이상 → 5% | 그 외 → 할인 없음 | 할인 후 최종 금액 출력
  if (total >= 50000) {
    total = (total * 0.9).toInt();
  } else if (total >= 30000) {
    total = (total * 0.95).toInt();
  }
  print('50000원 이상 → 10% | 30000원 이상 → 5% | 그 외 → 할인 없음');
  print('할인 시 총 결제 금액: $total원 입니다.');

  stdout.write('결제하시겠습니까? (y/n): ');
  String confirm = stdin.readLineSync()?.toLowerCase() ?? '';

  if (confirm == 'y') {
    // movies의 availableSeats를 cartList 수량만큼 차감
    // movies에서 리스트안의 항목을 가져온 다음, 카트리스트의 아이템 만큼 차감을 해야됨

    // ! (이 코드는 모든 영화에서 카트에 있는 모든 수량을 다 빼버림)
    // for (var movie in movies) {
    //   for (var item in cartList) {
    //     movie['availableSeats'] -= item['count'];
    //   }
    // }

    // 카트에 있는 항목만 하나씩 꺼내서 그 항목과 id가 같은 영화만 찾아서 빼야됨
    for (var item in cartList) {
      for (var movie in movies) {
        movie['availableSeats'] -= item['count'];
      }
    }

    // 결제 완료 메시지 출력
    print('영화예매 결제가 완료 되었습니다.');
    cartList.clear();
    return;
  } else {
    print('결제가 취소되었습니다.');
  }
}
