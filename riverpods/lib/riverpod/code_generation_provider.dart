import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// a. 어떤 provider를 사용할지에 대한 고민을 없애기 위해
// StateNotifierProvider 은 명시적으로 가능

final _testProvider = Provider<String>((ref) => "hello codegernatrion");

@riverpod
String gState(GStateRef ref) {
  return "hello codegernatrion";
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return 10;
}

// 기본값이 autodispose 를 해제하려면 @Riverpod으로
@Riverpod(
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return 10;
}

//flutter pub run build_runner build
// 사용할 provider는 빌드후 생성된 함수명+Provider

// b. Parameter > 클래스를 쓰지 않고 familyModifierProvider 에서의 파라미터를 일반 함수처럼 사용할 수 있도록
class Parameter {
  final int num1;
  final int num2;

  Parameter({required this.num1, required this.num2});
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.num1 * parameter.num2,
);

@riverpod
int gStateMultiply(
  GStateMultiplyRef ref, {
  required int num1,
  required int num2,
}) {
  return num1 * num2;
}

//_$
@riverpod
class GStateNotifier extends _$GStateNotifier {
  //build 함수에 초기 상태값을 지정해주어야한다
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
