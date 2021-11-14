class VolumeFirstItemSubChapterModel {
  int? id;
  String? dialogPicture;
  String? dialog;
  String? dialogTitle;

  VolumeFirstItemSubChapterModel(this.id, this.dialogPicture, this.dialog, this.dialogTitle);

  VolumeFirstItemSubChapterModel.fromMap(dynamic object) {
    id = object['_id'];
    dialogPicture = object['DialogPicture'];
    dialog = object['Dialog'];
    dialogTitle = object['DialogTitle'];
  }
}