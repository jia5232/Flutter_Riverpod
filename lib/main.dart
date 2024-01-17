import 'package:advanced_state/riverpod/provider_observer.dart';
import 'package:advanced_state/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope( //ProviderScope가 최상위에 있어야만 상태관리 툴 사용가능!
      observers: [ //provider들을 관찰해주는 기능 (로그)
        Logger(),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}