import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../config/app_colors.dart';
import '../utils.dart';
import 'buttons/cuper_button.dart';
import 'texts/text_r.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    required this.title,
    this.subtitle = '',
    this.home = false,
    this.onSkip,
  });

  final Widget body;
  final String title;
  final String subtitle;
  final bool home;
  final void Function()? onSkip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 80 + getStatusBar(context),
            padding: EdgeInsets.only(bottom: home ? 14 : 0),
            decoration: const BoxDecoration(
              color: AppColors.main,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (home) ...[
                  const SizedBox(width: 14),
                  TextR(title, fontSize: 20),
                  const Spacer(),
                  CuperButton(
                    onPressed: () {
                      context.push('/settings');
                    },
                    minSize: 25,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/settings.svg'),
                        const SizedBox(width: 6),
                        const TextR('Settings', fontSize: 20),
                      ],
                    ),
                  ),
                  const SizedBox(width: 18),
                ] else ...[
                  SizedBox(
                    width: 56,
                    child: CuperButton(
                      onPressed: () {
                        context.pop();
                      },
                      padding: 22,
                      minSize: 22,
                      child: const TextR(
                        '<',
                        fontSize: 32,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextR(title, fontSize: 20),
                      TextR(
                        subtitle,
                        fontSize: 15,
                        color: AppColors.white70,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 56,
                    child: onSkip != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                              bottom: 14,
                              right: 14,
                            ),
                            child: CuperButton(
                              onPressed: onSkip,
                              child: const TextR(
                                'Skip',
                                fontSize: 20,
                                color: AppColors.blue,
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
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
