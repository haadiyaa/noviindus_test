import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/core/mytextstyles.dart';
import 'package:noviindus_test/presentation/authentication/widgets/customtextfield.dart';
import 'package:noviindus_test/presentation/registerpage/widgets/treatmentalert.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameCtrl = TextEditingController();

  final TextEditingController wNumberCtrl = TextEditingController();

  final TextEditingController addressCtrl = TextEditingController();

  final TextEditingController locationCtrl = TextEditingController();

  final TextEditingController branchCtrl = TextEditingController();

  final TextEditingController totalAmtCtrl = TextEditingController();

  final TextEditingController discAmtCtrl = TextEditingController();

  final TextEditingController advAmtCtrl = TextEditingController();

  final TextEditingController balAmtCtrl = TextEditingController();

  final TextEditingController treatDateCtrl = TextEditingController();

  final TextEditingController treatTimeCtrl = TextEditingController();
  final TextEditingController treatNameCtrl = TextEditingController();
  int male = 0;
  int female = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Register',
                style: MyTextStyles.headingStyle,
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: AppColors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Constants.height10,
                  const Text(
                    'Name',
                    style: MyTextStyles.inputPlaceholderStyle,
                  ),
                  Constants.height5,
                  CustomTextField(
                    hintText: 'Enter your full name',
                    controller: nameCtrl,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  Constants.height10,
                  Constants.height5,
                  const Text(
                    'WhatsApp Number',
                    style: MyTextStyles.inputPlaceholderStyle,
                  ),
                  Constants.height5,
                  CustomTextField(
                    hintText: 'Enter your WhatsApp Number',
                    controller: wNumberCtrl,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  Constants.height10,
                  Constants.height5,
                  const Text(
                    'Address',
                    style: MyTextStyles.inputPlaceholderStyle,
                  ),
                  Constants.height5,
                  CustomTextField(
                    hintText: 'Enter your Address',
                    controller: addressCtrl,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  Constants.height10,
                  Constants.height5,
                  const Text(
                    'Location',
                    style: MyTextStyles.inputPlaceholderStyle,
                  ),
                  Constants.height5,
                  CustomTextField(
                    hintText: 'Choose your Location',
                    controller: locationCtrl,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  Constants.height10,
                  Constants.height5,
                  const Text(
                    'Branch',
                    style: MyTextStyles.inputPlaceholderStyle,
                  ),
                  Constants.height5,
                  CustomTextField(
                    hintText: 'Select your branch',
                    controller: branchCtrl,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  Constants.height10,
                  Constants.height10,
                  //====treatement
                  treatNameCtrl.text.isEmpty
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, bottom: 15, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.lightgrey,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '1.  ',
                                style: MyTextStyles.nameText,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'data',
                                      style: MyTextStyles.nameText,
                                    ),
                                    Constants.height10,
                                    Row(
                                      children: [
                                        const Text(
                                          'Male',
                                          style: MyTextStyles.genderText,
                                        ),
                                        Constants.width5,
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 13,
                                            vertical: 1,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: AppColors.black,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: const Text(
                                            '2',
                                            style: MyTextStyles.genderText,
                                          ),
                                        ),
                                        Constants.width15,
                                        const Text(
                                          'Female',
                                          style: MyTextStyles.genderText,
                                        ),
                                        Constants.width5,
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 13,
                                            vertical: 1,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: AppColors.black,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: const Text(
                                            '2',
                                            style: MyTextStyles.genderText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: AppColors.red,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      color: AppColors.green,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                  Constants.height10,
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
                      onPressed: treatNameCtrl.text.isNotEmpty
                          ? null
                          : () {
                              showDialog(
                                context: context,
                                builder: (context) => TreatmentAlert(
                                  treatNameCtrl: treatNameCtrl,
                                ),
                              );
                            },
                      child: const Text('Add Treatment'),
                    ),
                  ),
                  Constants.height10,
                  Constants.height5,
                  const Text(
                    'Total Amount',
                    style: MyTextStyles.inputPlaceholderStyle,
                  ),
                  Constants.height5,
                  CustomTextField(
                    hintText: 'Total Amount',
                    controller: totalAmtCtrl,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  Constants.height10,
                  Constants.height5,
                  const Text(
                    'Discount Amount',
                    style: MyTextStyles.inputPlaceholderStyle,
                  ),
                  Constants.height5,
                  CustomTextField(
                    hintText: 'Discount Amount',
                    controller: discAmtCtrl,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                    obscureText: false,
                  ),
                  Constants.height10,
                  Constants.height5,
                  const Text(
                    'Treatment date',
                    style: MyTextStyles.inputPlaceholderStyle,
                  ),
                  Constants.height5,
                  CustomTextField(
                    keyboardType: TextInputType.none,
                    hintText: 'Treatment date',
                    controller: treatDateCtrl,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                    obscureText: false,
                    onTap: () async {
                      await pickTrtDate();
                    },
                  ),
                  Constants.height10,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25),
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
                        child: const Text('Save'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickTrtDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1990),
        lastDate: DateTime.now(),
        initialDate: DateTime.now());
    if (picked != null) {
      DateTime pickedDate = picked;
      String formatDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        treatDateCtrl.text = formatDate;
      });
    }
  }
}
