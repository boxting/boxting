import 'package:boxting/features/terms/provider/fetch_terms.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TermsScreen extends HookConsumerWidget {
  const TermsScreen({super.key});

  static const route = 'terms';
  static const name = 'terms_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchTerms = ref.watch(fetchTermsProvider);
    return BoxtingScaffold(
      appBar: AppBar(title: const Text('Terminos y condiciones')),
      body: fetchTerms.when(
        data: (data) => Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(child: Html(data: data)),
        ),
        error: (e, st) => Text('Error'),
        loading: () => const BoxtingLoadingScreen(),
      ),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(context, (_) => const TermsScreen());
  }
}
