import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../widgets/title_text.dart';

class JetlagPage extends StatefulWidget {
  const JetlagPage({super.key});

  @override
  State<JetlagPage> createState() => _JetlagPageState();
}

class _JetlagPageState extends State<JetlagPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
      ]);
    });
  }

  void onNotify() {}

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
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
              controller: controller1,
              hintText: 'Country of departure',
              onChanged: checkActive,
            ),
            const SizedBox(height: 12),
            const TitleText('When do you normaly go to sleep?'),
            const SizedBox(height: 12),
            //
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
