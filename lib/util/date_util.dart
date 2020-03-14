import 'package:intl/intl.dart';

String displayDetailTitleDate(DateTime date) {
  return DateFormat('EEEE, MMM. d y').format(date);
}

String displayListTileDate(DateTime date) {
  return DateFormat('EEEE, MMM. d').format(date);
}
