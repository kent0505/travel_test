import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/db/prefs.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/jetlag/jetlag_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void load() async {
    await getData().then((onboard) {
      if (mounted) {
        context.read<HomeBloc>().add(GetFlightsEvent());
        context.read<JetlagBloc>().add(GetJetlagEvent());
      }
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
      body: Center(
        child: CupertinoActivityIndicator(
          color: AppColors.white,
        ),
      ),
    );
  }
}
