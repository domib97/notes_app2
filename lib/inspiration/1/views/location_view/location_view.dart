import 'package:flutter/material.dart';

import 'widgets/location_view_body.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  static const String pageID = 'locationView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LocationViewBody(),
    );
  }
}
