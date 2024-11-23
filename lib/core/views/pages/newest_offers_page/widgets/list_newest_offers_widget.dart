import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mazaya/core/views/pages/newest_offers_page/widgets/read_more_button_widget.dart';

class ListNewestOffersWidget extends StatelessWidget {
  const ListNewestOffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .6,
      child: CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, u, index) {
            return Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(45)),
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/image/img_rectangle_23.png",
                        width: MediaQuery.sizeOf(context).width * 0.5,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: FittedBox(
                          child: Text(
                            "مجمع لمسه الطبي",
                            style: TextStyle(
                                fontSize: 1500,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: const FittedBox(
                          child: Text(
                            "%25",
                            style: TextStyle(
                                fontSize: 1500,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const ReadMoreButtonWidget(),
                    ],
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: MediaQuery.sizeOf(context).height * .6,
            autoPlay: true,
          )),
    );
  }
}
