import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  const CustomElevatedButton(
    this.title,
    {
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r))),
            ),
        child:  Text(
          title,
        ),
      ),
    );
  }
}
