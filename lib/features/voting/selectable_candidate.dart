import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/features/candidates/candidate_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectableCandidate extends HookWidget {
  final CandidateUiModel candidateUiModel;

  SelectableCandidate(this.candidateUiModel);

  @override
  Widget build(BuildContext context) {
    final borderColor = candidateUiModel.isSelected
        ? Theme.of(context).primaryColor
        : Colors.transparent;
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5.0, color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        child: CandidateItem(candidate: candidateUiModel.candidate)
    );
  }
}

class CandidateUiModel {
  final bool isSelected;
  final CandidateResponseData candidate;

  CandidateUiModel({this.isSelected, this.candidate});
}
