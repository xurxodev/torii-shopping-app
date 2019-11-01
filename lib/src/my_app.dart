import 'package:flutter/material.dart';
import 'package:toriishopping/src/notifications/notifications_handler.dart';

import 'common/di/depdendencies_provider.dart';
import 'common/presentation/blocs/BlocProvider.dart';
import 'common/torii_colors.dart';
import 'home/screens/home_screen.dart';
import 'search/presentation/blocs/search_products_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      title: 'Torii Shopping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: ToriiColors.transparent,
          accentColor: Colors.blueAccent,
          primaryIconTheme: IconThemeData(color: Colors.blue)),
      initialRoute: '/',
      home: NotificationsHandler(child: HomeScreen()),
    );

    //SearchProductsBloc is initialized here because MyApp
    //of my widgets tree is the unique parent for for SearchDelegate
    return BlocProvider<SearchProductsBloc>(
      bloc: DependenciesProvider.provideSearchProductsBloc(),
      child: materialApp,
    );
  }
}
