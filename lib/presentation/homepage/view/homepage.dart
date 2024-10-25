import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/core/mytextstyles.dart';
import 'package:noviindus_test/data/models/patientlistmodel.dart';
import 'package:noviindus_test/presentation/homepage/widgets/mysearchbar.dart';
import 'package:noviindus_test/presentation/homepage/widgets/patientlistloader.dart';
import 'package:noviindus_test/presentation/homepage/widgets/patienttile.dart';
import 'package:noviindus_test/presentation/registerpage/view/registerpage.dart';
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

  Future<void> onRefresh() async {
    final functionsProvider =
        Provider.of<FunctionsProvider>(context, listen: false);
    await functionsProvider.getPatientList();
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
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Column(
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
                        separatorBuilder: (context, index) =>
                            Constants.height20,
                        itemCount: value.patientListModel!.patient.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PatientTile(
                            patientListModel: value.patientListModel!,
                            index: index,
                          );
                        },
                      ),
                    )
                  : const PatientListLoader(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterPage()));
                  },
                  child: const Text('Register'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
