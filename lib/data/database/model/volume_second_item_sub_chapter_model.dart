class VolumeSecondItemSubChapterModel {
  final int id;
  final String dialogPicture;
  final String dialog;
  final String dialogTitle;
  final int displayBy;

  VolumeSecondItemSubChapterModel(
    this.id,
    this.dialogPicture,
    this.dialog,
    this.dialogTitle,
    this.displayBy,
  );

  VolumeSecondItemSubChapterModel.fromMap(dynamic object)
      : id = object['_id'],
        dialogPicture = object['DialogPicture'],
        dialog = object['Dialog'],
        displayBy = object['DisplayBy'],
        dialogTitle = object['DialogTitle'];
}
