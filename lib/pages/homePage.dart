import 'package:absp_mobile/globalcomponents/barChart.dart';
import 'package:absp_mobile/globalcomponents/constants.dart';
import 'package:absp_mobile/globalcomponents/doughnutChart.dart';
import 'package:absp_mobile/models/reqstat.dart';
import 'package:absp_mobile/pages/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double chartbox = 120;
  List<RequisitionStat> reqsList = [
    new RequisitionStat("Sun", 1, charts.MaterialPalette.blue.shadeDefault),
    new RequisitionStat("Mon", 5, charts.MaterialPalette.blue.shadeDefault),
    new RequisitionStat("Tue", 4, charts.MaterialPalette.green.shadeDefault),
    new RequisitionStat("Wed", 10, charts.MaterialPalette.yellow.shadeDefault),
    new RequisitionStat("Thu", 14, charts.MaterialPalette.blue.shadeDefault),
    new RequisitionStat("Fri", 12, charts.MaterialPalette.blue.shadeDefault),
    new RequisitionStat("Sat", 3, charts.MaterialPalette.blue.shadeDefault),
  ];
  List<RequisitionStat> opendata = [
    new RequisitionStat("Open", 50, charts.MaterialPalette.blue.shadeDefault)
  ];
  List<RequisitionStat> completeddata = [
    new RequisitionStat(
        "Completed", 10, charts.MaterialPalette.green.shadeDefault)
  ];
  List<RequisitionStat> inprogressdata = [
    new RequisitionStat(
        "In-Progress", 40, charts.MaterialPalette.yellow.shadeDefault)
  ];

  double _borderwidth = 2.8;
  int _pageState = 0;
  var _borderground = Colors.grey[400];
  var reqbackground = Colors.grey[400];
  var cpxbackground = Colors.grey[400];
  var strbackground = Colors.grey[400];
  double xoffset = 0;
  double yoffset = 0;
  double scalefactor = 1;
  bool tabopen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    switch (_pageState) {
      case 0:
        _borderwidth = 2.8;
        reqbackground = Colors.yellow[700];
        cpxbackground = _borderground;
        strbackground = _borderground;
        reqsList = [
          new RequisitionStat(
              "Sun", 1, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Mon", 5, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Tue", 4, charts.MaterialPalette.green.shadeDefault),
          new RequisitionStat(
              "Wed", 10, charts.MaterialPalette.yellow.shadeDefault),
          new RequisitionStat(
              "Thu", 14, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Fri", 12, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Sat", 3, charts.MaterialPalette.blue.shadeDefault),
        ];
        break;
      case 1:
        _borderwidth = 2.8;
        reqbackground = _borderground;
        cpxbackground = Colors.yellow[700];
        strbackground = _borderground;
        reqsList = [
          new RequisitionStat(
              "Sun", 0, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Mon", 3, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Tue", 5, charts.MaterialPalette.green.shadeDefault),
          new RequisitionStat(
              "Wed", 2, charts.MaterialPalette.yellow.shadeDefault),
          new RequisitionStat(
              "Thu", 4, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Fri", 0, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Sat", 1, charts.MaterialPalette.blue.shadeDefault),
        ];
        break;
      case 2:
        _borderwidth = 2.8;
        reqbackground = _borderground;
        cpxbackground = _borderground;
        strbackground = Colors.yellow[700];
        reqsList = [
          new RequisitionStat(
              "Sun", 3, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Mon", 3, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Tue", 5, charts.MaterialPalette.green.shadeDefault),
          new RequisitionStat(
              "Wed", 11, charts.MaterialPalette.yellow.shadeDefault),
          new RequisitionStat(
              "Thu", 16, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Fri", 14, charts.MaterialPalette.blue.shadeDefault),
          new RequisitionStat(
              "Sat", 5, charts.MaterialPalette.blue.shadeDefault),
        ];
        break;
    }
    return Scaffold(
        backgroundColor: appPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          title: tabopen
              ? Text("")
              : Text(
                  'Dashboard',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
          leading: IconButton(
            icon: tabopen ? Icon(Icons.close) : Icon(Icons.menu),
            onPressed: () {
              setState(() {
                if (tabopen) {
                  xoffset = 0;
                  yoffset = 0;
                  scalefactor = 1;
                  tabopen = false;
                } else {
                  xoffset = size.width - (0.4 * size.width);
                  yoffset = size.height - (0.9 * size.height);
                  scalefactor = 0.8;
                  tabopen = true;
                }
              });
            },
          ),
          // brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: appPrimaryColor,
        ),
        body: Stack(
          children: [
            CustomAppDrawer(pageRoute: HomePage.routeName),
            AnimatedContainer(
              transform: Matrix4.translationValues(xoffset, yoffset, 0)
                ..scale(scalefactor),
              duration: Duration(milliseconds: 250),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey[400],
                              width: 0.5,
                              style: BorderStyle.solid)),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: DonutPieChart(
                                  animate: true,
                                  seriesList: opendata,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: DonutPieChart(
                                  animate: true,
                                  seriesList: inprogressdata,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: DonutPieChart(
                                  animate: true,
                                  seriesList: completeddata,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: size.width * 0.135,
                                    left: size.width * 0.125),
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent[300],
                                ),
                                child: Text('${opendata[0].count}%',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: size.width * 0.135,
                                    left: size.width * 0.125),
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent[300],
                                ),
                                child: Text('${inprogressdata[0].count}%',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: size.width * 0.135,
                                    left: size.width * 0.125),
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent[300],
                                ),
                                child: Text('${completeddata[0].count}%',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: Duration(milliseconds: 1000),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                _pageState = 0;
                              })
                            },
                            child: Container(
                              padding: EdgeInsets.all(size.width * 0.03),
                              decoration: BoxDecoration(
                                color: Colors.amberAccent[300],
                                border: Border(
                                  bottom: BorderSide(
                                      color: reqbackground,
                                      width: _borderwidth,
                                      style: BorderStyle.solid),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Requisitions",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                _pageState = 1;
                              })
                            },
                            child: Container(
                              padding: EdgeInsets.all(size.width * 0.03),
                              decoration: BoxDecoration(
                                color: Colors.amberAccent[300],
                                border: Border(
                                  bottom: BorderSide(
                                      color: cpxbackground,
                                      width: _borderwidth,
                                      style: BorderStyle.solid),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Capex",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                _pageState = 2;
                              })
                            },
                            child: Container(
                              padding: EdgeInsets.all(size.width * 0.03),
                              decoration: BoxDecoration(
                                color: Colors.amberAccent[300],
                                border: Border(
                                  bottom: BorderSide(
                                      color: strbackground,
                                      width: _borderwidth,
                                      style: BorderStyle.solid),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Stores",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: SimpleBarChart(
                          animate: true,
                          seriesList: reqsList,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
