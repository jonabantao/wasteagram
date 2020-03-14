import 'package:intl/intl.dart';

String printDetailTitleDate(DateTime date) {
  return DateFormat('EEEE, MMM. d y').format(date);
}

String printListTileDate(DateTime date) {
  return DateFormat('EEEE, MMM. d').format(date);
}
