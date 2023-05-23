import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/layout/defalut_layout.dart';
import 'package:riverpods/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);
    return DefaultLayout(
        title: "StreamProviderScreen",
        body: Center(
          child: state.when(
              data: (data) => Text(data.toString()),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator()),
        ));
  }
}
