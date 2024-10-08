import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/db/prefs.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void load() async {
    await getData().then((onboard) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          if (onboard) {
            context.go('/onboard');
          } else {
            context.go('/home');
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: CupertinoActivityIndicator(
        color: AppColors.white,
      ),
    );
  }
}
