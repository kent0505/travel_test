import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_test/core/widgets/dialogs/delete_dialog.dart';

import '../../../core/models/flight.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/date_field.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/title_text.dart';

class EditTransferPage extends StatefulWidget {
  const EditTransferPage({super.key, required this.flight});

  final Flight flight;

  @override
  State<EditTransferPage> createState() => _EditTransferPageState();
}

class _EditTransferPageState extends State<EditTransferPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();
  final controller7 = TextEditingController();

  bool active = true;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  void onEdit() {
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
              transferCountry: controller1.text,
              transferCity: controller2.text,
              transferAirport: controller3.text,
              transferDepartureDate: controller4.text,
              transferDepartureTime: controller5.text,
              transferArrivalDate: controller6.text,
              transferArrivalTime: controller7.text,
              plans: widget.flight.plans,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: 'Delete Transfer?',
          onYes: () {
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
                      transferCountry: '',
                      transferCity: '',
                      transferAirport: '',
                      transferDepartureDate: '',
                      transferDepartureTime: '',
                      transferArrivalDate: '',
                      transferArrivalTime: '',
                      plans: widget.flight.plans,
                    ),
                  ),
                );
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.flight.transferCountry.isEmpty) {
      active = false;
      controller4.text = dateToString(DateTime.now());
      controller5.text = timeToString(DateTime.now());
      controller6.text = dateToString(DateTime.now());
      controller7.text = timeToString(DateTime.now());
    } else {
      controller1.text = widget.flight.transferCountry;
      controller2.text = widget.flight.transferCity;
      controller3.text = widget.flight.transferAirport;
      controller4.text = widget.flight.transferDepartureDate;
      controller5.text = widget.flight.transferDepartureTime;
      controller6.text = widget.flight.transferArrivalDate;
      controller7.text = widget.flight.transferArrivalTime;
    }
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
      title: 'Your flight',
      subtitle: 'Transfer',
      onDelete: onDelete,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 13),
            const TitleText('Departure from origin'),
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
              title: 'Edit',
              active: active,
              onPressed: onEdit,
            ),
          ],
        ),
      ),
    );
  }
}
