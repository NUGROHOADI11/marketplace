import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/controllers/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = Get.mediaQuery.size.height * 1;
    final width = Get.mediaQuery.size.width * 1;
    final ProductController productController = Get.put(ProductController());

    return Container(
      color: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          
          const Text(
            "What would you like your sushi today?",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: width * 0.88,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height * 0.055,
                    width: width * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5),
                      color: const Color(0xff230C02),
                    ),
                    child: Center(
                      child: Text(
                        "Sushi",
                        style: GoogleFonts.dmSans(
                          fontSize: width * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height * 0.055,
                    width: width * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5),
                      color: const Color.fromARGB(255, 140, 138, 138),
                    ),
                    child: Center(
                      child: Text(
                        "Burger",
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height * 0.055,
                    width: width * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5),
                      color: const Color.fromARGB(255, 140, 138, 138),
                    ),
                    child: Center(
                      child: Text(
                        "Pizza",
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Recommendation",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: height ,
            width: width * 0.9,
            child: Obx(() {
              if (productController.products.isEmpty) {
                if (productController.products.isEmpty) {
                  productController.fetchProducts();
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: width * 0.01,
                      ),
                      child: Card(
                        color: const Color.fromARGB(255, 32, 34, 45),
                        elevation: 0.4,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    productController.products[index].image,
                                    width: width * 0.3,
                                    height: height * 0.15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productController.products[index].title,
                                        style: GoogleFonts.dmSans(
                                          fontSize: width * 0.045,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        productController
                                            .products[index].restaurantChain,
                                        style: GoogleFonts.dmSans(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.bookmark,
                                  size: 25,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
