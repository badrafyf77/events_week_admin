import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({
    super.key,
  });

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
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
                    width: constraints.maxWidth * .35,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: constraints.maxWidth * .57,
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
                            width: constraints.maxWidth * 0.24,
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
                              duration: const Duration(milliseconds: 100),
                              transform: Transform.translate(
                                offset: Offset(0, isHovering ? -4 : 0),
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
        );
      }),
    );
  }
}
