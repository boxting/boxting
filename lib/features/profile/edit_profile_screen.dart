import 'package:boxting/data/network/request/update_profile/update_profile_request.dart';
import 'package:boxting/domain/constants/constants.dart';
import 'package:boxting/domain/entities/user.dart';
import 'package:boxting/features/profile/providers.dart';
import 'package:boxting/widgets/boxting_button.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/styles.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends HookWidget {
  final User user;

  static Future<void> navigate(BuildContext context, User user) async {
    await BoxtingNavigation.goto(context, (_) => EditProfileScreen(user));
  }

  EditProfileScreen(this.user);
  @override
  Widget build(BuildContext context) {
    final phoneController = useTextEditingController(text: user.phone);
    final mailController = useTextEditingController(text: user.mail);
    final birthdayController = useTextEditingController(text: user.birthday);

    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Editar perfil', style: titleTextStyle),
            SizedBox(height: 48),
            ListTile(
              title: Text('${user.name} ${user.lastname}'),
              subtitle: Text(user.dni),
              leading: Icon(Icons.perm_identity),
            ),
            SizedBox(height: 24),
            BoxtingInput(
              labelText: 'Celular',
              controller: phoneController,
              suffix: Icon(Icons.phone),
            ),
            SizedBox(height: 24),
            BoxtingInput(
              labelText: 'Correo',
              controller: mailController,
              suffix: Icon(Icons.mail),
            ),
            SizedBox(height: 24),
            BoxtingInput(
              labelText: 'Cumpleaños',
              controller: birthdayController,
              suffix: Icon(Icons.cake),
              readOnly: true,
              onFocus: () => DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1900, 3, 5),
                maxTime: DateTime.now(),
                onConfirm: (date) {
                  final df = DateFormat(Constants.LOCAL_DATE_FORMAT);
                  birthdayController.text = df.format(date);
                },
                currentTime: DateTime.now(),
                locale: LocaleType.es,
              ),
            ),
            SizedBox(height: 48),
            BoxtingButton(
              child: Text('Guardar'),
              onPressed: () => BoxtingLoadingDialog.show(
                context,
                futureBuilder: () async {
                  final date = DateFormat(Constants.LOCAL_DATE_FORMAT)
                      .parse(birthdayController.text);
                  final reqDate =
                      DateFormat(Constants.SERVER_DATE_FORMAT).format(date);
                  final request = UpdateProfileRequest(
                      mailController.text, phoneController.text, reqDate);
                  await context
                      .read(profileEventProvider)
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
