import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
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
    return CustomScaffold(
      title: 'Settings',
      body: Column(
        children: [
          const SizedBox(height: 11),
          Container(
            height: 90,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 13),
                      const TextR('Give us your feedback', fontSize: 16),
                      const SizedBox(height: 7),
                      TextR(
                        'Help us improve the app with your opinion',
                        fontSize: 12,
                        maxLines: 3,
                        color: AppColors.white70,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SvgPicture.asset('assets/settings2.svg'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 11),
          Container(
            height: 123,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                _Tile(
                  'Terms of use',
                  onPressed: () {},
                ),
                Container(
                  height: 1,
                  color: const Color(0xff363636),
                ),
                _Tile(
                  'Privace Policy',
                  onPressed: () {},
                ),
                Container(
                  height: 1,
                  color: const Color(0xff363636),
                ),
                _Tile(
                  'Support page',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 11),
          Container(
            height: 123,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                _Tile(
                  'Share with friends',
                  onPressed: () {},
                ),
                Container(
                  height: 1,
                  color: const Color(0xff363636),
                ),
                _Tile(
                  'Subscription info',
                  onPressed: () {},
                ),
                Container(
                  height: 1,
                  color: const Color(0xff363636),
                ),
                const _Tile(
                  'Send notification',
                  notification: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatefulWidget {
  const _Tile(
    this.title, {
    this.notification = false,
    this.onPressed,
  });

  final String title;
  final bool notification;
  final void Function()? onPressed;

  @override
  State<_Tile> createState() => _TileState();
}

class _TileState extends State<_Tile> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: () {
        if (widget.notification) {
          setState(() {
            active = !active;
          });
        } else {
          widget.onPressed!();
        }
      },
      minSize: 40,
      child: Row(
        children: [
          const SizedBox(width: 15),
          TextR(
            widget.title,
            fontSize: 16,
            color: AppColors.white70,
          ),
          const Spacer(),
          if (widget.notification)
            Container(
              height: 27,
              width: 47,
              decoration: BoxDecoration(
                color: active ? AppColors.white50 : const Color(0xffB0BEC5),
                borderRadius: BorderRadius.circular(27),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    top: 2,
                    left: active ? 22 : 2,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            active ? AppColors.main : const Color(0xffECEFF1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            TextR(
              '>',
              fontSize: 32,
              color: AppColors.white70,
            ),
          SizedBox(width: widget.notification ? 9 : 13),
        ],
      ),
    );
  }
}
