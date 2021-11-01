import 'package:clima_e_tempo/app/modules/home/home_controller.dart';
import 'package:clima_e_tempo/app/modules/home/widgets/climate_image_widget.dart';
import 'package:clima_e_tempo/app/modules/home/widgets/shimmer_element_widget.dart';
import 'package:clima_e_tempo/app/modules/home/widgets/wave_clipper_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatDay = DateFormat(
      'dd/MM',
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                ClipPath(
                  child: Container(
                    width: Get.width,
                    height: Get.height * .8,
                    color: const Color(0xFF7085FC),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 15),
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          height: 47,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: controller.searchController,
                            onSubmitted: (value) async {
                              if (value.trim().isNotEmpty) {
                                await controller.getClimateForCityName(value);
                                controller.clearSearchController();
                              } else {
                                return;
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                FontAwesomeIcons.search,
                                size: 17,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              border: InputBorder.none,
                              isCollapsed: false,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        controller.currentClimateIsNull
                            ? const ShimmerElementWidget(
                                w: 150,
                                h: 30,
                              )
                            : Text(
                                controller.currentClimate.name,
                                style: GoogleFonts.encodeSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        controller.currentClimateIsNull
                            ? const ShimmerElementWidget(
                                w: 200,
                                h: 200,
                                paddingBottom: 15,
                              )
                            : ClimateImageWidget(
                                clime: controller
                                    .currentClimate.weathers[0].details,
                              ),
                        controller.currentClimateIsNull
                            ? const ShimmerElementWidget(
                                w: 125,
                                h: 125,
                              )
                            : Text(
                                controller.currentClimate.temp
                                        .toStringAsFixed(0) +
                                    'º',
                                style: GoogleFonts.encodeSans(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 80,
                                ),
                              ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            controller.currentClimateIsNull
                                ? const ShimmerElementWidget(
                                    w: 50,
                                    h: 50,
                                  )
                                : Column(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.tint,
                                        color: Colors.white.withOpacity(0.9),
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Umidade',
                                        style: GoogleFonts.encodeSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        controller.currentClimate.humidity
                                            .toString(),
                                        style: GoogleFonts.encodeSans(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                            controller.currentClimateIsNull
                                ? const ShimmerElementWidget(
                                    w: 50,
                                    h: 50,
                                  )
                                : Column(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.wind,
                                        color: Colors.white.withOpacity(0.9),
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Ventos',
                                        style: GoogleFonts.encodeSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      controller.currentClimateIsNull
                                          ? const ShimmerElementWidget(
                                              w: 150,
                                              h: 30,
                                            )
                                          : Text(
                                              controller
                                                  .currentClimate.windSpeed
                                                  .toStringAsFixed(1),
                                              style: GoogleFonts.encodeSans(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 17,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ],
                                  ),
                          ],
                        )
                      ],
                    ),
                  ),
                  clipper: WaveClipperWidget(),
                ),
                SizedBox(
                  height: Get.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formatDay.format(
                          DateTime.now(),
                        ),
                        style: GoogleFonts.encodeSans(
                          fontWeight: FontWeight.w900,
                          fontSize: 35,
                          color: const Color(0xFF7085FC),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
