import 'package:flutter_riverpod/flutter_riverpod.dart';

//autoDispose : 데이터를 캐싱하지 않고 필요 없으면 삭제한다 .
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});
