import 'package:flutter/material.dart';

import 'widgets.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
    // Add this feature flag
    this.enable_free_swag = false,
  });

  final bool loggedIn;
  final bool enable_free_swag;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: StyledButton(
              onPressed: () {
                !loggedIn
                    ? Navigator.of(context).pushNamed('/sign-in')
                    : signOut();
              },
              child: !loggedIn ? const Text('RSVP') : const Text('Logout')),
        ),
        Visibility(
            visible: loggedIn,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              child: StyledButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child: const Text('Profile')),
            )),
        Visibility(
            visible: enable_free_swag,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              child: StyledButton(
                  onPressed: () {
                    // this is present so we can test crashlytics
                    throw Exception('swag tool unimplemented');
                  },
                  child: const Text('Free Swag!')),
            )),
      ],
    );
  }
}
