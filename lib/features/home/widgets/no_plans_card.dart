import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class NoPlansCard extends StatelessWidget {
  const NoPlansCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 2),
          SvgPicture.asset('assets/plans.svg'),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextR(
                  'Add plans for free time',
                  fontSize: 16,
                ),
                const Spacer(),
                TextR(
                  'It seems that the transfer time is very long, add plans for this period.',
                  fontSize: 12,
                  maxLines: 2,
                  color: AppColors.white70,
                ),
              ],
            ),
          ),
          const SizedBox(width: 44),
        ],
      ),
    );
  }
}
