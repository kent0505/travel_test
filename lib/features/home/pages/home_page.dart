import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Flights',
      home: true,
      body: Column(
        children: [
          TextR('aaa', fontSize: 20),
        ],
      ),
    );
  }
}
