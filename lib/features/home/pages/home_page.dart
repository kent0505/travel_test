import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../widgets/no_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Flights',
      home: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextR(
              'Your flight',
              fontSize: 15,
              color: AppColors.white70,
            ),
            const SizedBox(height: 10),
            const NoData(),
            const SizedBox(height: 10),
            PrimaryButton(
              title: 'Add new flight',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            TextR(
              'Jetlag',
              fontSize: 15,
              color: AppColors.white70,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
