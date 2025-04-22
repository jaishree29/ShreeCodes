import 'package:flutter/material.dart';
import 'package:jaishree/utils/responsive_builder.dart';
import 'package:jaishree/views/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder.isMobile(context)
          ? buildMobileDrawer(context)
          : null,
      body: Column(
        children: [
          Navbar(scaffoldKey: _scaffoldKey),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Center(
                child: Text(
                  'Main Content Area',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
