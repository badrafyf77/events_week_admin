// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            EventsList(
              width: constraints.maxWidth,
            ),
          ],
        );
      }),
    );
  }
}

class EventsList extends StatelessWidget {
  const EventsList({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomListViewBuilder(
      itemCount: 4,
      widget: Column(
        children: [
          EventItem(width: width),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EventCercleTime(),
        EventDetails(width: width),
      ],
    );
  }
}

class EventDetails extends StatefulWidget {
  const EventDetails({
    super.key,
    required this.width,
  });

  final double width;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 242,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  AppImages.event,
                  width: widget.width * .35,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 470,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Louis Family Party',
                      style: Styles.normal24,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enim enim in ut enim duis mollit Lorem sunt sint. Cillum dolor ex incididunt labore sint fugiat sit aute sit exercitation ex magna ex. Aliqua occaecat cillum culpa qui sint ipsum proident. Magna consequat nisi magna adipisicing nostrud qui occaecat magna aute.',
                      style: Styles.normal16.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: widget.width * 0.24,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '8:00 pm',
                                    style: Styles.normal12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.place,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'Agdal, Rabat',
                                    style: Styles.normal12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        MouseRegion(
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
                            duration: const Duration(milliseconds: 250),
                            transform: Transform.translate(
                              offset: Offset(0, isHovering ? -8 : 0),
                            ).transform,
                            child: CustomButton(
                              onPressed: () {},
                              title: 'Voir Plus',
                              backgroundColor: AppColors.kPrimaryColor,
                              height: 35,
                              width: 120,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventCercleTime extends StatelessWidget {
  const EventCercleTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '11',
              style: Styles.normal15.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              'Mars',
              style: Styles.normal12.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
    required this.itemCount,
    required this.widget,
  });

  final int itemCount;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return widget;
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    this.textColor = Colors.white,
    required this.height,
    required this.width,
    this.fontSize = 14,
  });

  final Function()? onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Styles.normal14.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
