import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final List<String> technologies;
  final String url;

  const ProjectCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.technologies,
    required this.url,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isArrowHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.sp),
          // border: Border.all(
          //   color: MyColors.border,
          // ),
          color: Colors.white,
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5.sp,
                    spreadRadius: 1.5.sp,
                    offset: Offset(0, 2.sp),
                  )
                ]
              : [
                  BoxShadow(
                    color: MyColors.textColor3.withOpacity(0.2),
                    blurRadius: 0.2.sp,
                    spreadRadius: 0.5.sp,
                    offset: Offset(0, 0.5.sp),
                  ),
                  BoxShadow(
                    color: MyColors.textColor3.withOpacity(0.2),
                    blurRadius: 0.2.sp,
                    spreadRadius: 0.5.sp,
                    offset: Offset(0, 0.5.sp),
                  )
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2.sp),
                topRight: Radius.circular(2.sp),
              ),
              child: Image.network(
                widget.imageUrl,
                height: 85.sp,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.network(
                  'https://www.tandempm.ie/wp-content/uploads/placeholder.png',
                  height: 85.sp,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 8.sp,
                right: 8.sp,
                top: 8.sp,
                bottom: 6.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: GoogleFonts.inter(
                            fontSize: 5.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _isHovered ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 100),
                        child: MouseRegion(
                          onEnter: (event) =>
                              setState(() => _isArrowHovered = true),
                          onExit: (event) =>
                              setState(() => _isArrowHovered = false),
                          child: GestureDetector(
                            onTap: () => UrlLauncherHelper.launchInNewTab(widget.url),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _isArrowHovered
                                    ? MyColors.tabBg
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.sp),
                                child: Icon(
                                  HugeIcons.strokeRoundedArrowUpRight01,
                                  size: 5.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 3.sp),

                  // Project Description
                  Text(
                    widget.description,
                    style: GoogleFonts.inter(
                      fontSize: 4.5.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textColor1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 6.sp),

                  // Technology Tags
                  Wrap(
                    spacing: 2.5.sp,
                    runSpacing: 5.sp,
                    children: widget.technologies
                        .map((tech) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.sp,
                                vertical: 1.sp,
                              ),
                              decoration: BoxDecoration(
                                color: MyColors.tabBg,
                                borderRadius: BorderRadius.circular(4.sp),
                              ),
                              child: Text(
                                tech,
                                style: GoogleFonts.inter(
                                  fontSize: 3.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.black,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
