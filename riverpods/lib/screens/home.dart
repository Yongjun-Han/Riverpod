import 'package:flutter/material.dart';
import 'package:riverpods/layout/defalut_layout.dart';
import 'package:riverpods/screens/auto_dispose_modifier_screen.dart';
import 'package:riverpods/screens/code_generation_screen.dart';
import 'package:riverpods/screens/family_modifier_screen.dart';
import 'package:riverpods/screens/future_provider_screen.dart';
import 'package:riverpods/screens/listen_provider_screen.dart';
import 'package:riverpods/screens/provider_screen.dart';
import 'package:riverpods/screens/select_provider_screen.dart';
import 'package:riverpods/screens/state_notifier_provider.dart';
import 'package:riverpods/screens/state_provider_screen.dart';
import 'package:riverpods/screens/stream_provider_screen.dart';

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
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StreamProviderScreen(),
                ),
              );
            },
            child: const Text("StreamProviderScreen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FamilyModifierScreen(),
                ),
              );
            },
            child: const Text("FamilyModifierScreen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AutoDisposeModifierScreen(),
                ),
              );
            },
            child: const Text("AutoDisposeModifier"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ListenProviderScreen(),
                ),
              );
            },
            child: const Text("ListenProvider"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SelectProviderScreen(),
                ),
              );
            },
            child: const Text("SelectProvider"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ProviderScreen(),
                ),
              );
            },
            child: const Text("ProviderScreen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CodeGenerationScreen(),
                ),
              );
            },
            child: const Text("CodeGeneration"),
          ),
        ],
      ),
    );
  }
}
