import 'package:absp_mobile/models/reqstat.dart';

/// Donut chart example. This is a simple pie chart with a hole in the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutPieChart extends StatelessWidget {
  // final List<charts.Series> seriesList;
  final List<RequisitionStat> seriesList;
  final bool animate;

  //DonutPieChart(this.seriesList, {this.animate});
  const DonutPieChart({
    Key key,
    this.seriesList,
    this.animate,
  });
  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      _createSampleData(seriesList),
      animate: animate,
      // Configure the width of the pie slices to 60px. The remaining space in
      // the chart will be left as a hole in the center.
      defaultRenderer: new charts.ArcRendererConfig(arcWidth: 5),
      behaviors: [
        charts.DatumLegend(
          desiredMaxRows: 1,
          position: charts.BehaviorPosition.bottom,
          entryTextStyle: charts.TextStyleSpec(
              fontSize: 10,
              fontFamily: 'Roboto',
              color: charts.MaterialPalette.black),
          cellPadding: EdgeInsets.only(bottom: 5),
        )
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<RequisitionStat, String>> _createSampleData(data) {
    return [
      new charts.Series<RequisitionStat, String>(
          id: 'Requsitions',
          colorFn: (RequisitionStat reqs, _) => reqs.color,
          domainFn: (RequisitionStat reqs, _) => reqs.status,
          measureFn: (RequisitionStat reqs, _) => reqs.count,
          data: data)
    ];
  }
}
