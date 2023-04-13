import 'package:flutter/material.dart';

class profileDetail extends StatefulWidget {
  const profileDetail({super.key});

  @override
  State<profileDetail> createState() => _profileDetailState();
}

class _profileDetailState extends State<profileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "profile Detail screen",
        ),
      ),
    );
  }
}
