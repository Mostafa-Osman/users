import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/app_routes.dart';
import 'features/app_theme/controller/ThemeCubit.dart';
import 'features/network_checker/network_view.dart';
import 'di.dart';
import 'features/network_checker/controller/network_checker.cubit.dart';
import 'features/users/presentation/controller/user_details_cubit/user_details_cubit.dart';
import 'features/users/presentation/controller/user_cubit/users_cubit.dart';

class MyUsersApp extends StatelessWidget {
  const MyUsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (_) => sl<UserCubit>()..getAllUsers(),
        ),
        BlocProvider<UserDetailsCubit>(
          create: (_) => sl<UserDetailsCubit>(),
        ),
        BlocProvider<NetworkCubit>(
          create: (_) => sl<NetworkCubit>(),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => sl<ThemeCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            routerConfig: AppRoutes.appRouter,
            title: 'Users',
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            builder: (context, child) {
              return NetworkWrapper(
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
