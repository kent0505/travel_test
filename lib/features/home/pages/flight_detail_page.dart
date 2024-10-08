import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/flight.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 4),
          Container(
            height: 65,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
            decoration: const BoxDecoration(
              color: AppColors.main,
            ),
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
          TabBar(
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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(child: Text('Car Tab Content')),
                Center(child: Text('Transit Tab Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
