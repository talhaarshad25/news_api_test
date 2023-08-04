import 'package:get/get.dart';

import '../modules/blog/bindings/blog_binding.dart';
import '../modules/blog/views/blog_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BLOG;

  static final routes = [
    GetPage(
      name: _Paths.BLOG,
      page: () => const BlogView(),
      binding: BlogBinding(),
    ),
  ];
}
