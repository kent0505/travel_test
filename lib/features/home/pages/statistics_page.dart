import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../widgets/title_text.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Flight statistics',
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 10),
          const TitleText('Visited'),
          const SizedBox(height: 10),
          ...List.generate(
            getVisitedCities().length,
            (index) {
              return _CityCard(city: getVisitedCities()[index].arrivalCity);
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _CityCard extends StatelessWidget {
  const _CityCard({required this.city});

  final String city;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          SvgPicture.asset(
            'assets/statis1.svg',
            color: AppColors.red,
          ),
          const SizedBox(width: 16),
          TextR(city, fontSize: 16),
        ],
      ),
    );
  }
}
