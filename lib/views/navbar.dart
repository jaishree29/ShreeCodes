import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/utils/url_launcher.dart';
import 'package:jaishree/utils/urls.dart';
import 'package:jaishree/widgets/elevated_button.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
    required this.scaffoldKey,
    required this.scrollToAbout,
    required this.scrollToSkills,
    required this.scrollToProjects,
    required this.scrollToContact,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback scrollToAbout;
  final VoidCallback scrollToSkills;
  final VoidCallback scrollToProjects;
  final VoidCallback scrollToContact;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return Container(
      padding: isMobile
          ? EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h)
          : isTablet
              ? EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h)
              : EdgeInsets.symmetric(horizontal: 8.w, vertical: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ShreeCodes',
            style: GoogleFonts.inter(
              fontSize: isMobile
                  ? 18.sp
                  : isTablet
                      ? 8.sp
                      : 6.sp,
              fontWeight: FontWeight.w600,
              color: MyColors.black,
            ),
          ),
          if (!isMobile)
            Row(
              children: [
                _NavItem(
                  title: 'About',
                  onTap: scrollToAbout,
                ),
                _NavItem(
                  title: 'Skills',
                  onTap: scrollToSkills,
                ),
                _NavItem(
                  title: 'Projects',
                  onTap: scrollToProjects,
                ),
                _NavItem(
                  title: 'Contact',
                  onTap: scrollToContact,
                ),
              ],
            ),
          // else
          //   IconButton(
          //     icon: Icon(Icons.menu, color: MyColors.primaryColor, size: 24.sp),
          //     onPressed: () {
          //       scaffoldKey.currentState?.openDrawer();
          //     },
          //   ),
          Row(
            children: [
              MyElevatedButton(
                backgroundColor: Colors.transparent,
                borderSide: BorderSide(
                  color: MyColors.textColor2,
                  width: isMobile
                      ? 1.5.sp
                      : isTablet
                          ? 0.5.sp
                          : 0.3.sp,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 3.sp,
                  vertical: 2.5.sp,
                ),
                borderRadius: isMobile
                    ? 40.sp
                    : isTablet
                        ? 30.sp
                        : 20.sp,
                text: 'Resume',
                textColor: MyColors.black,
                onPressed: () =>
                    UrlLauncherHelper.launchInNewTab(MyUrls.resume),
                fontSize: isMobile ? 12.5.sp : isTablet ? 5.5.sp : 4.sp,
                textPadding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? 10.sp
                      : isTablet
                          ? 5.sp
                          : 3.sp,
                  vertical: isMobile
                      ? 10.sp
                      : isTablet
                          ? 5.sp
                          : 2.5.sp,
                ),
              ),
              // isMobile ? SizedBox(width: 3.sp) : SizedBox.shrink(),
              // if (isMobile)
              //   IconButton(
              //     icon: Icon(Icons.menu,
              //         color: MyColors.primaryColor, size: 24.sp),
              //     onPressed: () {
              //       scaffoldKey.currentState?.openDrawer();
              //     },
              //   ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;

  const _NavItem({required this.title, this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.5.w),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: MouseRegion(
          onEnter: (event) => setState(() => isHovered = true),
          onExit: (event) => setState(() => isHovered = false),
          child: Text(
            widget.title,
            style: GoogleFonts.inter(
              fontSize: isTablet ? 6.sp : 4.3.sp,
              fontWeight: FontWeight.w400,
              color: isHovered ? MyColors.black : MyColors.textColor1,
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildMobileDrawer(
  BuildContext context, {
  required VoidCallback scrollToAbout,
  required VoidCallback scrollToSkills,
  required VoidCallback scrollToProjects,
  required VoidCallback scrollToContact,
}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.all(8.sp),
      children: [
        Column(
          children: [
            _buildDrawerItem('About', Icons.info, scrollToAbout),
            _buildDrawerItem('Skills', Icons.code, scrollToSkills),
            _buildDrawerItem('Projects', Icons.work, scrollToProjects),
            _buildDrawerItem('Contact', Icons.contact_mail, scrollToContact),
          ],
        ),
      ],
    ),
  );
}

Widget _buildDrawerItem(String title, IconData icon, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon, color: MyColors.primaryColor),
    title: Text(
      title,
      style: TextStyle(color: MyColors.textColor),
    ),
    onTap: onTap,
  );
}
