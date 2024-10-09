import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/prefs.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_r.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 46),
              child: TextR(
                'Plan your travel with easy',
                fontSize: 40,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 27),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: TextR(
                'Our application can help you easly and conveniently organize your flights',
                fontSize: 20,
                maxLines: 3,
                textAlign: TextAlign.center,
                color: Color(0xffC1C1C1),
              ),
            ),
            const SizedBox(height: 37),
            SizedBox(
              width: 210,
              height: 210,
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset('assets/onboard1.svg'),
                  ),
                  Positioned(
                    left: -5,
                    bottom: 0,
                    child: SvgPicture.asset('assets/onboard2.svg'),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 49.5,
                    child: Container(
                      height: 75,
                      width: 6.3,
                      color: const Color(0xffE3E3E3),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 25.5,
                    child: Container(
                      height: 75,
                      width: 24,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CuperButton(
              onPressed: () async {
                await saveOnboard().then((value) {
                  if (context.mounted) {
                    context.go('/home');
                  }
                });
              },
              child: Container(
                height: 80,
                width: 310,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: TextR(
                    'Get started!',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
