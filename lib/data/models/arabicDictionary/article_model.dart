class ArticleModel {
  final int id;
  final int nr;
  final String arInf;
  final String? form;
  final String? opt;
  final String? vocalization;
  final int? homonymNr;
  final String root;
  final String? forms;

  const ArticleModel({
    required this.id,
    required this.nr,
    required this.arInf,
    required this.form,
    required this.opt,
    required this.vocalization,
    required this.homonymNr,
    required this.root,
    required this.forms,
  });

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] as int,
      nr: map['nr'] as int,
      arInf: map['ar_inf'] as String,
      form: map['form'] as String?,
      opt: map['opt'] as String?,
      vocalization: map['vocalization'] as String?,
      homonymNr: map['homonym_nr'] as int?,
      root: map['root'] as String,
      forms: map['forms'] as String?,
    );
  }
}
