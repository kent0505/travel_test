import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_test/core/widgets/dialogs/delete_dialog.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/jetlag/jetlag_bloc.dart';

class JetlagActiveCard extends StatelessWidget {
  const JetlagActiveCard({
    super.key,
    required this.arrival,
    required this.departure,
    required this.time,
  });

  final String arrival;
  final String departure;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextR(
            'To have to go to bed at',
            fontSize: 15,
            color: AppColors.white70,
          ),
          const Spacer(),
          TextR(time, fontSize: 48),
          const Spacer(),
          Row(
            children: [
              Container(
                height: 32,
                // width: 180,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    TextR(departure, fontSize: 16),
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/plane.svg'),
                    const SizedBox(width: 10),
                    TextR(departure, fontSize: 16),
                    const SizedBox(width: 6),
                  ],
                ),
              ),
              const Spacer(),
              CuperButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteDialog(
                        title: 'Stop?',
                        onYes: () {
                          context.read<JetlagBloc>().add(RemoveJetlagEvent());
                        },
                      );
                    },
                  );
                },
                minSize: 32,
                child: Container(
                  height: 32,
                  width: 58,
                  decoration: BoxDecoration(
                    color: AppColors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextR(
                      'Stop',
                      fontSize: 16,
                      color: AppColors.white70,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
