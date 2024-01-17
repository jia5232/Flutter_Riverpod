import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 provider를 사용할지 고민할 필요가 없도록 riverpod이 자동으로 결정해줌

final _testProvider = Provider<String>((ref) => 'Hello code generation');

@riverpod
String gState(GStateRef ref) {
  //넘겨줄 상태를 함수 형태로 관리하므로 매우 직관적이다!
  return 'Hello code generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

@Riverpod(
  //state를 살려둘거냐. 기본값은 false (autoDispose를 한다)
  keepAlive: true,
) //대문자 Riverpod 애노테이션에는 괄호가 필요!
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

// 2) parameter > Family 파라미터를 일반 함수처럼 사용할 수 있도록.
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.number1 * parameter.number2,
);

@riverpod
int gStateMultiply(GStateMultiplyRef ref, {
  required int number1,
  required int number2,
}) {
  return number1 * number2;
}

// 3) StateNotifierProvider -> GStateNotifier처럼 꼭 G로 시작할 필요는 없다!
@riverpod
class GStateNotifier extends _$GStateNotifier{
  @override
  int build(){
    return 0; //초기값은 0으로 설정!
  }

  increment(){
    state ++;
  }

  decrement(){
    state --;
  }
}