import 'package:flutter/material.dart';

import '../themes/app_text.dart';

class AccountPageView extends StatelessWidget {
  const AccountPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText('Account Page', context).bodyXLarge,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: AppText('Account View',context).bodyMedium,
      ),
    );
  }
}
