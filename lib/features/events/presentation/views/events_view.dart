import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/events_list.dart';
import 'package:flutter/material.dart';

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  bool loading1 = false;
  bool loading2 = false;
  @override
  void initState() {
    super.initState();
    transitionProblemSolutionProcess();
  }

  transitionProblemSolutionProcess() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      loading1 = true;
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      loading2 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading1
        ? loading2
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ChooseInitialAndAddEvent(),
                    SizedBox(
                      height: 20,
                    ),
                    EventsList(),
                  ],
                ),
              )
            : const CustomLoadingIndicator()
        : AnimatedContainer(
            duration: const Duration(milliseconds: 250),
          );
  }
}

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
              child: AddEvent(),
            ),
          ],
        ),
      ),
    );
  }
}

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Transform.translate(
          offset: Offset(0, isHovering ? -4 : 0),
        ).transform,
        child: CustomButton(
          onPressed: () {},
          title: 'Ajouter un événement',
          backgroundColor: AppColors.kPrimaryColor,
          height: 38,
          width: 220,
        ),
      ),
    );
  }
}

class ChooseInitialEvent extends StatelessWidget {
  const ChooseInitialEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Site Ain Harouda',
      'Site Berrechid 1',
      'Site Berrechid 2',
      'Site Ain Sebaa',
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choisir l\'événement initial',
          style: Styles.normal16,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 40,
          width: 300,
          child: MyDropDownField(
            onChanged: (value) {},
            items: items,
          ),
        )
      ],
    );
  }
}

class MyDropDownField extends StatelessWidget {
  const MyDropDownField({
    super.key,
    required this.onChanged,
    required this.items,
  });

  final Function(String?)? onChanged;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: items[0],
      isExpanded: true,
      style: const TextStyle(
        fontSize: 12,
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: Styles.normal14.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.kPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: AppColors.kPrimaryColor,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
