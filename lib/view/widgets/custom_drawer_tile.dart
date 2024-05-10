import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerTile extends StatelessWidget {
 final String title;
   final IconData icon;
  const CustomDrawerTile({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
      ),
      contentPadding: EdgeInsets.only(
        left: 25.w,
      ),
      horizontalTitleGap: 8,
      leading: Icon(
        icon,
        size: 30.r,
        color: Theme.of(context).colorScheme.primary,
      ),
      trailing: const Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
