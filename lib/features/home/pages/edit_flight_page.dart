import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/flight.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/date_field.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/title_text.dart';

class EditFlightPage extends StatefulWidget {
  const EditFlightPage({super.key, required this.flight});

  final Flight flight;

  @override
  State<EditFlightPage> createState() => _EditFlightPageState();
}

class _EditFlightPageState extends State<EditFlightPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();
  final controller7 = TextEditingController();
  final controller8 = TextEditingController();
  final controller9 = TextEditingController();
  final controller10 = TextEditingController();

  bool active = true;
  bool departure = true;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        if (departure) ...[
          controller1,
          controller2,
          controller3,
        ] else ...[
          controller6,
          controller7,
          controller8
        ],
      ]);
    });
  }

  void onNext() {
    if (departure) {
      setState(() {
        departure = false;
      });
    } else {
      context.read<HomeBloc>().add(
            EditFlightEvent(
              flight: Flight(
                id: widget.flight.id,
                departureCountry: controller1.text,
                departureCity: controller2.text,
                departureAirport: controller3.text,
                departureDate: controller4.text,
                departureTime: controller5.text,
                arrivalCountry: controller6.text,
                arrivalCity: controller7.text,
                arrivalAirport: controller8.text,
                arrivalDate: controller9.text,
                arrivalTime: controller10.text,
                transferCountry: widget.flight.transferCountry,
                transferCity: widget.flight.transferCity,
                transferAirport: widget.flight.transferAirport,
                transferDepartureDate: widget.flight.transferDepartureDate,
                transferDepartureTime: widget.flight.transferDepartureTime,
                transferArrivalDate: widget.flight.transferArrivalDate,
                transferArrivalTime: widget.flight.transferArrivalTime,
              ),
            ),
          );
      context.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.flight.departureCountry;
    controller2.text = widget.flight.departureCity;
    controller3.text = widget.flight.departureAirport;
    controller4.text = widget.flight.departureDate;
    controller5.text = widget.flight.departureTime;
    controller6.text = widget.flight.arrivalCountry;
    controller7.text = widget.flight.arrivalCity;
    controller8.text = widget.flight.arrivalAirport;
    controller9.text = widget.flight.arrivalDate;
    controller10.text = widget.flight.arrivalTime;
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
    controller8.dispose();
    controller9.dispose();
    controller10.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'New flight',
      subtitle: departure ? 'Departure' : 'Arrival',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 13),
            TitleText(
              departure ? 'Departure from origin' : 'Arrival from origin',
            ),
            const SizedBox(height: 13),
            TxtField(
              controller: departure ? controller1 : controller6,
              hintText:
                  departure ? 'Country of departure' : 'Country of arrival',
              onChanged: checkActive,
            ),
            const SizedBox(height: 13),
            TxtField(
              controller: departure ? controller2 : controller7,
              hintText: departure ? 'City of departure' : 'City of arrival',
              onChanged: checkActive,
            ),
            const SizedBox(height: 13),
            TxtField(
              controller: departure ? controller3 : controller8,
              hintText: 'Airport name',
              onChanged: checkActive,
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                Expanded(
                  child: DateField(
                    controller: departure ? controller4 : controller9,
                    datePicker: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DateField(
                    controller: departure ? controller5 : controller10,
                    timePicker: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            PrimaryButton(
              title: departure ? 'Next' : 'Save',
              active: active,
              onPressed: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
