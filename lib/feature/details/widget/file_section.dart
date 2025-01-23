import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constant/colory.dart';
import '../../../core/service/file_service.dart';
import '../../../core/theme/text_theme.dart';
import '../../home/data/model/order_model.dart';

class FileSection extends StatelessWidget {
  final OrderModel order;
  const FileSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Iconsax.document_cloud,
          size: 28.sp,
          color: StatusColors.getColor(order.status, 2),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "${order.clientName}-${order.id}",
              maxLines: 2,
              style: AppText.medium16(),
              overflow: TextOverflow.ellipsis,
            ),
            minVerticalPadding: 2.w,
            trailing: IconButton(
              onPressed: () async {
                FileService service = FileService();
                await service.downloadFile(
                  context,
                  order.invoice,
                  order.invoice,
                  "${order.clientName}-${order.id}",
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                foregroundColor: StatusColors.getColor(order.status, 2),
                backgroundColor: StatusColors.getColor(order.status, 1),
              ),
              icon: Icon(
                Iconsax.document_download,
                size: 20.sp,
                color: StatusColors.getColor(order.status, 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//         ),
//       ],
//     );
//   }
// }
