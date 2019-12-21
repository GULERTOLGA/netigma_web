import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'chart1.dart';
import 'localisable_mixin.dart';
class ChrPage extends StatefulWidget {
  @override
  _ChrPageState createState() => _ChrPageState();
  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final q1 = [
      new OrdinalSales('2016', 20),
      new OrdinalSales('2017', 25),
      new OrdinalSales('2018', 30),
      new OrdinalSales('2019', 35),
    ];

    final q2 = [
      new OrdinalSales('2016', 15),
      new OrdinalSales('2017', 50),
      new OrdinalSales('2018', 10),
      new OrdinalSales('2019', 20),
    ];

    final q3 = [
      new OrdinalSales('2016', 25),
      new OrdinalSales('2017', 15),
      new OrdinalSales('2018', 20),
      new OrdinalSales('2019', 35),
    ];

    final q4 = [
      new OrdinalSales('2016', 25),
      new OrdinalSales('2017', 15),
      new OrdinalSales('2018', 50),
      new OrdinalSales('2019', 25),
    ];

    final targetLineData = [
      new OrdinalSales('2016', 96),
      new OrdinalSales('2017', 80),
      new OrdinalSales('2018', 90),
      new OrdinalSales('2019', 100),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Q4',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          labelAccessorFn: (OrdinalSales sales, _) =>
          'Q4: ${sales.sales.toString()} m.',
          data: q4),
      new charts.Series<OrdinalSales, String>(
          id: 'Q3',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          labelAccessorFn: (OrdinalSales sales, _) =>
          'Q3: ${sales.sales.toString()} m.',
          data: q3),
      new charts.Series<OrdinalSales, String>(
          id: 'Q2',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          labelAccessorFn: (OrdinalSales sales, _) =>
          'Q2: ${sales.sales.toString()} m.',
          data: q2),
      new charts.Series<OrdinalSales, String>(
          id: 'Q1',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
          labelAccessorFn: (OrdinalSales sales, _) =>
          'Q1: ${sales.sales.toString()} m.',
          data: q1),
      new charts.Series<OrdinalSales, String>(
          id: ' Q4',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          data: targetLineData)
      // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
    ];
  }

}

class _ChrPageState extends State<ChrPage> with NetigmaBaseMixin<ChrPage> {

  @override
  Widget body() {
    var w  = MediaQuery.of(context).size.width;
    return   Column(
      children: <Widget>[
        Container(width: w, height: 400, child:GroupedBarSingleTargetLineChart(ChrPage._createSampleData())),
        SizedBox(height: 50),
        Text("The expected total sales target is indicated by a red line.")
      ],
    );

  }



  @override
  String getTitle() {
    // TODO: implement getTitle
    return "Targets By Year KPI ";
  }
}
