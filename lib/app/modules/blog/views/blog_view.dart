import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_api_test/Models/blog.dart';

import '../controllers/blog_controller.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  final controller = Get.put(BlogController());
  late Future<List<BlogModel>> _blogsFuture;

  @override
  void initState() {
    super.initState();
    _blogsFuture = controller.fetchBlogs();
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Blog News'),
      ),
      body: FutureBuilder<List<BlogModel>>(
        future: _blogsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final blog = snapshot.data?[index];
                return ListTile(
                  leading: Image.network(blog?.fullBlogThumbnailUrl ?? ''),
                  title: Text(blog?.blogTitle ?? ''),
                  subtitle: Text(blog?.author.fullName ?? ''),
                  onTap: () {
                    // Handle tap on the blog news item
                    // You can navigate to the blog details screen or show a dialog, etc.
                  },
                );
              },
            );
          }
        },
      ),
    );
  }


}

