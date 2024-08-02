import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/packages.dart';

class FormController extends GetxController {
  Rx<RangeValues> _tripDuration = RangeValues(1, 4).obs;
  Rx<RangeValues> _costRange = RangeValues(0, 1000).obs;
}

class FormDialog extends StatelessWidget {
  FormDialog({super.key});
  final FormController controller = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: SizedBox(
          height: context.height * 0.5,
          width: context.width * 0.75,
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Trip Type DropDownList
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CupertinoButton(
                        onPressed: () {
                          Dropdownlist("Trip Type", types, context);
                        },
                        child: const Text("TripType")),
                    // Destination discription DropDownList
                    CupertinoButton(
                        onPressed: () {
                          Dropdownlist("env", categories, context);
                        },
                        child: const Text("Environment")),
                  ],
                ),
                // Cost Range Slider
                const Text('Cost Range:'),
                RangeSlider(
                  values: controller._costRange.value,
                  min: 0,
                  max: 1000,
                  divisions: 10,
                  labels: controller._costRange.value != null
                      ? RangeLabels(
                          '${controller._costRange.value.start.round()}',
                          '${controller._costRange.value.end.round()}')
                      : null,
                  onChanged: (range) => controller._costRange.value = range,
                ),
                // Trip Duration Dropdown
                const Text('Trip Duration :'),
                RangeSlider(
                  values: controller._tripDuration.value,
                  min: 1,
                  max: 4,
                  divisions: 3,
                  labels: controller._tripDuration != null
                      ? RangeLabels(
                          controller._tripDuration.value.start.round() == 1
                              ? '${controller._tripDuration.value.start.round()} day'
                              : '${controller._tripDuration.value.start.round()} days',
                          '${controller._tripDuration.value.end.round() == 4 ? "Up to 3 days" : controller._tripDuration.value.end.round()}')
                      : null,
                  onChanged: (range) => controller._tripDuration.value = range,
                ),
                // Submit Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 100),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
