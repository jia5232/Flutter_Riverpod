import 'package:advanced_state/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue state = ref.watch(multipleFutureProvider);
    //FutureProvider에서 조회해온 값은 무조건 AsyncValue 타입이고,
    //AsyncValue 타입은 when()이라는 함수를 가져서 data, error, loading으로 구분해 함수를 실행하게 해준다.

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.when(
            //data : 로딩이 끝나 데이터가 있을 때 실행
            data: (data){ //data는 받아온 state값
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            },
            //error : 에러가 있을 때 실행
            error: (err, stack){
              return Text(err.toString());
            },
            //loading : 로딩이 되고있을 때 실행.
            loading: (){
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
