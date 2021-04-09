import 'package:boxting/features/results/providers.dart';
import 'package:boxting/features/results/result_chart.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boxting/data/network/response/result_response/result_response.dart';

class ResultsScreen extends HookWidget {
  final String election;

  ResultsScreen(this.election);

  static Future<void> navigate(BuildContext context, String election) async {
    await BoxtingNavigation.goto(context, (_) => ResultsScreen(election));
  }

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(getElectionResultProvider(election));
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: provider.when(
        loading: () => BoxtingLoadingScreen(),
        error: (e, _) => BoxtingErrorScreen(e.toString()),
        data: (data) => ResultScreenBody(result: data),
      ),
    );
  }
}

class ResultScreenBody extends HookWidget {
  final ResultResponseData result;

  const ResultScreenBody({Key key, this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('Resultados de ${result.election.name}', style: titleTextStyle),
          SizedBox(height: 16),
          Expanded(child: BarChartSample1(result)),
        ],
      ),
    );
  }
}
