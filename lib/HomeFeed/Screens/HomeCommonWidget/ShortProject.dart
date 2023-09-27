import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShortProjects extends ConsumerStatefulWidget {
  const ShortProjects({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShortProjectsState();
}

class _ShortProjectsState extends ConsumerState<ShortProjects> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 165,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFF007AFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }
}
