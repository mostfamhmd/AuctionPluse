import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Contact%20Us/presentation/view/widgets/title_name_text_field.dart';

import 'container_app_bar.dart';

class BodyContactUsPage extends StatelessWidget {
  const BodyContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ContainerAppBar(
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          const TitleNameAndTextField(
            title: "Full Name",
            maxLines: 1,
          ),
          SizedBox(
            height: 20.h,
          ),
          const TitleNameAndTextField(
            title: "E-mail",
            maxLines: 1,
          ),
          SizedBox(
            height: 20.h,
          ),
          const TitleNameAndTextField(
            title: "Subject",
            maxLines: 1,
          ),
          SizedBox(
            height: 20.h,
          ),
          const TitleNameAndTextField(
            title: "Message",
            maxLines: null,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
