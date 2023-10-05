class ArticleEntity {
  final int id;
  final int nr;
  final String arInf;
  final String? form;
  final String? opt;
  final String? vocalization;
  final int? homonymNr;
  final String root;
  final String? forms;

  const ArticleEntity({
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
}
