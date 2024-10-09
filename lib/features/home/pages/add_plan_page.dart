import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_test/core/widgets/dialogs/delete_dialog.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/flight.dart';
import '../../../core/models/plan.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/title_text.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage({super.key, required this.flight});

  final Flight flight;

  @override
  State<AddPlanPage> createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  List<TextEditingController> controllers1 = [];
  List<TextEditingController> controllers2 = [];

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        ...controllers1,
        ...controllers2,
      ]);
    });
  }

  void onAdd() {
    controllers1.add(TextEditingController());
    controllers2.add(TextEditingController());
    checkActive();
  }

  void onRemove(int index) {
    controllers1.removeAt(index);
    controllers2.removeAt(index);
    checkActive();
  }

  void onDone() {
    context.read<HomeBloc>().add(
          EditFlightEvent(
            flight: Flight(
              id: widget.flight.id,
              departureCountry: widget.flight.departureCountry,
              departureCity: widget.flight.departureCity,
              departureAirport: widget.flight.departureAirport,
              departureDate: widget.flight.departureDate,
              departureTime: widget.flight.departureTime,
              arrivalCountry: widget.flight.arrivalCountry,
              arrivalCity: widget.flight.arrivalCity,
              arrivalAirport: widget.flight.arrivalAirport,
              arrivalDate: widget.flight.arrivalDate,
              arrivalTime: widget.flight.arrivalTime,
              transferCountry: widget.flight.transferCountry,
              transferCity: widget.flight.transferCity,
              transferAirport: widget.flight.transferAirport,
              transferDepartureDate: widget.flight.transferDepartureDate,
              transferDepartureTime: widget.flight.transferDepartureTime,
              transferArrivalDate: widget.flight.transferArrivalDate,
              transferArrivalTime: widget.flight.transferArrivalTime,
              plans: [
                ...List.generate(
                  controllers1.length,
                  (index) {
                    return Plan(
                      title: controllers1[index].text,
                      description: controllers2[index].text,
                    );
                  },
                ),
              ],
            ),
          ),
        );
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    for (Plan plan in widget.flight.plans) {
      controllers1.add(TextEditingController(text: plan.title));
      controllers2.add(TextEditingController(text: plan.description));
    }
    controllers1.add(TextEditingController());
    controllers2.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Your flight',
      subtitle: 'Add plans',
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 10),
          ...List.generate(
            controllers1.length,
            (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      TitleText('Plan ${index + 1}'),
                      const Spacer(),
                      if (index == 0 && widget.flight.plans.isNotEmpty)
                        CuperButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteDialog(
                                  title: 'Delete Plan?',
                                  onYes: () {
                                    controllers1.removeLast();
                                    controllers2.removeLast();
                                    onRemove(index);
                                    onDone();
                                  },
                                );
                              },
                            );
                          },
                          minSize: 20,
                          child: const TextR(
                            'Delete',
                            fontSize: 15,
                            color: AppColors.red,
                          ),
                        ),
                      if (index >= 1)
                        CuperButton(
                          onPressed: () {
                            onRemove(index);
                          },
                          minSize: 20,
                          child: const TextR(
                            'Remove',
                            fontSize: 15,
                            color: AppColors.red,
                          ),
                        ),
                      const SizedBox(width: 10),
                      CuperButton(
                        onPressed: onAdd,
                        minSize: 20,
                        child: const TextR(
                          'Add',
                          fontSize: 15,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TxtField(
                    controller: controllers1[index],
                    hintText: 'Title',
                    onChanged: checkActive,
                  ),
                  const SizedBox(height: 10),
                  TxtField(
                    controller: controllers2[index],
                    hintText: 'Discription',
                    multiline: true,
                    onChanged: checkActive,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          PrimaryButton(
            title: 'Done',
            active: active,
            onPressed: onDone,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
