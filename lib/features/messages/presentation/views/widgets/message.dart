import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/models/message_model.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.message,
  });

  final Message message;

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
                if (!message.isReaded)
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
            child: InkWell(
              onTap: () {
                AppRouter.navigateToWithExtra(context, AppRouter.messageInfo, 3,message);
              },
              borderRadius: BorderRadius.circular(25),
              child: Container(
                decoration: BoxDecoration(
                  color: message.isReaded
                      ? Colors.white
                      : AppColors.kPrimaryColor.withAlpha(170),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${message.senderNom} - ${message.senderEmail}',
                            style: Styles.normal14.copyWith(
                              color:
                                  message.isReaded ? Colors.grey : Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            BoardDateFormat('yyyy/MM/dd HH:mm')
                                .format(message.sendAt.toDate()),
                            style: Styles.normal14.copyWith(
                              color:
                                  message.isReaded ? Colors.grey : Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          message.message,
                          style: Styles.normal16,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
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
