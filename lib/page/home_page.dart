// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:fuwa/view/page/home/home_page_drawer_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final services = ref.watch(AccountState.accountsProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Row(
        children: const [
          HomePageDrawerView(),
          Expanded(child: Center(child: Text('Hi'))),
        ],
      ),
    );
  }
}
