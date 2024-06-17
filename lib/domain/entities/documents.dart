class DocumentOption {

  const DocumentOption._(this.index, this.name, this.type);

  factory DocumentOption.from(String type) {
    return values.firstWhere((it) => it.type == type);
  }
  final String name;
  final String type;
  final int index;

  static const dni = DocumentOption._(0, 'DNI', '141');
  static const foreing = DocumentOption._(1, 'Extranjero', '142');

  static const values = <DocumentOption>[dni, foreing];
}
