
import 'package:flutter/material.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/core/mytextstyles.dart';

class PatientListLoader extends StatelessWidget {
  const PatientListLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 7,
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              Constants.height20,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: AppColors.lightgrey,
                  borderRadius: BorderRadius.circular(20)),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('_.'),
                  Constants.width10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '___',
                        style: MyTextStyles.nameText,
                      ),
                      Text(
                        '______',
                        style: MyTextStyles.subNameText,
                      ),
                      Constants.height10,
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: AppColors.red,
                            size: 14,
                          ),
                          Constants.width5,
                          Text(
                            '__',
                            style: MyTextStyles.dateText,
                          ),
                          Constants.width10,
                          Icon(
                            Icons.group_outlined,
                            color: AppColors.red,
                            size: 14,
                          ),
                          Constants.width5,
                          Text(
                            '___',
                            style: MyTextStyles.dateText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
  }
}
