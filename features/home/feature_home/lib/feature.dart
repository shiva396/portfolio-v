import 'package:feature_home/feature_main.dart';
import 'package:feature_home/widgets/type_writer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:vyuh_core/vyuh_core.dart';

final feature = FeatureDescriptor(
  name: 'home',
  title: 'Feature Home',
  description: 'The home page of portfolio app',
  icon: Icons.add_circle_outlined,
  routes: () async {
    return [
      GoRoute(
          path: '/home',
          builder: (context, state) {
            return const _Counter();
          }),
    ];
  },
);

class _Counter extends StatefulWidget {
  const _Counter();

  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
  final counter = 0.obs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size(MediaQuery.of(context).size.width,
        //       MediaQuery.of(context).size.height * 0.3),
        //   child: Card(
        //     child: ListTile(
        //       leading: const Icon(
        //         Icons.code,
        //         size: 48,
        //       ),
        //       trailing: const Icon(Icons.chevron_right),
        //       title: const Text('Developer Tools'),
        //       subtitle: const Text('An X-ray vision of the Vyuh App'),
        //       onTap: () => vyuh.router.push('/developer'),
        //     ),
        //   ),
        // ),
        body: gotoMainPage());
  }
}
