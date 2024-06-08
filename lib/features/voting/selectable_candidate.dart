import 'package:boxting/data/network/response/candidates_response/candidates_response.dart';
import 'package:boxting/features/candidates/candidate_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectableCandidate extends HookWidget {

  const SelectableCandidate(this.candidateUiModel, {super.key});
  final CandidateUiModel candidateUiModel;

  @override
  Widget build(BuildContext context) {
    final borderColor = candidateUiModel.isSelected
        ? Theme.of(context).primaryColor
        : Colors.transparent;
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: CandidateItem(candidate: candidateUiModel.candidate),);
  }
}

class CandidateUiModel {

  CandidateUiModel({
    required this.isSelected,
    required this.candidate,
  });
  final bool isSelected;
  final CandidateElementResponseData candidate;
}
