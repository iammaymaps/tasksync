import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LongProjects extends ConsumerStatefulWidget {
  const LongProjects({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LongProjectsState();
}

class _LongProjectsState extends ConsumerState<LongProjects> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300,
          height: 200,
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
