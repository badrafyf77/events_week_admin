// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_week_admin/features/messages/presentation/manager/get%20messages%20cubit/get_messages_cubit.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/messages_body.dart';
import 'package:events_week_admin/core/utils/customs/refresh_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:events_week_admin/core/utils/customs/loading_indicator.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({
    super.key,
  });

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  bool loading1 = false;
  bool loading2 = false;
  @override
  void initState() {
    super.initState();
    transitionProblemSolutionProcess();
    BlocProvider.of<GetMessagesCubit>(context).getMessages();
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
            ? Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: RefreshIcon(
                      onPressed: () {
                        BlocProvider.of<GetMessagesCubit>(context).getMessages();
                      },
                    ),
                  ),
                  const MessagesBody(),
                ],
              )
            : const CustomLoadingIndicator()
        : AnimatedContainer(
            duration: const Duration(milliseconds: 250),
          );
  }
}
