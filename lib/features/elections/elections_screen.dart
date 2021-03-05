import 'package:boxting/data/network/response/elections_response/elections_response.dart';
import 'package:boxting/domain/repository/elections_repository.dart';
import 'package:boxting/service_locator.dart';
import 'package:boxting/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'election_item.dart';
import 'elections_bloc.dart';

class ElectionsScreen extends StatelessWidget {
  final String eventId;

  const ElectionsScreen({Key key, this.eventId}) : super(key: key);
  static Widget init(BuildContext context, String id) {
    return ChangeNotifierProvider(
      create: (_) => ElectionsBloc(getIt.get<ElectionsRepository>())
        ..fetchElectionsFromEvent(id),
      builder: (_, __) => ElectionsScreen(eventId: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ElectionsBloc>();
    if (bloc.elections != null) return ElectionsScreenBody(bloc.elections);
    return Center(child: CircularProgressIndicator());
  }
}

class ElectionsScreenBody extends StatelessWidget {
  final List<ElectionResponseData> elections;

  const ElectionsScreenBody(this.elections, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (elections.isEmpty) return BoxtingEmptyScreen('No hay elecciones aún.');
    return ListView.builder(
      itemCount: elections.length,
      itemBuilder: (_, index) => ElectionItem(election: elections[index]),
    );
  }
}
