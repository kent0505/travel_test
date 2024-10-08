import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_test/core/models/flight.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/date_field.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';

class AddDeparturePage extends StatefulWidget {
  const AddDeparturePage({super.key});

  @override
  State<AddDeparturePage> createState() => _AddDeparturePageState();
}

class _AddDeparturePageState extends State<AddDeparturePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();

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
    context.push(
      '/add-arrival',
      extra: Flight(
        id: getCurrentTimestamp(),
        departureCountry: controller1.text,
        departureCity: controller2.text,
        departureAirport: controller3.text,
        departureDate: controller4.text,
        departureTime: controller5.text,
        arrivalCountry: '',
        arrivalCity: '',
        arrivalAirport: '',
        arrivalDate: '',
        arrivalTime: '',
        transferCountry: '',
        transferCity: '',
        transferAirport: '',
        transferDepartureDate: '',
        transferDepartureTime: '',
        transferArrivalDate: '',
        transferArrivalTime: '',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller4.text = dateToString(DateTime.now());
    controller5.text = timeToString(DateTime.now());
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'New flight',
      subtitle: 'Departure',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 13),
            TextR(
              'Departure from origin',
              fontSize: 15,
              color: AppColors.white70,
            ),
            const SizedBox(height: 13),
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
            const SizedBox(height: 13),
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
            const SizedBox(height: 26),
            PrimaryButton(
              title: 'Next',
              active: active,
              onPressed: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
