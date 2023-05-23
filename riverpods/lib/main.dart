import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/riverpod/provider_observer.dart';
import 'package:riverpods/screens/home.dart';

void main() {
  runApp(
    //provider를 사용하려면 최상위 materialapp 을 감싸주어야 한다
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
