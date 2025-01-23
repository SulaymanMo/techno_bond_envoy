import 'package:easy_localization/easy_localization.dart';

import '../../lang/locale_keys.g.dart';

String getLocalizedStatus(String apiStatus) {
  switch (apiStatus.toLowerCase()) {
    case "current":
      return LocaleKeys.currentOrder.tr();
    case "available":
      return LocaleKeys.availableOrder.tr();
    case "delivered":
      return LocaleKeys.delivered.tr();
    default:
      return LocaleKeys.unknownStatus.tr(); // Fallback for unknown statuses
  }
}
