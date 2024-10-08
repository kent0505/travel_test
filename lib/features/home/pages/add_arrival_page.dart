import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/flight.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/date_field.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../widgets/title_text.dart';

class AddArrivalPage extends StatefulWidget {
  const AddArrivalPage({super.key, required this.flight});

  final Flight flight;

  @override
  State<AddArrivalPage> createState() => _AddArrivalPageState();
}

class _AddArrivalPageState extends State<AddArrivalPage> {
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
      '/add-transfer',
      extra: Flight(
        id: widget.flight.id,
        departureCountry: widget.flight.departureCountry,
        departureCity: widget.flight.departureCity,
        departureAirport: widget.flight.departureAirport,
        departureDate: widget.flight.departureDate,
        departureTime: widget.flight.departureTime,
        arrivalCountry: controller1.text,
        arrivalCity: controller2.text,
        arrivalAirport: controller3.text,
        arrivalDate: controller4.text,
        arrivalTime: controller5.text,
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
      subtitle: 'Arrival',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 13),
            const TitleText('Arrival from origin'),
            const SizedBox(height: 13),
            TxtField(
              controller: controller1,
              hintText: 'Country of arrival',
              onChanged: checkActive,
            ),
            const SizedBox(height: 13),
            TxtField(
              controller: controller2,
              hintText: 'City of arrival',
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
