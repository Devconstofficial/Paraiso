import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paraiso/util/theme/theme_constants.dart';

class ProfileResTile extends StatelessWidget {
  final String image;
  final String title;
  final int amount;

  ProfileResTile({
    Key? key,
    required this.image,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25.w, 0.h, 25.w, 0.h),
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
      width: 380.w,
      decoration: BoxDecoration(
        color: softBlack,
        borderRadius: BorderRadius.circular(22.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // btn
          Image.asset(
            'assets/images/$image',
            width: 81.w,
          ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFFE4E4E4),
                  fontSize: 16.sp,
                  fontFamily: 'Recoleta',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'See Rewards',
                style: TextStyle(
                  color: Color(0xFFFF6154),
                  fontSize: 12.sp,
                  fontFamily: 'Recoleta',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                '10',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFFE4E4E4),
                  fontSize: 16.sp,
                  fontFamily: 'Recoleta',
                  fontWeight: FontWeight.w400,
                ),
              ),
              5.horizontalSpace,
              SvgPicture.asset(
                'assets/images/Food Filter_OBJECTS_458_13901.svg',
                width: 27.w,
              )
            ],
          )
        ],
      ),
    );
  }
}
