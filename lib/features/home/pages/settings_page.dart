import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: '',
      body: Column(
        children: [
          TextM(
            'Settings',
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
