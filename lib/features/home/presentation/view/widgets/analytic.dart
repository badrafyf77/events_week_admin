import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/home/presentation/view/widgets/bar_chart.dart';
import 'package:flutter/material.dart';

class SiteAnalytic extends StatelessWidget {
  const SiteAnalytic({
    super.key,
  });

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
          const SizedBox(
            width: 600,
            height: 320,
            child: BarChartSample3(),
          ),
        ],
      ),
    );
  }
}
