import 'package:boxting/domain/entities/documents.dart';
import 'package:boxting/features/register/register_bloc.dart';
import 'package:boxting/features/register/register_foreign_form.dart';
import 'package:boxting/features/register/register_screen.dart';
import 'package:boxting/features/terms/terms_screen.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/boxting_loading_dialog.dart';
import 'package:boxting/widgets/boxting_switch.dart';
import 'package:boxting/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class IdentifierRegisterScreen extends HookWidget {
  const IdentifierRegisterScreen({Key key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<RegisterBloc>(),
      builder: (_, __) => IdentifierRegisterScreen(),
    );
  }

  static Future<void> navigate(BuildContext context) async {
    await BoxtingNavigation.goto(
        context, (_) => IdentifierRegisterScreen.init(context));
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final documentTypeSelected = useState<DocumentOption>();
    final documentController = useTextEditingController();
    final termsAccepted = useState<bool>(false);

    return BoxtingScaffold(
      appBar: BoxtingAppBar(),
      body: Form(
        key: _formKey,
        child: LayoutBuilder(
          builder: (context, viewportConstraints) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: IdentifierBody(
                          documentTypeSelected: documentTypeSelected,
                          documentController: documentController,
                          termsAccepted: termsAccepted,
                          formKey: _formKey,
                        ),
                      ),
                    ),
                    LinkedText(
                      prefix: Text('¿Ya tienes una cuenta?'),
                      link: Text('Ingresa aquí'),
                      onTap: () => BoxtingNavigation.pop(context),
                    ),
                    SizedBox(height: 96),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IdentifierBody extends StatelessWidget {
  const IdentifierBody({
    Key key,
    @required this.documentTypeSelected,
    @required this.documentController,
    @required this.termsAccepted,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final ValueNotifier<DocumentOption> documentTypeSelected;
  final TextEditingController documentController;
  final ValueNotifier<bool> termsAccepted;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 48),
        const Text(
          'Vive una nueva experiencia de votación, gracias a Boxting',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 48),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              child: BoxtingSelect<DocumentOption>(
                items: DocumentOption.values,
                label: 'Documento',
                defaultValue: documentTypeSelected.value,
                formatter: (doc) => doc.name,
                onChanged: (doc) => documentTypeSelected.value = doc,
                validator: (value) =>
                    value == null ? 'Debe seleccionar una opción' : null,
              ),
            ),
            const SizedBox(height: 16),
            BoxtingInput(
              controller: documentController,
              labelText: 'Número de documento',
              type: BoxtingInputType.numeric,
              validator: (value) => identifierValidator(
                value,
                documentTypeSelected.value,
                documentController.text,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        BoxtingSwitch(
          value: termsAccepted.value,
          title: LinkedText(
            prefix: Text('Estas aceptando los '),
            link: Text(
              'Terminos y condiciones',
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => TermsScreen.navigate(context),
          ),
          onChanged: (bool value) => termsAccepted.value = value,
        ),
        const SizedBox(height: 24),
        BoxtingButton(
            child: Text('Continuar'),
            width: double.infinity,
            disabled: !termsAccepted.value,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                if (documentTypeSelected.value.type == '142') {
                  await RegisterForeignForm.navigate(
                    context,
                    documentController.text,
                  );
                } else {
                  await BoxtingLoadingDialog.show(
                    context,
                    futureBuilder: () async => getUserInformation(
                      context,
                      documentController.text.trim(),
                    ),
                    onSuccess: () => RegisterScreen.navigate(context),
                    onError: (e) async => await BoxtingModal.show(
                      context,
                      title: 'Error!',
                      message: e,
                    ),
                  );
                }
              }
            }),
      ],
    );
  }
}

void getUserInformation(BuildContext context, String identifier) async {
  final bloc = context.read<RegisterBloc>();
  await bloc.retrieveIdentifierInformation(identifier);
}

String identifierValidator(
  String value,
  DocumentOption documentTypeSelected,
  String document,
) {
  if (value.isEmpty) {
    return 'Debe ingresar un documento';
  }
  if (documentTypeSelected == DocumentOption.dni && document.length != 8) {
    return 'La longitud es incorrecta';
  }
  return null;
}
