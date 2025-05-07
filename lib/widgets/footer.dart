import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Copyright section
          Text(
            '\u00a9 2025 Jaishree Tiwari. All rights reserved.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 4.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.textColor1,
            ),
          ),

          Row(
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 4.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.textColor1,
                  ),
                ),
              ),
              SizedBox(width: 8.sp),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Terms of Service',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 4.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.textColor1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
