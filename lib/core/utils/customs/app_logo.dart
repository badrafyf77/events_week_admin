import 'package:events_week_admin/core/utils/images.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Image.asset(
        AppAssets.logo,
        height: 80,
      ),
    );
  }
}
