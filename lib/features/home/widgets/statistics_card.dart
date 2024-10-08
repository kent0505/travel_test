import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    super.key,
    required this.id,
    required this.title,
    required this.value,
  });

  final int id;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 126,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: TextR(
                title,
                fontSize: 13,
                maxLines: 2,
                textAlign: TextAlign.center,
                color: AppColors.white70,
              ),
            ),
            SvgPicture.asset('assets/statis$id.svg'),
            const Spacer(),
            TextR(value, fontSize: 16),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
