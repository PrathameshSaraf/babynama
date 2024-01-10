import 'package:flutter/material.dart';

import '../themes/app_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText('Profile View',context).bodyXLarge,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: AppText('Profile Page',context).bodyMedium,
      ),
    );
  }
}
