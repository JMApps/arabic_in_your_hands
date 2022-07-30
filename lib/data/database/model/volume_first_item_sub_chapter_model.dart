class VolumeFirstItemSubChapterModel {
  final int id;
  final String dialogPicture;
  final String dialog;
  final String dialogTitle;

  VolumeFirstItemSubChapterModel(this.id, this.dialogPicture, this.dialog, this.dialogTitle);

  VolumeFirstItemSubChapterModel.fromMap(dynamic object)
      : id = object['_id'],
        dialogPicture = object['DialogPicture'],
        dialog = object['Dialog'],
        dialogTitle = object['DialogTitle'];
}
