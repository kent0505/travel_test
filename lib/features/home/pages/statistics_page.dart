import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/title_text.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Flight statistics',
      body: Column(
        children: [
          SizedBox(height: 10),
          TitleText('Visited'),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
