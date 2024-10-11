import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleware extends GetObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint("test: didPop : route: $route, previousRoute: $previousRoute");
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    debugPrint("test: didReplace : newRoute: $newRoute, oldRoute: $oldRoute");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);

    debugPrint("test: didRemove : route: $route, previousRoute: $previousRoute");
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    debugPrint("test: didPush : route: $route, previousRoute: $previousRoute");
  }
}
