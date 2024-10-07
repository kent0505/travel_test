import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../texts/text_r.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      backgroundColor: AppColors.main,
      child: SizedBox(
        height: 150,
        child: Center(
          child: TextB(
            'No Internet',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
