import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider를 생성할때, 생성하는 순간에 어떤 변수를 입력해서 그 변수로 provider안의 로직을 변경해야한다면 familt modifier를 쓴다.
final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});