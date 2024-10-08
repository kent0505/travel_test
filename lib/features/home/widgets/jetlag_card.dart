import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class JetlagCard extends StatelessWidget {
  const JetlagCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/plane.svg'),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextR('Jetlag helper', fontSize: 16),
                    const SizedBox(height: 4),
                    TextR(
                      'Will help you to go bed in time for a better adaptation',
                      fontSize: 12,
                      maxLines: 3,
                      color: AppColors.white70,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
          const Spacer(),
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.red22,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CuperButton(
              onPressed: () {
                context.push('/jetlag');
              },
              child: const Center(
                child: TextR(
                  'Start Jetlag',
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
