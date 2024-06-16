import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.read,
  });

  final bool read;

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
                if (!read)
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
                AppRouter.navigateTo(context, AppRouter.messageInfo, 3);
              },
              borderRadius: BorderRadius.circular(25),
              child: Container(
                decoration: BoxDecoration(
                  color: read
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
                            'Afyf Badreddine - email123@gmail.com',
                            style: Styles.normal14.copyWith(
                              color: read ? Colors.grey : Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '18/05/2003',
                            style: Styles.normal14.copyWith(
                              color: read ? Colors.grey : Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Ullamco officia ea do aliqua voluptate ipsum culpa consectetur quis dolore do ullamco. Nisi amet sunt veniam aliquip velit enim magna consequat. Cupidatat incididunt mollit pariatur Lorem culpa do proident sunt. Reprehenderit quis quis deserunt ad dolore irure. In incididunt aliqua aliquip ad nostrud excepteur non.",
                        style: Styles.normal16,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
