import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/flight.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({super.key, required this.flight});

  final Flight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.main,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextR(flight.departureCountry, fontSize: 24),
                    TextR(
                      flight.departureCity,
                      fontSize: 15,
                      color: AppColors.white70,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/date2.svg',
                    height: 37,
                  ),
                  const SizedBox(height: 5),
                  TextR(
                    getDateDiff(flight.departureDate, flight.arrivalDate),
                    fontSize: 15,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextR(flight.arrivalCountry, fontSize: 24),
                    TextR(
                      flight.arrivalCity,
                      fontSize: 15,
                      color: AppColors.white70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Container(
              height: 25,
              width: 96,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: TextR(
                  'Departure',
                  fontSize: 13,
                ),
              ),
            ),
            const Spacer(),
            TextR(flight.departureDate, fontSize: 16),
            const SizedBox(width: 20),
            TextR(flight.departureTime, fontSize: 16),
          ],
        ),
        const SizedBox(height: 37),
        Row(
          children: [
            Container(
              height: 25,
              width: 96,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: TextR(
                  'Arrival',
                  fontSize: 13,
                ),
              ),
            ),
            const Spacer(),
            TextR(flight.arrivalDate, fontSize: 16),
            const SizedBox(width: 20),
            TextR(flight.arrivalTime, fontSize: 16),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.main,
            borderRadius: BorderRadius.circular(15),
          ),
          child: CuperButton(
            onPressed: () {},
            child: Row(
              children: [
                const SizedBox(width: 14),
                SvgPicture.asset('assets/plans.svg'),
                const SizedBox(width: 14),
                const TextR('Plans', fontSize: 24),
                const Spacer(),
                const TextR('>', fontSize: 32),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ),
        const SizedBox(height: 11),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.main,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CuperButton(
            onPressed: () {
              context.push('/flight-detail', extra: flight);
            },
            child: const Center(
              child: TextR(
                'See flight details',
                fontSize: 20,
                color: AppColors.red,
              ),
            ),
          ),
        ),
        const SizedBox(height: 11),
      ],
    );
  }
}
