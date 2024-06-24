import 'package:events_week_admin/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Image.asset(
        AppAssets.blackLogo,
        height: 100,
      ),
    );
  }
}
