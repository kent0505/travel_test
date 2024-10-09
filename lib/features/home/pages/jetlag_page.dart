import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/themes.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/jetlag/jetlag_bloc.dart';
import '../widgets/title_text.dart';

class JetlagPage extends StatefulWidget {
  const JetlagPage({super.key});

  @override
  State<JetlagPage> createState() => _JetlagPageState();
}

class _JetlagPageState extends State<JetlagPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
      ]);
    });
  }

  void onTimeChanged(DateTime date) {
    setState(() {
      controller3.text = timeToString(date);
    });
    logger(controller3.text);
  }

  void onNotify() {
    context.read<JetlagBloc>().add(AddJetlagEvent(
          arrival: controller1.text,
          departure: controller2.text,
          time: controller3.text,
        ));
    context.pop();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Jetlag',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TxtField(
              controller: controller1,
              hintText: 'Country of arrival',
              onChanged: checkActive,
            ),
            const SizedBox(height: 20),
            TxtField(
              controller: controller2,
              hintText: 'Country of departure',
              onChanged: checkActive,
            ),
            const SizedBox(height: 12),
            const TitleText('When do you normaly go to sleep?'),
            const SizedBox(height: 12),
            Container(
              height: 195,
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CupertinoTheme(
                data: cupertinoTheme,
                child: CupertinoDatePicker(
                  onDateTimeChanged: onTimeChanged,
                  mode: CupertinoDatePickerMode.time,
                ),
              ),
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              title: 'Notify me',
              active: active,
              onPressed: onNotify,
            ),
          ],
        ),
      ),
    );
  }
}
