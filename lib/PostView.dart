// views/post_view.dart

import 'package:example_api/PostController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostView extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX API Example'),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];
            return Card(
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            );
          },
        );
      }),
    );
  }
}
