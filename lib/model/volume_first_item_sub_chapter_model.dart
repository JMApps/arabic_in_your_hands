class VolumeFirstItemSubChapterModel {
  int? id;
  String? dialogPicture;
  String? dialogTitle;

  VolumeFirstItemSubChapterModel(this.id, this.dialogPicture, this.dialogTitle);

  VolumeFirstItemSubChapterModel.fromMap(dynamic object) {
    id = object['_id'];
    dialogPicture = object['DialogPicture'];
    dialogTitle = object['DialogTitle'];
  }
}