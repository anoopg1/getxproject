import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_project/api.dart';
import 'package:getx_project/getx.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyController());
    ApiServices().fetchProducts();
    controller.getProductList();

    final deviceHeight = MediaQuery.sizeOf(context).height;
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Obx(() {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    height: deviceHeight * 0.30,
                    width: deviceWidth,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(controller.products![index]
                                     .thumbnail
                                      .toString()))),
                          height: deviceHeight * 0.30,
                          width: deviceWidth * 0.40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${controller.products![index].id
                                .toString()}'),
                            Text("283")
                          ],
                        ),
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: controller.products!.length??0),
        ));
      }),
    );
  }
}
