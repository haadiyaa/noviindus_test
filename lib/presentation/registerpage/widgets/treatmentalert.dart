import 'package:flutter/material.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/presentation/authentication/widgets/customtextfield.dart';

class TreatmentAlert extends StatefulWidget {
  const TreatmentAlert({super.key, required this.treatNameCtrl});
  final TextEditingController treatNameCtrl;

  @override
  State<TreatmentAlert> createState() => _TreatmentAlertState();
}

class _TreatmentAlertState extends State<TreatmentAlert> {
  int male = 0;
  int female = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Choose Treatment'),
          Constants.height5,
          CustomTextField(
            hintText: 'Choose prefered treatment',
            controller: widget.treatNameCtrl,
            validator: (p0) {},
            obscureText: false,
          ),
          Constants.height20,
          const Text('Add Patients'),
          Constants.height5,
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.black,
                          width: 0.5,
                        ),
                      ),
                      child: const Text(
                        'Male',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (male != 0) {
                            setState(() {
                              male -= 1;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: AppColors.green,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 13,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.black,
                            width: 0.5,
                          ),
                        ),
                        child: Text('$male'),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            male += 1;
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Constants.height5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.black,
                          width: 0.5,
                        ),
                      ),
                      child: const Text(
                        'Female',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (female != 0) {
                            setState(() {
                              female -= 1;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: AppColors.green,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 13,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.black,
                            width: 0.5,
                          ),
                        ),
                        child: Text('$female'),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            female += 1;
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Constants.height20,
          SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text('Save'),
            ),
          )
        ],
      ),
    );
  }
}
