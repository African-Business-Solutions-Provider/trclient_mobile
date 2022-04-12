import 'package:absp_mobile/models/reqstat.dart';

/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<RequisitionStat> seriesList;
  final bool animate;

  //SimpleBarChart(this.seriesList, {this.animate});
  const SimpleBarChart({
    Key key,
    this.seriesList,
    this.animate,
  });

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      _createSampleData(seriesList),
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<RequisitionStat, String>> _createSampleData(data) {
    return [
      new charts.Series<RequisitionStat, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (RequisitionStat reqs, _) => reqs.status,
        measureFn: (RequisitionStat reqs, _) => reqs.count,
        data: data,
      )
    ];
  }
}
