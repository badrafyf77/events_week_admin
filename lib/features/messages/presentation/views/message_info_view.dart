import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class MessageInfoView extends StatelessWidget {
  const MessageInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                AppRouter.navigateTo(context, AppRouter.messages, 3);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Afyf Badreddine - email123@gmail.com\n0707314877',
                          style: Styles.normal14.copyWith(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '18/05/2003',
                          style: Styles.normal14.copyWith(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Eiusmod nulla mollit anim consequat. Mollit consectetur Lorem culpa eiusmod qui esse tempor proident. Ea laborum est magna labore laboris aliquip. Lorem consequat cupidatat reprehenderit proident officia veniam deserunt dolor. Et voluptate cupidatat adipisicing labore consectetur sint in laborum. Sunt ad velit anim consectetur ullamco nostrud qui voluptate adipisicing adipisicing.Quis ex ex in id irure. Voluptate veniam irure voluptate consequat do cillum pariatur qui ea qui pariatur enim laborum. Nostrud est duis aliquip voluptate irure cillum labore ea dolore do magna. Esse dolore enim aliquip consectetur aliquip magna adipisicing id aute officia. Ut est cillum non occaecat exercitation voluptate. Voluptate quis eu magna eiusmod elit veniam laboris fugiat excepteur ea. Sit proident cillum consequat ipsum mollit.Lorem et ut velit consequat do eu ipsum nostrud elit. Labore eiusmod veniam eu consectetur officia sint pariatur cupidatat Lorem aliqua amet elit enim. Nostrud officia esse nostrud proident est ullamco culpa tempor anim ad tempor pariatur adipisicing laboris. Dolor culpa aliqua velit eu sint voluptate qui amet enim minim aliqua commodo est irure.',
                        style: Styles.normal16,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const Spacer(
                      flex: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
