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
          : EdgeInsets.symmetric(horizontal: 8.w, vertical: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ShreeCodes',
            style: GoogleFonts.inter(
              fontSize: isTablet ? 8.sp : 6.sp,
              fontWeight: FontWeight.w600,
              color: MyColors.black,
            ),
          ),
          if (!ResponsiveBuilder.isMobile(context))
            Row(
              children: [
                _NavItem(title: 'About'),
                _NavItem(title: 'Skills'),
                _NavItem(title: 'Projects'),
                _NavItem(title: 'Contact'),
              ],
            ),
          // else
          //   IconButton(
          //     icon: Icon(Icons.menu, color: MyColors.primaryColor, size: 24.sp),
          //     onPressed: () {
          //       scaffoldKey.currentState?.openDrawer();
          //     },
          //   ),
          MyElevatedButton(
            backgroundColor: Colors.transparent,
            borderSide: BorderSide(
              color: MyColors.textColor2,
              width: 0.3.sp,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 3.sp,
              vertical: 2.5.sp,
            ),
            borderRadius: 20.sp,
            text: 'Resume',
            textColor: MyColors.black,
            onPressed: () {},
            fontSize: 4.sp,
            textPadding: EdgeInsets.symmetric(
              horizontal: 3.sp,
              vertical: 2.5.sp,
            ),
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
      padding: EdgeInsets.symmetric(horizontal: 5.5.w),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: isTablet ? 6.sp : 4.3.sp,
          fontWeight: FontWeight.w400,
          color: MyColors.textColor1,
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
