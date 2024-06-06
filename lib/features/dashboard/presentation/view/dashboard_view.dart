import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          DashDrawer(),
        ],
      ),
    );
  }
}

class DashDrawer extends StatelessWidget {
  const DashDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20), child: Row()),
          ),
        ],
      ),
    );
  }
}
