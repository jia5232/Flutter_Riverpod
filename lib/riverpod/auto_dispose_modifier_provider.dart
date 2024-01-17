import 'package:flutter_riverpod/flutter_riverpod.dart';

//autoDispose -> 캐시를 자동으로 삭제하고 처음부터 다시 생성을 한다.
final autoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));

  return [1, 2, 3, 4, 5, 6, 7];
});