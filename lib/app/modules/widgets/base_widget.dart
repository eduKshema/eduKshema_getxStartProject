import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/data/interface_controller/api_interface_controller.dart';
import 'package:getx_start_project/app/modules/widgets/custom_retry_widget.dart';

export 'package:getx_start_project/app/common/util/exports.dart';

class BaseWidget extends GetView<ApiInterfaceController> {
  ///A widget with only custom retry button widget.
  final Widget child;

  const BaseWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Positioned.fill(
            child: child,
          ),
          Visibility(
            visible: controller.retry != null && controller.error != null,
            child: Positioned.fill(
              child: Scaffold(
                body: CustomRetryWidget(
                  onPressed: () {
                    controller.error = null;
                    controller.retry?.call();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
