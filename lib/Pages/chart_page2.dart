import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'chart1.dart';
import 'chart2.dart';
import 'localisable_mixin.dart';
class ChrPage2 extends StatefulWidget {
  @override
  _ChrPageState createState() => _ChrPageState();
  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final q1 = [
      new OrdinalSales('2016', 60),
      new OrdinalSales('2017', 70),
      new OrdinalSales('2018', 80),
      new OrdinalSales('2019', 100),
    ];

    final q2 = [
      new OrdinalSales('2016', 150),
      new OrdinalSales('2017', 100),
      new OrdinalSales('2018', 150),
      new OrdinalSales('2019', 200),
    ];

    final q3 = [
      new OrdinalSales('2016', 250),
      new OrdinalSales('2017', 300),
      new OrdinalSales('2018', 350),
      new OrdinalSales('2019', 350),
    ];

    final q4 = [
      new OrdinalSales('2016',300),
      new OrdinalSales('2017', 420),
      new OrdinalSales('2018', 500),
      new OrdinalSales('2019', 250),
    ];

    final total = [
      new OrdinalSales('2016', 760),
      new OrdinalSales('2017', 890),
      new OrdinalSales('2018', 1080),
      new OrdinalSales('2019', 900),
    ];

    final t1 = [
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 80),
      new OrdinalSales('2018', 90),
      new OrdinalSales('2019', 100),
    ];

    final t2 = [
      new OrdinalSales('2016', 125),
      new OrdinalSales('2017', 90),
      new OrdinalSales('2018', 120),
      new OrdinalSales('2019', 250),
    ];


    final t3 = [
      new OrdinalSales('2016', 200),
      new OrdinalSales('2017', 200),
      new OrdinalSales('2018', 320),
      new OrdinalSales('2019', 400),
    ];


    final t4 = [
      new OrdinalSales('2016', 280),
      new OrdinalSales('2017', 300),
      new OrdinalSales('2018', 400),
      new OrdinalSales('2019', 500),
    ];


    final t5 = [
      new OrdinalSales('2016', 700),
      new OrdinalSales('2017', 800),
      new OrdinalSales('2018', 930),
      new OrdinalSales('2019', 1250),
    ];


    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Q1',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
          labelAccessorFn: (OrdinalSales sales, _) =>
          'Q1: ${sales.sales.toString()}',
          data: q1),
      new charts.Series<OrdinalSales, String>(
          id: 'Q2',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          labelAccessorFn: (OrdinalSales sales, _) =>
          'Q2: ${sales.sales.toString()}',
          data: q2),
      new charts.Series<OrdinalSales, String>(
          id: 'Q3',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          labelAccessorFn: (OrdinalSales sales, _) =>
          'Q3: ${sales.sales.toString()}',
          data: q3),
      new charts.Series<OrdinalSales, String>(
          id: 'Q4',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          labelAccessorFn: (OrdinalSales sales, _) =>
          'Q4: ${sales.sales.toString()}',
          data: q4),


      new charts.Series<OrdinalSales, String>(
          id: 'total',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          labelAccessorFn: (OrdinalSales sales, _) =>
          ' ${sales.sales.toString()}',
          data: total),
      // Configure our custom bar target renderer for this series.
      new charts.Series<OrdinalSales, String>(
        id: 't1',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: t1,
      )
      // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
      new charts.Series<OrdinalSales, String>(
        id: 't2',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: t2,
      )
      // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
      new charts.Series<OrdinalSales, String>(
        id: 't3',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: t3,
      )
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
      new charts.Series<OrdinalSales, String>(
        id: 't4',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: t4,
      )
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
      new charts.Series<OrdinalSales, String>(
        id: 't5',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: t5,
      )
      // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
    ];
  }

}

class _ChrPageState extends State<ChrPage2> with NetigmaBaseMixin<ChrPage2> {

  @override
  Widget body() {
    var w  = MediaQuery.of(context).size.width;
    return   Column(
      children: <Widget>[
        Container(width: w, height: 400, child:BarSingleTargetLineChart(ChrPage2._createSampleData())),
        SizedBox(height: 50),
        Text("The expected total sales target is indicated by a red line.")
      ],
    );

  }



  @override
  String getTitle() {
    // TODO: implement getTitle
    return "Tolga Güler Sales By Year KPI ";
  }
}
