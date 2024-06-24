import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/models/message_model.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/delete_message_icon.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatefulWidget {
  const MessageItem({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  bool showDeleteIcon = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Stack(
              children: [
                const Icon(
                  Icons.mail,
                  size: 30,
                ),
                if (!widget.message.isReaded)
                  Positioned(
                    right: 0.1,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  showDeleteIcon = true;
                });
              },
              onExit: (event) {
                setState(() {
                  showDeleteIcon = false;
                });
              },
              child: InkWell(
                onTap: () {
                  AppRouter.navigateToWithExtra(
                      context, AppRouter.messageInfo, widget.message);
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.message.isReaded
                        ? Colors.white
                        : AppColors.kPrimaryColor.withAlpha(170),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.message.senderNom} - ${widget.message.senderEmail}',
                              style: Styles.normal14.copyWith(
                                color: widget.message.isReaded
                                    ? Colors.grey
                                    : Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              BoardDateFormat('yyyy/MM/dd HH:mm')
                                  .format(widget.message.sendAt.toDate()),
                              style: Styles.normal14.copyWith(
                                color: widget.message.isReaded
                                    ? Colors.grey
                                    : Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.message.message,
                                  style: Styles.normal16,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              if (showDeleteIcon) DeleteMessageIcon(id: widget.message.id)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
