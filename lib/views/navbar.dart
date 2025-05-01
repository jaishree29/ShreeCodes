import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaishree/utils/colors.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/widgets/elevated_button.dart';

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
          : EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LOGO
          Row(
            children: [
              Container(
                padding: isMobile ? EdgeInsets.all(8.sp) : EdgeInsets.all(3.sp),
                decoration: BoxDecoration(
                  gradient: MyColors.linerGradient,
                  borderRadius: isMobile
                      ? BorderRadius.circular(6.sp)
                      : isTablet
                          ? BorderRadius.circular(7.r)
                          : BorderRadius.circular(11.r),
                ),
                child: Text(
                  'SC',
                  style: GoogleFonts.interTight(
                    fontSize: isMobile
                        ? 12.sp
                        : isTablet
                            ? 8.sp
                            : 6.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              if (!ResponsiveBuilder.isMobile(context)) ...[
                SizedBox(width: 4.w),
                Text(
                  'ShreeCodes',
                  style: GoogleFonts.interTight(
                    fontSize:
                        isTablet ? 10.sp : 7.sp,
                    // foreground: Paint()
                    //   ..shader = MyColors.linerGradient.createShader(
                    //     Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                    //   ),
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
                SizedBox(width: 5.w),
                MyElevatedButton(
                  padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 1.sp),
                  borderRadius: 2.sp,
                  text: 'Let\'s Talk',
                  onPressed: () {},
                  fontSize: 4.sp,
                  textPadding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 1.sp),
                )
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
        style: GoogleFonts.interTight(
          fontSize: isTablet ? 6.sp : 5.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
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
