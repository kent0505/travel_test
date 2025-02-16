import 'package:flutter/cupertino.dart';

import '../../config/app_colors.dart';
import '../texts/text_r.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.width,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: width,
      decoration: BoxDecoration(
        color: active ? AppColors.red : AppColors.red22,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Center(
          child: TextR(
            title,
            fontSize: 20,
            color: active ? AppColors.white : AppColors.white50,
          ),
        ),
      ),
    );
  }
}
