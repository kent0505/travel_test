import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/flight.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/date_field.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/title_text.dart';

class AddTransferPage extends StatefulWidget {
  const AddTransferPage({super.key, required this.flight});

  final Flight flight;

  @override
  State<AddTransferPage> createState() => _AddTransferPageState();
}

class _AddTransferPageState extends State<AddTransferPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();
  final controller7 = TextEditingController();

  bool transfer = false;
  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  void onNext() {
    setState(() {
      transfer = true;
    });
  }

  void onDone() {
    context.read<HomeBloc>().add(
          AddFlightEvent(
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
              transferCountry: controller1.text,
              transferCity: controller2.text,
              transferAirport: controller3.text,
              transferDepartureDate: controller4.text,
              transferDepartureTime: controller5.text,
              transferArrivalDate: controller6.text,
              transferArrivalTime: controller7.text,
            ),
          ),
        );
    context.pop();
    context.pop();
    context.pop();
  }

  void onSkip() {
    context.read<HomeBloc>().add(
          AddFlightEvent(
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
              transferCountry: '',
              transferCity: '',
              transferAirport: '',
              transferDepartureDate: '',
              transferDepartureTime: '',
              transferArrivalDate: '',
              transferArrivalTime: '',
            ),
          ),
        );
    context.pop();
    context.pop();
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    controller4.text = dateToString(DateTime.now());
    controller5.text = timeToString(DateTime.now());
    controller6.text = dateToString(DateTime.now());
    controller7.text = timeToString(DateTime.now());
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'New flight',
      subtitle: 'Transfer',
      onSkip: onSkip,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 13),
            const TitleText('Departure from origin'),
            const SizedBox(height: 13),
            if (transfer) ...[
              TxtField(
                controller: controller1,
                hintText: 'Country of departure',
                onChanged: checkActive,
              ),
              const SizedBox(height: 13),
              TxtField(
                controller: controller2,
                hintText: 'City of departure',
                onChanged: checkActive,
              ),
              const SizedBox(height: 13),
              TxtField(
                controller: controller3,
                hintText: 'Airport name',
                onChanged: checkActive,
              ),
              const SizedBox(height: 9),
              const TitleText('Departure'),
              const SizedBox(height: 9),
              Row(
                children: [
                  Expanded(
                    child: DateField(
                      controller: controller4,
                      datePicker: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DateField(
                      controller: controller5,
                      timePicker: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              const TitleText('Arrival'),
              const SizedBox(height: 9),
              Row(
                children: [
                  Expanded(
                    child: DateField(
                      controller: controller6,
                      datePicker: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DateField(
                      controller: controller7,
                      timePicker: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              PrimaryButton(
                title: 'Done',
                active: active,
                onPressed: onDone,
              ),
            ] else ...[
              Container(
                height: 76,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextR('Any transfer', fontSize: 16),
                    const Spacer(),
                    TextR(
                      'Tap a button below to add intermediate country and transfer details',
                      fontSize: 12,
                      maxLines: 3,
                      color: AppColors.white70,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              PrimaryButton(
                title: 'Next',
                onPressed: onNext,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
