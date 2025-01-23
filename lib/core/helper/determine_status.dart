import '../../lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

String getLocalizedStatus(int apiStatus) {
  switch (apiStatus) {
    case 0:
      return LocaleKeys.waitingOrder.tr();
    case 1:
      return LocaleKeys.onDelivered.tr();
    case 2:
      return LocaleKeys.delivered.tr();
    default:
      return LocaleKeys.unknownStatus.tr(); // Fallback for unknown statuses
  }
}
