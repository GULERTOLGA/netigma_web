// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Bar chart example
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarSingleTargetLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  BarSingleTargetLineChart(this.seriesList, {this.animate});
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(seriesList,
        animate: animate,
        barGroupingType: charts.BarGroupingType.grouped,

        barRendererDecorator: new charts.BarLabelDecorator<String>(),
        // Hide domain axis.

        customSeriesRenderers: [
          new charts.BarTargetLineRendererConfig(            // ID used to link series to this renderer.

              customRendererId: 'customTargetLine',
              groupingType: charts.BarGroupingType.grouped)
        ]);
  }


}

