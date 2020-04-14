import 'package:meta/meta.dart';

@immutable
abstract class StatisticsEvent {}

class Fetch extends StatisticsEvent {}
