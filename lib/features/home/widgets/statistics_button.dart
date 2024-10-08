import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class StatisticsButton extends StatelessWidget {
  const StatisticsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: () {},
      minSize: 22,
      child: Row(
        children: [
          TextR(
            'Flight statistics',
            fontSize: 15,
            color: AppColors.white70,
          ),
          const Spacer(),
          TextR(
            '>',
            fontSize: 32,
            color: AppColors.white70,
          ),
        ],
      ),
    );
  }
}
