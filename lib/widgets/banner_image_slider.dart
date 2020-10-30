import 'package:carousel_pro/carousel_pro.dart';
import 'package:evaluation_task_flutter/size_config.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

Widget bannerImageSlider({double height}) {
  return Container(
    padding: EdgeInsets.all(10),
    height: SizeConfig.blockSizeVertical * (height ?? 30),
    // color: Colors.blue,
    child: Carousel(
      autoplay: false,
      showIndicator: false,
      images: [
        bannerImage(
            url:
                'https://massets.appsflyer.com/wp-content/uploads/2019/06/03103440/Smart-Banner-Announcement-Post-Blog-.jpg'),
        bannerImage(
            url:
                'https://massets.appsflyer.com/wp-content/uploads/2018/03/22105002/5-Easy-steps.png'),
        bannerImage(
            url:
                'https://massets.appsflyer.com/wp-content/uploads/2018/02/22111251/MobileWebBanners.png'),
      ],
    ),
  );
}
