import 'package:flutter/material.dart';
import 'package:flutter_provider_astro/ui/router.dart';

import 'core/constants/app_constants.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: RoutePaths.Home,
      onGenerateRoute: Router.generateRoute,
    );
  }
}

//Si necesitáramos tener un stream de algún elemento que necesitáramos para toda
// la aplicación:
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.controller(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}*/

/*El userController es un StreamController<User> que expone a toda la aplicación
* este objeto,(en la clase AuthenticationService ->
* StreamController<User> userController = StreamController<User>(); )
 * simplemente lo recuperaríamos con:
 *
 * Provider.of<User>(context) desde cualquier lado.
* */
