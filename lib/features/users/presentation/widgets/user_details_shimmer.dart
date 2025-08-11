import 'package:flutter/material.dart';
import 'package:users/features/users/presentation/widgets/grid_shimmer.dart';

class UserDetailsShimmer extends StatelessWidget {
  const UserDetailsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShimmerBox(
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            ShimmerBox(
              width: double.infinity,
              height: 50,
            ),
            SizedBox(height: 15),
            ShimmerBox(
              width: double.infinity,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
