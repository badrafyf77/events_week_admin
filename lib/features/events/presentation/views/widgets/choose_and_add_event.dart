import 'package:events_week_admin/features/events/presentation/views/widgets/choose_initial_event.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/navigate_to_add_event_button.dart';
import 'package:flutter/material.dart';

class ChooseInitialAndAddEvent extends StatelessWidget {
  const ChooseInitialAndAddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChooseInitialEvent(),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: NavigateToAddEventButton(),
            ),
          ],
        ),
      ),
    );
  }
}
