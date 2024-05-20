import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TaskTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  void Function(bool?)? onChanged;
  void Function(BuildContext)? deleteFunction;

  TaskTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h, bottom: 15.h),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12.r)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              //checkbox
              Checkbox(
                  activeColor: Colors.black,
                  value: taskCompleted,
                  onChanged: onChanged),

              //taskname
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
