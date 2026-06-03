# API Reference: chart

Source file: `lib/manager/presentation/pages/income/widgets/chart.dart`

## Classes

### class `SalesChart`

## Whitelisted API Endpoints

### `SalesChart({ super.key, required this.price, required this.chart, required this.times, required this.isDay, required this.isLoading, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `SizedBox(height: 268.h, child: ListView( scrollDirection: Axis.horizontal, children: [ SizedBox( width: times.length > 7 ? times.length * 40 : MediaQuery.sizeOf(context).width - 80, child: Padding( padding: REdgeInsets.only(top: 24), child: isLoading ? const Loading() : chart.isNotEmpty ? LineChart(mainData()) : Center( child: Text( AppHelpers.getTranslation(TrKeys.needOrder), style: AppStyle.interSemi(size: 22), ), ), ), ), ], ), ); } Widget bottomTitleWidgets(double value, TitleMeta meta)`
*No documentation provided (generation failed).*

### `AutoSizeText(AppHelpers.numberFormat( value.toInt() == 0 ? 0 : price[value.toInt() - 1], ), style: style, textAlign: TextAlign.left, maxLines: 1, ); } LineChartData mainData()`
*No documentation provided (generation failed).*
