import 'package:absp_mobile/globalcomponents/constants.dart';
import 'package:absp_mobile/globalcomponents/requisitioncard.dart';
import 'package:absp_mobile/pages/customDrawer.dart';
import 'package:absp_mobile/repository/requisiotionrepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
/*
class RequisitionPage extends StatelessWidget {
  static const routeName = "/requisitions";
  const RequisitionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          // home: RequisitionPage(), theme: ThemeData(fontFamily: 'Roboto')
          ),
    );
  }
}*/

class RequisitionPage extends StatefulWidget {
  static const routeName = "/requisitions";
  RequisitionPage({Key key}) : super(key: key);

  @override
  _RequisitionPageState createState() => _RequisitionPageState();
}

class _RequisitionPageState extends State<RequisitionPage> {
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  double xoffset = 0;
  double yoffset = 0;
  double scalefactor = 1;
  bool tabopen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        backgroundColor: appPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          title: tabopen
              ? Text("")
              : Text(
                  'Requisitions',
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
        ),
        body: Stack(children: [
          CustomAppDrawer(pageRoute: RequisitionPage.routeName),
          AnimatedContainer(
            transform: Matrix4.translationValues(xoffset, yoffset, 0)
              ..scale(scalefactor),
            duration: Duration(milliseconds: 250),
            color: appPrimaryColor,
            child: Column(
              children: [
                TableCalendar(
                  calendarController: _calendarController,
                  onDaySelected: (day, events, holidays) => {print(day)},
                  initialCalendarFormat: CalendarFormat.week,
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  formatAnimation: FormatAnimation.slide,
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonVisible: false,
                    titleTextStyle:
                        TextStyle(color: Colors.white, fontSize: 14),
                    leftChevronIcon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                    rightChevronIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                    leftChevronMargin: EdgeInsets.only(left: 70),
                    rightChevronMargin: EdgeInsets.only(right: 70),
                  ),
                  calendarStyle: CalendarStyle(
                      weekendStyle:
                          TextStyle(color: Colors.white, fontSize: 14),
                      weekdayStyle:
                          TextStyle(color: Colors.white, fontSize: 14)),
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle:
                          TextStyle(color: Colors.white, fontSize: 14),
                      weekdayStyle:
                          TextStyle(color: Colors.white, fontSize: 14)),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            /* while(int i = 0 < allrequesitions.length)
                            {
                              RequisitionCard(req: allrequesitions[i]), i++;
                            } */
                            RequisitionCard(req: allrequesitions[0]),
                            RequisitionCard(req: allrequesitions[1]),
                            RequisitionCard(req: allrequesitions[2]),
                            RequisitionCard(req: allrequesitions[3]),
                            RequisitionCard(req: allrequesitions[4]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
