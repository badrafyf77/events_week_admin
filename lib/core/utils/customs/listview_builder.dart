import 'package:flutter/material.dart';

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
