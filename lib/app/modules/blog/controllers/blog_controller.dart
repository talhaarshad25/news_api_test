import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:get/get.dart';

import '../../../../Models/blog.dart';

class BlogController extends GetxController {
  //TODO: Implement BlogController

  final String apiUrl = 'https://api.verticalsols.com/api/blogs/getblogs'; // Replace with your API URL

  Future<List<BlogModel>> fetchBlogs() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((json) => BlogModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
