import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_gradient.dart';
import 'custom_drawer_header.dart';
import 'custom_drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var divider = Divider(
      height: 1.h,
      color: Theme.of(context).colorScheme.primary,
    );
    return CustomGradient(
      child: Drawer(
        width: 240.w,
        backgroundColor: Colors.transparent,
        child: ListView(
          children: [
            const CustomDrawerHeader(),
            SizedBox(
              height: 10.h,
            ),
            divider,
            const CustomDrawerTile(
              title: 'Home',
              icon: Icons.favorite_border,
            ),
            divider,
            const CustomDrawerTile(
              title: 'Membership',
              icon: Icons.attach_money_sharp,
            ),
            divider,
            const CustomDrawerTile(
              title: 'Share Your favorites',
              icon: Icons.share_outlined,
            ),
            divider,
            const CustomDrawerTile(
              title: 'Settings',
              icon: Icons.settings_outlined,
            ),
            divider,
            const CustomDrawerTile(
              title: 'Favorite Movies',
              icon: Icons.input,
            ),
            divider,
            SizedBox(
              height: 250.h,
            ),
            const CustomElevatedButton('About us'),
          ],
        ),
      ),
    );
  }
}
