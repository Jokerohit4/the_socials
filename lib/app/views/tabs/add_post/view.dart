import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({Key? key}) : super(key: key);

  @override
  _AddPostViewState createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final AddPostViewModel _viewModel = AddPostViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(addPost),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: DSColors.secondaryDark,
            padding: const EdgeInsets.symmetric(
                horizontal: DSSizes.xl, vertical: DSSizes.md),
            elevation: DSSizes.sm,
          ),
          onPressed: () => _viewModel.onPressAddPost(context),
          child: Text(
            addPost,
            style: TextStyle(
              fontSize: DSSizes.lg,
            ),
          ),
        ),
      ),
    );
  }
}
