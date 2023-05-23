import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  //family provider 는 ref 뒤에 2번째 인자를 받아야 하며 리턴 타입도 추가해주어야 한다
  await Future.delayed(const Duration(seconds: 2));

  return List.generate(5, (index) => index * data);

  // return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});
