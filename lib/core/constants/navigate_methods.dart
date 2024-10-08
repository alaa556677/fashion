import '../../main.dart';

navigateToNamed({required String route, arguments}){
  navigatorKey.currentState?.pushNamed(route, arguments: arguments);
}

navigateToAndRemoveNamed({required String route, arguments}){
  navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
}

navigateToAndReplaceNamed({required String route, arguments}){
  navigatorKey.currentState?.pushReplacementNamed(route, arguments: arguments);
}

navigateToPop(){
  navigatorKey.currentState?.pop(true);
}