import 'package:absp_mobile/globalcomponents/constants.dart';
import 'package:absp_mobile/models/requisition.dart';
import 'package:flutter/material.dart';

class RequisitionCard extends StatelessWidget {
  final Requisition req;
  const RequisitionCard({Key key, @required this.req}) : super(key: key);
  String pipelineStageResolver(int stage) {
    switch (stage) {
      case 1:
        return "Requisition";
        break;
      case 2:
        return "Bid Analysis";
        break;
      case 3:
        return "Purchase Order";
        break;
      case 4:
        return "Goods Receipt";
        break;
      default:
        return "Payment";
        break;
    }
  }

  String resolveTime(DateTime time) {
    String h = "";
    String m = "";
    if (time.hour < 10) {
      h = "0" + time.hour.toString();
    } else {
      h = time.hour.toString();
    }

    if (time.minute < 10) {
      m = "0" + time.minute.toString();
    } else {
      m = time.minute.toString();
    }
    return h + ":" + m;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(10),
            color: Colors.blue[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      req.doctype,
                      style: TextStyle(
                          color: appPrimaryColor, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    /* Icon(
                      Icons.mail_outline,
                      color: appPrimaryColor,
                    ),*/
                    Expanded(child: Container()),
                    Text(
                      resolveTime(req.created),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  req.title,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer,
                      color: appPrimaryColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      req.runningtime,
                      style: TextStyle(
                          color: appPrimaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      pipelineStageResolver(req.pipelineStage),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.check_box,
                      color: Colors.green[800],
                    ),
                    Icon(
                      Icons.check_box,
                      color: Colors.green[800],
                    ),
                    Icon(
                      Icons.check_box,
                      color: Colors.green[800],
                    ),
                    Icon(Icons.check_box_outline_blank),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_city_sharp,
                      color: appPrimaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    /* Icon(
                      Icons.mail_outline,
                      color: appPrimaryColor,
                    ),*/
                    Expanded(child: Container()),
                    Text(
                      req.location,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
