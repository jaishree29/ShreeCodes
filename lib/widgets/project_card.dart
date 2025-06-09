import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/utils/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final List<String> technologies;
  final String? url;
  final String? previewUrl;

  const ProjectCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.technologies,
    this.url,
    this.previewUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isArrowHovered = false;
  bool _isPreviewHovered = false;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isMobile ? 12.sp : 2.sp),
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
                    color: MyColors.textColor3.withOpacity(
                      isMobile
                          ? 0.5
                          : isTablet
                              ? 0.5
                              : 0.2,
                    ),
                    blurRadius: 0.2.sp,
                    spreadRadius: 0.5.sp,
                    offset: Offset(0, 0.5.sp),
                  ),
                  BoxShadow(
                    color: MyColors.textColor3.withOpacity(
                      isMobile
                          ? 0.5
                          : isTablet
                              ? 0.5
                              : 0.2,
                    ),
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
                topLeft: Radius.circular(
                  isMobile
                      ? 12.sp
                      : isTablet
                          ? 4.sp
                          : 2.sp,
                ),
                topRight: Radius.circular(
                  isMobile
                      ? 12.sp
                      : isTablet
                          ? 4.sp
                          : 2.sp,
                ),
              ),
              child: Image.asset(
                widget.imageUrl,
                height: isMobile
                    ? 180.sp
                    : isTablet
                        ? 95.sp
                        : 85.sp,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.network(
                  'https://www.tandempm.ie/wp-content/uploads/placeholder.png',
                  height: isMobile
                      ? 180.sp
                      : isTablet
                          ? 95.sp
                          : 85.sp,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: isMobile
                    ? 15.sp
                    : isTablet
                        ? 12.sp
                        : 8.sp,
                right: isMobile
                    ? 15.sp
                    : isTablet
                        ? 12.sp
                        : 8.sp,
                top: isMobile
                    ? 25.sp
                    : isTablet
                        ? 12.sp
                        : 8.sp,
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
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: isMobile
                                ? 16.sp
                                : isTablet
                                    ? 9.sp
                                    : 5.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // onEnter: (event) =>
                      //           setState(() => _isArrowHovered = true),
                      //       onExit: (event) =>
                      //           setState(() => _isArrowHovered = false),
                      if (!isMobile)
                        Row(
                          children: [
                            widget.url != null
                                ? AnimatedOpacity(
                                    opacity: _isHovered ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 100),
                                    child: MouseRegion(
                                      onEnter: (event) => setState(
                                          () => _isArrowHovered = true),
                                      onExit: (event) => setState(
                                          () => _isArrowHovered = false),
                                      child: GestureDetector(
                                        onTap: () =>
                                            UrlLauncherHelper.launchInNewTab(
                                                widget.url!),
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
                                              HugeIcons
                                                  .strokeRoundedArrowUpRight01,
                                              size: isTablet ? 8.5.sp : 5.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            widget.previewUrl != null
                                ? SizedBox(width: 2.sp)
                                : SizedBox.shrink(),
                            widget.previewUrl != null
                                ? AnimatedOpacity(
                                    opacity: _isHovered ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 100),
                                    child: MouseRegion(
                                      onEnter: (event) => setState(
                                          () => _isPreviewHovered = true),
                                      onExit: (event) => setState(
                                          () => _isPreviewHovered = false),
                                      child: GestureDetector(
                                        onTap: () =>
                                            UrlLauncherHelper.launchInNewTab(
                                                widget.previewUrl!),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: _isPreviewHovered
                                                ? MyColors.tabBg
                                                : Colors.transparent,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.sp),
                                            child: Icon(
                                              HugeIcons.strokeRoundedView,
                                              size: isTablet ? 8.5.sp : 5.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      if (isMobile) // Show static arrow on mobile
                        Row(
                          children: [
                            widget.url != null
                                ? GestureDetector(
                                    onTap: () =>
                                        UrlLauncherHelper.launchInNewTab(
                                            widget.url!),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: MyColors.tabBg,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.sp),
                                        child: Icon(
                                          HugeIcons.strokeRoundedArrowUpRight01,
                                          size: 16.sp,
                                          color: MyColors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            widget.previewUrl != null
                                ? SizedBox(width: 2.sp)
                                : SizedBox.shrink(),
                            widget.previewUrl != null
                                ? GestureDetector(
                                    onTap: () =>
                                        UrlLauncherHelper.launchInNewTab(
                                            widget.previewUrl!),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: MyColors.tabBg,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.sp),
                                        child: Icon(
                                          HugeIcons.strokeRoundedView,
                                          size: 16.sp,
                                          color: MyColors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                    ],
                  ),

                  SizedBox(
                    height: isMobile
                        ? 10.sp
                        : isTablet
                            ? 6.sp
                            : 3.sp,
                  ),

                  // Project Description
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: isMobile
                          ? 14.5.sp
                          : isTablet
                              ? 6.5.sp
                              : 4.5.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textColor1,
                    ),
                    maxLines: isMobile
                        ? 3
                        : isTablet
                            ? 3
                            : 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(
                      height: isMobile
                          ? 15.sp
                          : isTablet
                              ? 8.sp
                              : 6.sp),

                  // Technology Tags
                  Wrap(
                    spacing: isMobile
                        ? 10.sp
                        : isTablet
                            ? 4.5.sp
                            : 2.5.sp,
                    runSpacing: 5.sp,
                    children: widget.technologies
                        .map((tech) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile
                                    ? 10.sp
                                    : isTablet
                                        ? 5.sp
                                        : 3.sp,
                                vertical: isMobile
                                    ? 2.sp
                                    : isTablet
                                        ? 1.5.sp
                                        : 1.sp,
                              ),
                              decoration: BoxDecoration(
                                color: MyColors.tabBg,
                                borderRadius: BorderRadius.circular(
                                  isMobile
                                      ? 10.sp
                                      : isTablet
                                          ? 6.sp
                                          : 4.sp,
                                ),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: isMobile
                                      ? 12.sp
                                      : isTablet
                                          ? 5.5.sp
                                          : 3.5.sp,
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
