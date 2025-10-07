import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/home/presentation/cubit/home_cubit.dart';
import 'package:laza/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getProducts(),
      child: HomeScreenBody(),
    );
  }
}
