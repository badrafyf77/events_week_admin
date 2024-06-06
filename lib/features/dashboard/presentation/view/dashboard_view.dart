import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/drawer.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/widgets/dash_body.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/widgets/dash_header.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.grey,
            height: 1,
          ),
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.white,
        title: CustomAppbar(
          widget: Text('Events Week Admin', style: Styles.normal24),
        ),
      ),
      body: const Row(
        children: [
          AppDrawer(
            isDashSelected: true,
            isEventsSelected: false,
            isMessagesSelected: false,
          ),
          Expanded(
            child: Column(
              children: [
                DashboardHeader(),
                DashboardBody(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(
              child: Row(
                children: [
                  widget,
                ],
              ),
            ),
          ),
          const WindowButtons(),
        ],
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(),
      ],
    );
  }
}

final buttonColors = WindowButtonColors(
  iconNormal: AppColors.kPrimaryColor,
  mouseOver: AppColors.kPrimaryColor,
  mouseDown: AppColors.kPrimaryColor,
  iconMouseOver: Colors.white,
  iconMouseDown: Colors.white,
);
