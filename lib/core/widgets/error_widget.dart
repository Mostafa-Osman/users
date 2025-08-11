import 'package:flutter/material.dart';

class ErrorWidgetView extends StatelessWidget {
  const ErrorWidgetView({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity * .7,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Something went wrong.",
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
