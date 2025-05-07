import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaishree/utils/colors.dart';

class SkillsCard extends StatefulWidget {
  final String icon;
  final String text;

  const SkillsCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  State<SkillsCard> createState() => _SkillsCardState();
}

class _SkillsCardState extends State<SkillsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        width: 65.sp,
        height: 40.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.sp),
          border: Border.all(
            color: MyColors.textColor3.withOpacity(0.6),
            width: 0.3.sp,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: MyColors.textColor3.withOpacity(0.7),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: MyColors.textColor3.withAlpha(50),
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                ],
        ),
        child: Padding(
          padding: EdgeInsets.all(7.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColors.textColor2,
                    width: 0.3.sp,
                  ),
                  borderRadius: BorderRadius.circular(4.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.sp),
                  child: Image.network(
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error); 
                    },
                    widget.icon,
                    height: 10.sp,
                    width: 10.sp,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 3.sp),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: MyColors.black,
                  fontSize: 4.5.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
