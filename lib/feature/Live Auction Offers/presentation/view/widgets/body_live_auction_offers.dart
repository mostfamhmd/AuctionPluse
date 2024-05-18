import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_tap_bar.dart';
import 'view_tab_bar.dart';

class BodyLiveAuctionOffersView extends StatelessWidget {
  const BodyLiveAuctionOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> lists = ["Electronics", "Mobiles", "TVs", "Cars"];
    ValueNotifier<int> curent = ValueNotifier(0);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          height: 75.h,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lists.length,
            itemBuilder: ((context, index) => CustomTapBar(
                  onTap: () {
                    curent.value = index;
                  },
                  curent: curent,
                  index: index,
                  title: lists[index],
                )),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        ValueListenableBuilder(
          valueListenable: curent,
          builder: (BuildContext context, value, Widget? child) => ViewTabBar(
            title: lists[value],
          ),
        ),
      ],
    );
  }
}
