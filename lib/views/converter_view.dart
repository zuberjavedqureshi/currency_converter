import 'package:currency_converter_app/constants.dart';
import 'package:currency_converter_app/controllers/controller.dart';
import 'package:currency_converter_app/views/components/dropdown.dart';
import 'package:currency_converter_app/views/components/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConverterView extends StatelessWidget {
  const ConverterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amount = TextEditingController();

    return GetBuilder<CurrencyController>(
        init: CurrencyController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  Text(
                    "Currency Converter",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: kSecondaryColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  DropDownWidget(
                    text: 'From',
                    dropdownItems: controller.converionRates.keys,
                    selectedValue: controller.selectedCurrencyFrom,
                    onChanged: (String? val) =>
                        controller.setSelectedCurrencyFrom(val!),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  DropDownWidget(
                    text: 'To',
                    dropdownItems: controller.converionRates.keys,
                    selectedValue: controller.selectedCurrencyTo,
                    onChanged: (String? val) =>
                        controller.setSelectedCurrencyTo(val!),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.selectedCurrencyTo.isEmpty
                          ? 'USD'
                          : controller.selectedCurrencyFrom,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  AmonutTextField(
                    textEditingController: amount,
                    hintTextString: 'Amount',
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  InkWell(
                    onTap: () {
                      controller.convert(
                          double.parse(amount.text),
                          controller.selectedCurrencyFrom,
                          controller.selectedCurrencyTo);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: kDefaultPadding * 2.3,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Convert",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Result",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        controller.selectedCurrencyFrom.isEmpty
                            ? 'INR'
                            : controller.selectedCurrencyTo,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // AmonutTextField(
                  //   textEditingController: conAmount,
                  //   hintTextString: 'Converted Amount',
                  // ),
                  Text('${controller.convertedAmount}'
                      ' ${controller.selectedCurrencyTo}'),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
