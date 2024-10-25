import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/core/mytextstyles.dart';
import 'package:noviindus_test/data/models/patientlistmodel.dart';
import 'package:noviindus_test/presentation/homepage/widgets/mysearchbar.dart';
import 'package:noviindus_test/presentation/homepage/widgets/patienttile.dart';
import 'package:noviindus_test/providers/functionsprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final functionsProvider =
        Provider.of<FunctionsProvider>(context, listen: false);
    functionsProvider.getPatientList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: MySearchbar(),
                    ),
                    Constants.width15,
                    Expanded(
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
                        child: const Text('Search'),
                      ),
                    ),
                  ],
                ),
                Constants.height20,
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Sort by:',
                        style: MyTextStyles.sort,
                      ),
                    ),
                    Constants.width15,
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: AppColors.black,
                            width: 0.5,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Date'),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Constants.height10,
          const Divider(),
          Consumer<FunctionsProvider>(
            builder: (context, value, child) => value.patientListModel != null
                ? Expanded(
                    flex: 7,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Constants.height20,
                      itemCount: value.patientListModel!.patient.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PatientTile(
                          patientListModel: value.patientListModel!,
                          index: index,
                        );
                      },
                    ),
                  )
                : Expanded(
                    flex: 7,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Constants.height20,
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
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: SizedBox(
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
                child: const Text('Register'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
