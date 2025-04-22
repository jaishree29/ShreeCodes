import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBuilder.isMobile(context);
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return Container(
      padding: isMobile
          ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h)
          : EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LOGO
          Row(
            children: [
              Container(
                padding: isMobile ? EdgeInsets.all(8.sp) : EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: isMobile
                      ? BorderRadius.circular(8.sp)
                      : isTablet
                          ? BorderRadius.circular(12.r)
                          : BorderRadius.circular(15.r),
                ),
                child: Text(
                  'SC',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile
                        ? 12.sp
                        : isTablet
                            ? 8.sp
                            : 6.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              if (!ResponsiveBuilder.isMobile(context)) ...[
                SizedBox(width: 8.w),
                Text(
                  'ShreeCodes',
                  style: GoogleFonts.poppins(
                    fontSize:
                        ResponsiveBuilder.isTablet(context) ? 10.sp : 8.sp,
                    fontWeight: FontWeight.w600,
                    color: MyColors.primaryColor,
                  ),
                ),
              ],
            ],
          ),

          /// NAV LINKS (Only for tablet/desktop)
          if (!ResponsiveBuilder.isMobile(context))
            Row(
              children: [
                _NavItem(title: 'Home'),
                _NavItem(title: 'About'),
                _NavItem(title: 'Projects'),
                _NavItem(title: 'Contact'),
              ],
            )
          else
            IconButton(
              icon: Icon(Icons.menu, color: MyColors.primaryColor, size: 24.sp),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;

  const _NavItem({required this.title});

  @override
  Widget build(BuildContext context) {
    bool isTablet = ResponsiveBuilder.isTablet(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: isTablet ? 7.sp : 6.sp,
          fontWeight: FontWeight.w500,
          color: MyColors.textColor,
        ),
      ),
    );
  }
}

Widget _buildDrawerItem(String title, IconData icon) {
  return ListTile(
    leading: Icon(icon, color: MyColors.primaryColor),
    title: Text(
      title,
      style: TextStyle(color: MyColors.textColor),
    ),
    onTap: () {},
  );
}

Widget buildMobileDrawer(BuildContext context) {
  return Drawer(
    // backgroundColor: Colors.grey[50],
    child: ListView(
      padding: EdgeInsets.all(8.sp),
      children: [
        Column(
          children: [
            _buildDrawerItem('Home', Icons.home),
            _buildDrawerItem('About', Icons.info),
            _buildDrawerItem('Projects', Icons.work),
            _buildDrawerItem('Contact', Icons.contact_mail),
          ],
        ),
      ],
    ),
  );
}
