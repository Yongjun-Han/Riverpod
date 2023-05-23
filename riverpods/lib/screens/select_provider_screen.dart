import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/layout/defalut_layout.dart';
import 'package:riverpods/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build");
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    ref.listen(selectProvider.select((value) => value.hasBought),
        (previous, next) {
      print(next);
    });
    return DefaultLayout(
        title: "selectProvider",
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.toString()),
              // Text(state.name),
              // Text(state.isSpicy.toString()),
              // Text(state.hasBought.toString()),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleIsSpicy();
                },
                child: const Text("spciy toggle"),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleHasBought();
                },
                child: const Text("hasBought toggle"),
              )
            ],
          ),
        ));
  }
}
