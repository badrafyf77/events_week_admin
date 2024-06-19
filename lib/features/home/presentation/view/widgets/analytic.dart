// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/home/presentation/view/widgets/bar_chart.dart';

class SiteAnalytic extends StatelessWidget {
  const SiteAnalytic({
    super.key,
    required this.date, required this.visitsList,
  });

  final DateTime date;
  final List visitsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Nombre de visites sur le site',
                    style: Styles.normal16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 600,
            height: 320,
            child: BarChartSample3(
              date: date,
              visitsList: visitsList,
            ),
          ),
        ],
      ),
    );
  }
}
