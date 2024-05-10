import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageAndAvatar extends StatelessWidget {
  const MessageAndAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Jane,',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'See what’s new today',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 20.r,
          backgroundImage: const AssetImage('assets/images/avatar.jpeg'),
        ),
      ],
    );
  }
}
