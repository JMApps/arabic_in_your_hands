class DictionaryCategoryModel {
  int? id;
  String? wordCategoryTitle;
  String? wordCategoryColor;
  int? priority;
  String? addDateTime;
  String? changeDateTime;

  DictionaryCategoryModel(
    this.id,
    this.wordCategoryTitle,
    this.wordCategoryColor,
    this.priority,
    this.addDateTime,
    this.changeDateTime,
  );

  DictionaryCategoryModel.fromMap(dynamic object) {
    id = object['_id'];
    wordCategoryTitle = object['wordCategoryTitle'];
    wordCategoryColor = object['wordCategoryColor'];
    priority = object['priority'];
    addDateTime = object['addDateTime'];
    changeDateTime = object['changeDateTime'];
  }
}
