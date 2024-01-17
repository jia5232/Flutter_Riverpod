import 'package:advanced_state/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));
    // final state5 = ref.watch(gStateNotifierProvider);

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        children: [
          Text("state1: $state1"),
          SizedBox(height: 20.0),
          state2.when(
            //data : 로딩이 끝나 데이터가 있을 때 실행
            data: (data) {
              //data는 받아온 state값
              return Text(
                "state2: $data",
                textAlign: TextAlign.center,
              );
            },
            //error : 에러가 있을 때 실행
            error: (err, stack) {
              return Text(err.toString());
            },
            //loading : 로딩이 되고있을 때 실행.
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          SizedBox(height: 20.0),
          state3.when(
            //data : 로딩이 끝나 데이터가 있을 때 실행
            data: (data) {
              //data는 받아온 state값
              return Text(
                "state3: $data",
                textAlign: TextAlign.center,
              );
            },
            //error : 에러가 있을 때 실행
            error: (err, stack) {
              return Text(err.toString());
            },
            //loading : 로딩이 되고있을 때 실행.
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          SizedBox(height: 20.0),
          Text('state4: $state4'),
          SizedBox(height: 20.0),
          // _StateFiveWidget(),
          Consumer( //마치 state5만을 위해서 새로 만든 위젯인 것처럼!
            builder: (context, ref, child) {
              print('builder build!');
              final state5 = ref.watch(gStateNotifierProvider);

              return Column(
                children: [
                  Text('state5: $state5'),
                  child!,
                  //Consumer위젯 안의 builder함수 안에서도 child는 다시 빌드하지 않는다!
                  //나머지는 다시 빌드하지 않고 state5만 새로 빌드해주는게 필요하니까!
                ],
              );
            },
            child: Text('hello!!!!!'),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    final s = ref.read(gStateNotifierProvider.notifier);
                    s.increment();
                  },
                  child: Text('state5 up')),
              SizedBox(width: 20.0),
              ElevatedButton(
                  onPressed: () {
                    final s = ref.read(gStateNotifierProvider.notifier);
                    s.decrement();
                  },
                  child: Text('state5 down')),
            ],
          ),
          // invalidate()
          // provider를 더 이상 유효하지 않게 하여 state를 초기 상태로 되돌린다!
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
              //gStateNotifierProvider를 더 이상 유효하지 않게 한다!
            },
            child: Text('invalidate'),
          ),
        ],
      ),
    );
  }
}

// build함수가 불필요하게 다시 불리는 비효율성을 개선하기 위해서 state5를 분리해서 별도의 ConsumerWidget으로 만들어줌.
// BUT! 고작 Text('state5: $state5') 이 한줄을 위해서 위젯을 다시 쓰는것도 비효율적이다!!
// 그래서 riverpod2에서 제공하게 된 기능이 바로 Consumer() 위젯.
class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);

    return Text('state5: $state5');
  }
}
