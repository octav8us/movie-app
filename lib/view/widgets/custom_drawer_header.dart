import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.symmetric(
        vertical: 36.h,
        horizontal: 25.w,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: CircleAvatar(
              radius: 40.r,
              backgroundImage:
                  const AssetImage('assets/images/avatar.jpeg'),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Jane Smith',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
