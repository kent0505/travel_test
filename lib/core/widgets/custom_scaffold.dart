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
    this.onDelete,
  });

  final Widget body;
  final String title;
  final String subtitle;
  final bool home;
  final void Function()? onSkip;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 80 + getStatusBar(context),
            padding: EdgeInsets.only(bottom: home ? 14 : 0),
            color: AppColors.main,
            child: home
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                    ],
                  )
                : Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
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
                          const SizedBox(width: 56),
                        ],
                      ),
                      if (onSkip != null)
                        Positioned(
                          right: 16,
                          bottom: 16,
                          child: CuperButton(
                            onPressed: onSkip,
                            child: const TextR(
                              'Skip',
                              fontSize: 20,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      if (onDelete != null)
                        Positioned(
                          right: 16,
                          bottom: 16,
                          child: CuperButton(
                            onPressed: onDelete,
                            child: const TextR(
                              'Delete',
                              fontSize: 20,
                              color: AppColors.red,
                            ),
                          ),
                        ),
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
