class VolumeSecondItemSubChapterModel {
  int? id;
  String? dialogPicture;
  String? dialog;
  String? dialogTitle;

  VolumeSecondItemSubChapterModel(
      this.id, this.dialogPicture, this.dialog, this.dialogTitle);

  VolumeSecondItemSubChapterModel.fromMap(dynamic object) {
    id = object['_id'];
    dialogPicture = object['DialogPicture'];
    dialog = object['Dialog'];
    dialogTitle = object['DialogTitle'];
  }
}
