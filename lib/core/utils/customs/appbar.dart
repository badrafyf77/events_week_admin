import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/appbar_content.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

var appBar = AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.grey,
            height: 1,
          ),
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.white,
        title: CustomAppbarContent(
          widget: Text(
            'Events Week Admin',
            style: Styles.normal16.copyWith(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );