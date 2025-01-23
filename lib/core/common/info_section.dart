import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../constant/colory.dart';
import '../theme/text_theme.dart';
import '../helper/make_phone_call.dart';
import '../../feature/home/data/model/order_model.dart';

class InfoSection extends StatelessWidget {
  final TextStyle? style;
  final OrderModel order;

  const InfoSection({super.key, this.style, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          order.clientName,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: style ?? AppText.medium18(),
        ),
        SizedBox(height: 2.w),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: EdgeInsets.only(bottom: 2.5.w),
            child: Row(
              children: [
                Icon(Iconsax.calendar_1,
                    color: StatusColors.getColor(order.status, 2)),
                SizedBox(width: 2.w),
                Flexible(
                  child: Text(
                    order.createdDate,
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.regular15(),
                  ),
                ),
              ],
            ),
          ),
          subtitle: Row(
            children: [
              Icon(Iconsax.mobile,
                  color: StatusColors.getColor(order.status, 2)),
              SizedBox(width: 2.w),
              Text(
                order.clientPhone,
                maxLines: 1,
                textDirection: TextDirection.ltr,
                overflow: TextOverflow.ellipsis,
                style: AppText.regular15(),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () async {
              await makePhoneCall(order.clientPhone);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              foregroundColor: StatusColors.getColor(order.status, 2),
              backgroundColor: StatusColors.getColor(order.status, 1),
            ),
            icon: const Icon(Iconsax.call),
          ),
        ),
      ],
    );
  }
}

//   }
// }
