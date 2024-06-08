import 'package:boxting/data/network/response/result_response/result_response.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BarChartSample1 extends HookWidget {
  BarChartSample1(this.result, {super.key});
  final ResultResponseData result;
  final Color barBackgroundColor = Colors.white;

  final Duration animDuration = const Duration(milliseconds: 250);

  final touchedIndex = useState<int>(-1);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Cantidad de votos emitidos: ${result.totalVotes}',
                  style: subTitleTextStyle,
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: BarChart(
                      mainBarData(context),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartData mainBarData(BuildContext context) {
    return BarChartData(
      maxY: result.totalVotes.toDouble(),
      alignment: BarChartAlignment.spaceEvenly,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final candidate = result.candidates[group.x];
            final weekDay = candidate.firstName;
            final percentVote = candidate.voteCount * 100 / result.totalVotes;
            return BarTooltipItem(
              '$weekDay\n${candidate.voteCount}(${percentVote.toStringAsFixed(1)}%)',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          },
        ),
        touchCallback: (touchEvent, barTouchResponse) {
          if (barTouchResponse!.spot != null) {
            touchedIndex.value = barTouchResponse.spot!.touchedBarGroupIndex;
          } else {
            touchedIndex.value = -1;
          }
        },
      ),
      titlesData: const FlTitlesData(),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroup2s(),
    );
  }

  List<BarChartGroupData> showingGroup2s() =>
      result.candidates.map((candidate) {
        final index = result.candidates.indexOf(candidate);
        return makeGroupData(
          index,
          candidate.voteCount.toDouble(),
          isTouched: index == touchedIndex.value,
        );
      }).toList();

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.blue,
    double width = 25,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 0.25 : y,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}

extension XString on String {
  String toColor() {
    var hash = 0;
    for (var i = 0; i < length; i++) {
      hash = codeUnitAt(i) + ((hash << 5) - hash);
    }
    var color = '#';
    for (var i = 0; i < 3; i++) {
      final value = (hash >> (i * 8)) & 0xFF;
      color += '00${value.toStringAsPrecision(16)}'.substring(-2);
    }
    return color;
  }
}
