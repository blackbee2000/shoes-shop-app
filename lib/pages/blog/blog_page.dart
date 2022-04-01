import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_shop_app/pages/blog/blog_controller.dart';
import 'package:shoes_shop_app/pages/blog/detail/blog_detail_page.dart';

class BlogPage extends StatelessWidget {
  final blogController = Get.put(BlogController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.asset(
              "assets/images/blog_banner.jpg",
              width: double.infinity,
              height: 225,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 60,
              left: 120,
              right: 120,
              child: Image.asset(
                "assets/images/lifekicky.png",
                fit: BoxFit.contain,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.black.withOpacity(0),
              appBar: AppBar(
                backgroundColor: Colors.black.withOpacity(0),
                title: const Text(
                  "Blog",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: false,
                actions: [
                  GestureDetector(
                    child: Image.asset(
                      "assets/icons/icon_cart.png",
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: GestureDetector(
                      child: Image.asset(
                        "assets/icons/icon_message.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              body: GetBuilder<BlogController>(
                init: blogController,
                builder: (controller) => RefreshIndicator(
                  onRefresh: () async {
                    controller.update();
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 140,
                    ),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(BlogDetailPage());
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            bottom: 20,
                            left: 20,
                            right: 20,
                          ),
                          height: 125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(
                                    0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 110,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/blog-item.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 5,
                                height: double.infinity,
                                color: const Color(0xffFFD9D9),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 15,
                                  ),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Jordan chất điên, cháy cả cộng đồng mạng',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'It is a long established fact that a reader will be distracted by the readable content of a page, It is a long established fact that a reader will be distracted by the readable content of a page',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            "assets/icons/icon_calendar.png",
                                            width: 10,
                                            height: 10,
                                            fit: BoxFit.contain,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            '10:00 - 27/02/2022',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 9,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
