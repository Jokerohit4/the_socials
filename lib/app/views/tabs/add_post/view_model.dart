import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:the_socials/api/notifications_api.dart';
import 'package:the_socials/app/core/constants.dart';

import '../../../../api/api.dart';

class AddPostViewModel extends ChangeNotifier {
  final FireStoreApi storage = FireStoreApi();

  Future onPressAddPost(BuildContext context) async {
    final _file = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      //allowedExtensions: ['png', 'jpg'],
      type: FileType.image,
    );
    if (_file == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file Selected'),
        ),
      );
      return;
    }
    final path = _file.files.single.path!;
    final fileName = _file.files.single.name;
    NotificationsApi.showNotification(
      title: user.id,
      body: 'Post Added',
      payload: user.uid,
    );
    storage.uploadFile(path, fileName).then((value) => print('Upload Done'));
  }
}
