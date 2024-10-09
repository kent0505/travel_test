import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/flight.dart';
import '../../../core/widgets/texts/text_r.dart';

class TransferCard extends StatelessWidget {
  const TransferCard({
    super.key,
    required this.flight,
    this.departure = true,
  });

  final Flight flight;
  final bool departure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Container(
            height: 25,
            width: 96,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Center(
              child: TextR(
                'Departure',
                fontSize: 13,
              ),
            ),
          ),
          const Spacer(),
          TextR(
            '${flight.transferCountry}, ${flight.transferCity}',
            fontSize: 24,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextR(
                      'Date',
                      fontSize: 15,
                      color: AppColors.white70,
                    ),
                    const SizedBox(height: 2),
                    TextR(
                      departure
                          ? flight.transferDepartureDate
                          : flight.transferArrivalDate,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextR(
                      'Time',
                      fontSize: 15,
                      color: AppColors.white70,
                    ),
                    const SizedBox(height: 2),
                    TextR(
                      departure
                          ? flight.transferDepartureTime
                          : flight.transferArrivalTime,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextR(
                      'Airport',
                      fontSize: 15,
                      color: AppColors.white70,
                    ),
                    const SizedBox(height: 2),
                    TextR(
                      flight.transferAirport,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
