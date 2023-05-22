import 'package:flutter/material.dart';
import 'package:riverpods/layout/defalut_layout.dart';
import 'package:riverpods/screens/future_provider_screen.dart';
import 'package:riverpods/screens/state_notifier_provider.dart';
import 'package:riverpods/screens/state_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "HomeScreen",
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateProvider(),
                ),
              );
            },
            child: const Text("StateProvider"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateNotifierProviderScreen(),
                ),
              );
            },
            child: const Text("StateNotifierProviderScreen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FutureProviderScreen(),
                ),
              );
            },
            child: const Text("FutureProviderScreen"),
          )
        ],
      ),
    );
  }
}
