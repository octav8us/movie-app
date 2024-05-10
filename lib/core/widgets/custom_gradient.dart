import 'package:flutter/material.dart';

class CustomGradient extends StatelessWidget {
 final Widget child;
  const CustomGradient({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            const Color(0xff5f4b33),
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondary,
            const Color(0xff5f4b33),
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: child,
    );
  }
}
