import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/layout/defalut_layout.dart';
import 'package:riverpods/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build!");
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      num1: 10,
      num2: 20,
    ));

    return DefaultLayout(
        title: "CodeGenerationScreen",
        body: Column(
          children: [
            Text("state1 : $state1"),
            state2.when(
              data: (data) {
                return Text(
                  "state2: ${data.toString()}",
                  textAlign: TextAlign.center,
                );
              },
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
            state3.when(
              data: (data) {
                return Text(
                  "state3: ${data.toString()}",
                  textAlign: TextAlign.center,
                );
              },
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
            Text("state4: $state4"),
            Consumer(
              // 전체를 빌드하지 않고 해당하는 위젯만 빌드함
              builder: (context, ref, child) {
                print("builder build");
                final state5 = ref.watch(gStateNotifierProvider);
                return Row(
                  children: [
                    Text("state5: $state5"),
                    if (child != null) child,
                  ],
                );
              },
              //Consumer Widget의 child parameter
              //-> Consumer Widget의 Builder parameter의 child 에 그대로 제공이 된다
              //->재 렌더링필요가 없는 위젯의 경우
              child: const Text("개"),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).increment();
                  },
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).decrement();
                  },
                  child: const Text("-"),
                ),
              ],
            ),
            //invalidate(): 유효하지 않게 하다 : 초기화 상태로 돌아간다
            ElevatedButton(
              onPressed: () {
                ref.invalidate(gStateNotifierProvider);
              },
              child: const Text("Invalidate"),
            )
          ],
        ));
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);

    return Text("state5: $state5");
  }
}
