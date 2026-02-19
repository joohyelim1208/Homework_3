import 'dart:io';

// 메인 안에서는 출력만 하도록 한다.
void main() {
  List<int> scoreList = [];

  print('=== 학생 성적 관리 프로그램 ===');
  inputScores(scoreList);

  double averageScore = calculateAverage(scoreList);

  String grade = calculateGrade(averageScore);

  printResult(scoreList, averageScore, grade);
}

// 점수입력 함수
void inputScores(List<int> scoreList) {
  // 사용자로부터 점수를 여러개 입력 받는다. 반복문 사용
  // 입력한 점수들을 List<int>에 저장한다.
  while (true) {
    stdout.write('1. 점수를 입력하세요 (종료: 0) : ');
    int? score = int.tryParse(stdin.readLineSync() ?? '');
    // 입력한 값은 정수만 허용한다. 일단 소수점은 입력이 안됨
    // 숫자가 아닌 값이 오면 다시 처음으로 돌아간다.
    if (score == null) {
      print('숫자를 입력해 주세요.');
      // 와일문을 다시 처음부터 반복함. 기존 입력한 숫자들은 그대로 저장되어 있다!
      continue;
    } else if (score > 100) {
      print('100점이 최대 점수입니다. 올바른 점수를 입력해주세요.');
      continue;
    }
    // 0을 입력할 경우 종료한다.
    if (score == 0) {
      print('점수 입력을 종료합니다.');
      break;
    }
    // 리스트에 추가해주기. 리스트 안의 점수가 각 출력이 되어야 함
    // 그냥 추가하려면 score값이 널러블한 int라고 에러가 뜨는데 null을 받지 않도록 조건문으로 해결함
    scoreList.add(score);
  }
}

// 평균계산 함수
double calculateAverage(List<int> scoreList) {
  print('평균 학점을 계산합니다.');

  // 점수가 없을 경우! 0을 반환한다.
  if (scoreList.isEmpty) {
    print('등록된 점수가 없습니다.');
    return 0;
  }

  int sum = 0;
  // for문을 사용해서 리스트 안의 점수들을 꺼내서 합친 다음
  // 추가로 알면 좋을 부분: 좀 더 간단하게 표현할 수 있는 방법들을 알아보자
  for (var i = 0; i < scoreList.length; i++) {
    sum = sum + scoreList[i];
  }
  // 리스트의 개수로 나누면 평균이 나옴. 점수가 없을 경우에는 0을 반환
  double averageScore = sum / scoreList.length;
  //print('평균: $averageScore');
  // 계산된 결과값을 외부 main으로 돌려줌
  return averageScore;
}

// 학점계산 함수
String calculateGrade(double averageScore) {
  print('평균학점에 따른 등급입니다.');
  // 평균점수를 기준으로 학점을 반환함. 학점의 기준에 따라 등급이 매겨짐
  if (averageScore >= 90) {
    return 'A';
  } else if (averageScore >= 80) {
    return 'B';
  } else if (averageScore >= 70) {
    return 'C';
  } else if (averageScore >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

// 결과출력 함수
void printResult(List<int> scoreList, double averageScore, String grade) {
  // 수정할 부분: 예시대로 입력한 점수목록을 수직으로 출력하면 좋다.
  print('입력한 점수 목록:\n$scoreList');

  // 수정할 부분: 소수점 한자리까지 출력해야 된다!
  print('평균: ${averageScore.toInt()}');
  print('학점: $grade');
}
