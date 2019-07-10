import 'package:flutter_boilerplate/src/utils/network.dart';

abstract class Service {
  final NetworkUtil networkUtil = NetworkUtil.internal();
  final String resourcePath;

  Service(this.resourcePath);
}
