import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/features/network_checker/controller/network_checker.cubit.dart';
import 'package:users/features/network_checker/controller/network_checker_state.dart';

class NetworkWrapper extends StatelessWidget {
  final Widget? child;

  const NetworkWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            BlocBuilder<NetworkCubit, NetworkState>(
              builder: (context, state) {
                return AnimatedContainer(
                  height: state is NetworkConnected ? 0 : 70,
                  duration: const Duration(milliseconds: 600),
                  color: state is NetworkConnected ? Colors.green : Colors.red,
                  child: const Center(
                    child: Text(
                      'No Connection',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            if (child != null) ...[
              Expanded(child: child!),
            ],
          ],
        ),
      ),
    );
  }
}
