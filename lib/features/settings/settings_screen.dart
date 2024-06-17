import 'package:boxting/features/biometric/view/biometric_screen.dart';
import 'package:boxting/features/faq/faq_screen.dart';
import 'package:boxting/features/settings/providers.dart';
import 'package:boxting/features/terms/view/terms_screen.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  static Future navigate(BuildContext context) async {
    await BoxtingNavigation.goto(context, (_) => const SettingsScreen());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loadBiometricProvider);
    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: provider.when(
          loading: () => const BoxtingLoadingScreen(),
          data: (enabled) => SettingsScreenBody(biometricEnabled: enabled),
          error: (e, _) => BoxtingErrorScreen(e.toString()),
        ),
      ),
    );
  }
}

class SettingsScreenBody extends HookWidget {
  const SettingsScreenBody({required this.biometricEnabled, super.key});
  final bool biometricEnabled;
  @override
  Widget build(BuildContext context) {
    final biometricMessage = biometricEnabled
        ? 'Elimina tu huella digital como medio para autenticarte'
        : 'Agrega tu huella digital como medio para autenticarte';
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('Configuración', style: titleTextStyle),
          const SizedBox(height: 48),
          ListTile(
            leading: const Icon(Icons.fingerprint),
            title: const Text('Biometria'),
            subtitle: Text(biometricMessage),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => setBiometricInformation(context, biometricEnabled),
          ),
          ListTile(
            leading: const Icon(Icons.text_format_sharp),
            title: const Text('Terminos y condiciones'),
            subtitle: const Text(
              'Conoce los terminos y condiciones de la aplicación',
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () =>
                BoxtingNavigation.goto(context, (_) => const TermsScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.question_answer),
            title: const Text('Preguntas frecuentes'),
            subtitle: const Text(
              'Conoce las respuestas a las preguntas más frecuentes acerca de la aplicación',
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () =>
                BoxtingNavigation.goto(context, (_) => const FaqScreen()),
          ),
          const Spacer(),
          const BoxtingVersion(),
        ],
      ),
    );
  }

  Future<void> setBiometricInformation(
    BuildContext context,
    bool enabled,
  ) async {
    if (enabled) {
      // await CoolAlert.show(
      //   context: context,
      //   type: CoolAlertType.confirm,
      //   title: 'Alerta',
      //   text: '¿Desea eliminar la huella registrada?',
      //   confirmBtnText: 'Sí',
      //   cancelBtnText: 'No',
      //   barrierDismissible: false,
      //   onConfirmBtnTap: () async {
      //     await context.read(setBioInformationProvider(false));
      //     BoxtingNavigation.pop(context);
      //   },
      //   confirmBtnColor: Colors.green,
      // );
    } else {
      await BiometricScreen.navigate(context);
    }
  }
}

class BoxtingVersion extends HookConsumerWidget {
  const BoxtingVersion({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(packageProvider);
    return provider.when(
      loading: () => const CircularProgressIndicator(),
      data: (version) => Center(
        child: RichText(
          text: TextSpan(
            text: 'Versión ',
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: version,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      error: (e, _) => const Text('Error'),
    );
  }
}
