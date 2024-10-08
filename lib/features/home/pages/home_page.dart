import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_test/features/home/widgets/flight_card.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home_bloc.dart';
import '../widgets/no_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Flights',
      home: true,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              TextR(
                'Your flight',
                fontSize: 15,
                color: AppColors.white70,
              ),
              const Spacer(),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadedState) {
                    if (state.flights.isNotEmpty) {
                      return const TextR(
                        'All flights',
                        fontSize: 15,
                        color: AppColors.red,
                      );
                    }
                  }
                  return Container();
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadedState) {
                if (state.flights.isEmpty) {
                  return const NoData();
                }

                return Column(
                  children: [
                    ...List.generate(
                      state.flights.length,
                      (index) {
                        return FlightCard(flight: state.flights[index]);
                      },
                    ),
                  ],
                );
              }

              return Container();
            },
          ),
          PrimaryButton(
            title: 'Add new flight',
            onPressed: () {
              context.push('/add-departure');
            },
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
    );
  }
}
