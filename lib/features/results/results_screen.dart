import 'package:boxting/data/network/response/result_response/result_response.dart';
import 'package:boxting/features/results/providers.dart';
import 'package:boxting/features/results/result_chart.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResultsScreen extends HookConsumerWidget {

  const ResultsScreen(this.election, {super.key});
  final String election;

  static Future<void> navigate(BuildContext context, String election) async {
    await BoxtingNavigation.goto(context, (_) => ResultsScreen(election));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(getElectionResultProvider(election));
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: provider.when(
        loading: () => const BoxtingLoadingScreen(),
        error: (e, _) => BoxtingErrorScreen(e.toString()),
        data: (data) => ResultScreenBody(result: data),
      ),
    );
  }
}

class ResultScreenBody extends HookWidget {

  const ResultScreenBody({required this.result, super.key});
  final ResultResponseData result;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Resultados de ${result.election.name}', style: titleTextStyle),
          const SizedBox(height: 16),
          Expanded(child: BarChartSample1(result)),
        ],
      ),
    );
  }
}
