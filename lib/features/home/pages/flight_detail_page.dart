import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/flight.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/flight_detail_card.dart';
import '../widgets/title_text.dart';
import '../widgets/transfer_card.dart';

class FlightDetailPage extends StatefulWidget {
  const FlightDetailPage({super.key, required this.flight});

  final Flight flight;

  @override
  State<FlightDetailPage> createState() => _FlightDetailPageState();
}

class _FlightDetailPageState extends State<FlightDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;

  void onTabChanged() {
    setState(() {
      tabIndex = _tabController.index;
    });
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: 'Delete?',
          onYes: () {
            context
                .read<HomeBloc>()
                .add(DeleteFlightEvent(id: widget.flight.id));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(onTabChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Your flight',
      onDelete: onDelete,
      body: Column(
        children: [
          const SizedBox(height: 4),
          Container(
            height: 65,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
            color: AppColors.main,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextR(widget.flight.departureCountry, fontSize: 24),
                      TextR(
                        widget.flight.departureCity,
                        fontSize: 15,
                        color: AppColors.white70,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset('assets/plane.svg'),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextR(widget.flight.arrivalCountry, fontSize: 24),
                      TextR(
                        widget.flight.arrivalCity,
                        fontSize: 15,
                        color: AppColors.white70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 50,
            color: AppColors.main,
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.blue,
              tabs: [
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/flight.svg',
                        color: tabIndex == 0 ? AppColors.blue : AppColors.white,
                      ),
                      const SizedBox(width: 4),
                      const TextR('Flight', fontSize: 24),
                    ],
                  ),
                ),
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/plans.svg',
                        color: tabIndex == 1 ? AppColors.blue : AppColors.white,
                      ),
                      const SizedBox(width: 4),
                      const TextR('Plans', fontSize: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const TitleText('Flight info'),
                        const Spacer(),
                        CuperButton(
                          onPressed: () {
                            context.push('/edit-flight', extra: widget.flight);
                          },
                          minSize: 20,
                          child: const TextR(
                            'Edit',
                            fontSize: 15,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    FlightDetailCard(
                      flight: widget.flight,
                    ),
                    const SizedBox(height: 10),
                    FlightDetailCard(
                      flight: widget.flight,
                      departure: false,
                    ),
                    const SizedBox(height: 10),
                    if (widget.flight.transferAirport.isNotEmpty) ...[
                      Row(
                        children: [
                          const TitleText('Transfer info'),
                          const Spacer(),
                          CuperButton(
                            onPressed: () {},
                            minSize: 20,
                            child: const TextR(
                              'Edit',
                              fontSize: 15,
                              color: AppColors.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TransferCard(
                        flight: widget.flight,
                      ),
                      const SizedBox(height: 10),
                      TransferCard(
                        flight: widget.flight,
                        departure: true,
                      ),
                    ],
                    const SizedBox(height: 50),
                  ],
                ),
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const TitleText('Flight info'),
                        const Spacer(),
                        CuperButton(
                          onPressed: () {},
                          minSize: 20,
                          child: const TextR(
                            'Add plans',
                            fontSize: 15,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
