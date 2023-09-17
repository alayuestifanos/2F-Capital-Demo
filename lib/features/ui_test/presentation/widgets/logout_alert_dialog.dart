import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/helper/shared_preferences_helper.dart';
import '../../../../injection_container.dart';
import '../../../log_in/presentation/pages/pages.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout Action'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Are you sure?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Yes'),
          onPressed: () async {
            await SharedPreferencesHelper.removeUserFromPrefs(
              SharedPreferencesHelper.userKey,
              sl<SharedPreferences>(),
            );
            if (context.mounted) {
              // Navigator.of(context).pop();
              Navigator.pushNamed(context, Login.routeName);
            }
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
