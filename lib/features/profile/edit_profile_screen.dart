import 'package:boxting/data/network/request/update_profile/update_profile_request.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/entities/user.dart';
import 'package:boxting/features/profile/providers.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends HookConsumerWidget {
  final User user;

  static Future<void> navigate(BuildContext context, User user) async {
    await BoxtingNavigation.goto(context, (_) => EditProfileScreen(user));
  }

  const EditProfileScreen(this.user, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController(text: user.phone);
    final mailController = useTextEditingController(text: user.mail);
    final birthdayController = useTextEditingController(text: user.birthday);

    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Editar perfil', style: titleTextStyle),
            const SizedBox(height: 48),
            ListTile(
              title: Text('${user.name} ${user.lastname}'),
              subtitle: Text(user.dni),
              leading: const Icon(Icons.perm_identity),
            ),
            const SizedBox(height: 24),
            BoxtingInput(
              labelText: 'Celular',
              controller: phoneController,
              suffix: const Icon(Icons.phone),
            ),
            const SizedBox(height: 24),
            BoxtingInput(
              labelText: 'Correo',
              controller: mailController,
              suffix: const Icon(Icons.mail),
            ),
            const SizedBox(height: 24),
            BoxtingInput(
              labelText: 'Cumpleaños',
              controller: birthdayController,
              suffix: const Icon(Icons.cake),
              readOnly: true,
              onFocus: () => DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1900, 3, 5),
                maxTime: DateTime.now(),
                onConfirm: (date) {
                  final df = DateFormat(Constants.localDateFormat);
                  birthdayController.text = df.format(date);
                },
                currentTime: DateTime.now(),
                locale: LocaleType.es,
              ),
            ),
            const SizedBox(height: 48),
            BoxtingButton(
              child: const Text('Guardar'),
              onPressed: () => BoxtingLoadingDialog.show(
                context,
                futureBuilder: () async {
                  final date = DateFormat(Constants.localDateFormat)
                      .parse(birthdayController.text);
                  final reqDate =
                      DateFormat(Constants.serverDateFormat).format(date);
                  final request = UpdateProfileRequest(
                      mailController.text, phoneController.text, reqDate);

                  ref
                      .read<ProfileEvent>(profileEventProvider.notifier)
                      .updateProfile(request);
                },
                onError: (e) => BoxtingModal.show(
                  context,
                  title: 'Error',
                  message: e.toString(),
                ),
                onSuccess: () => BoxtingNavigation.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
