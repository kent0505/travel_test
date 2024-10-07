import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'texts/text_r.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    required this.title,
    this.home = false,
  });

  final Widget body;
  final String title;
  final bool home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 88,
            decoration: const BoxDecoration(
              color: AppColors.main,
            ),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    if (home) ...[
                      const SizedBox(width: 15),
                      TextR(title, fontSize: 20),
                    ],
                  ],
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(color: AppColors.black),
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
