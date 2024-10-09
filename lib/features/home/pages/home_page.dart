import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/jetlag/jetlag_bloc.dart';
import '../widgets/flight_card.dart';
import '../widgets/jetlag_active_card.dart';
import '../widgets/jetlag_card.dart';
import '../widgets/no_data.dart';
import '../widgets/statistics_button.dart';
import '../widgets/statistics_card.dart';
import '../widgets/title_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Flights',
      home: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const TitleText('Your flight'),
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
          const TitleText('Jetlag'),
          const SizedBox(height: 10),
          BlocBuilder<JetlagBloc, JetlagState>(
            builder: (context, state) {
              if (state is JetlagLoadedState) {
                if (state.time.isEmpty) {
                  return const JetlagCard();
                } else {
                  return JetlagActiveCard(
                    arrival: state.arrival,
                    departure: state.departure,
                    time: state.time,
                  );
                }
              }
              return Container();
            },
          ),
          const SizedBox(height: 10),
          const StatisticsButton(),
          const SizedBox(height: 10),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Row(
                children: [
                  StatisticsCard(
                    id: 1,
                    title: 'Visited',
                    value: getVisitedCities().length == 1
                        ? '${getVisitedCities().length} country'
                        : '${getVisitedCities().length} countries',
                  ),
                  const SizedBox(width: 13),
                  StatisticsCard(
                    id: 2,
                    title: 'Spend in flight',
                    value: '${getTotalHours()} hours',
                  ),
                  const SizedBox(width: 13),
                  StatisticsCard(
                    id: 3,
                    title: 'The largest flight to',
                    value: '${getLargestHour()} hours',
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 20 + getBottom(context)),
        ],
      ),
    );
  }
}
