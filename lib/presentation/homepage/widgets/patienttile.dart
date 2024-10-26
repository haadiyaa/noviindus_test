import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/core/mytextstyles.dart';
import 'package:noviindus_test/data/models/patientlistmodel.dart';

class PatientTile extends StatelessWidget {
  const PatientTile({
    super.key,
    required this.patientListModel,
    required this.index,
  });
  final PatientListModel patientListModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.lightgrey, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${index + 1}.'),
                Constants.width10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientListModel.patient[index].name,
                      style: MyTextStyles.nameText,
                    ),
                    Text(
                      patientListModel
                          .patient[index].patientdetailsSet[0].treatmentName??'',
                      style: MyTextStyles.subNameText,
                    ),
                    Constants.height10,
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.red,
                          size: 14,
                        ),
                        Constants.width5,
                        Text(
                          DateFormat('dd/MM/yyyy').format(
                              patientListModel.patient[index].createdAt),
                          style: MyTextStyles.dateText,
                        ),
                        Constants.width10,
                        const Icon(
                          Icons.group_outlined,
                          color: AppColors.red,
                          size: 14,
                        ),
                        Constants.width5,
                        Text(
                          patientListModel.patient[index].name,
                          style: MyTextStyles.dateText,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: AppColors.grey,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('View Booking Details'),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.green,
                  size: 16,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
