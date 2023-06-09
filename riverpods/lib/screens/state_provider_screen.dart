import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/layout/defalut_layout.dart';
import 'package:riverpods/riverpod/state_provider.dart';

class StateProvider extends ConsumerWidget {
  const StateProvider({super.key});

  @override
  //ref를 통해 선언해둔 riverpod provider에 접근한다.
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    //ref.read, listen, watch 3가지 주로사용
    //watch 는 무언가 변경되었을때 새로 build를 하고 싶을때 사용
    return DefaultLayout(
      title: "StateProvider",
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update((state) => state + 1);
                //state = 선언해둔 provider의 함수, 즉 현재상태 0
                //무언가 했을때 실행되는 경우는 read, ui에 반영을 하는 경우는 watch
                // 값을 바꿀때는 notifier update
              },
              child: const Text("UPUP"),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state =
                    ref.read(numberProvider.notifier).state - 1;
              },
              child: const Text("DOWN"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const _NextScreen(),
                  ),
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: "StateProvider",
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: const Text("UP"),
            ),
          ],
        ),
      ),
    );
  }
}
