import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app_theme.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: FutureBuilder<void>(
        future: _initGoogleMobileAds(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Awesome Drawing Quiz!",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 72),
                ),
                if (snapshot.hasData)
                  ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48.0,
                        vertical: 12.0,
                      ),
                      child: Text('Let\'s get started!'),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/game');
                    },
                  )
                else if (snapshot.hasError)
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  )
                else
                  const SizedBox(
                    child: CircularProgressIndicator(),
                    width: 48,
                    height: 48,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }
}
