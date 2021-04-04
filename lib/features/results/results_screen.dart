import 'package:boxting/features/results/providers.dart';
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
        data: (data) => ResultScreenBody(results: data),
      ),
    );
  }
}

class ResultScreenBody extends StatelessWidget {
  final List<ResultResponseData> results;

  const ResultScreenBody({Key key, this.results}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          return Text('${result.lastName} ${result.voteCount}');
        },
      ),
    );
  }
}
