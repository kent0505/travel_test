import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/plan.dart';
import '../../../core/widgets/texts/text_r.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({super.key, required this.plan});

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/plans.svg'),
            const SizedBox(width: 10),
            Expanded(
              child: TextR(plan.title, fontSize: 24),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 108,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
          decoration: BoxDecoration(
            color: AppColors.main,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextR(
            plan.description,
            fontSize: 15,
            maxLines: 4,
            color: AppColors.white70,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
