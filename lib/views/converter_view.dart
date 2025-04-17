import 'package:currency_converter_app/constants.dart';
import 'package:currency_converter_app/controllers/controller.dart';
import 'package:currency_converter_app/models/country_info_model.dart';
import 'package:currency_converter_app/views/components/dropdown.dart';
//import 'package:currency_converter_app/views/components/shimmer_widget.dart';
import 'package:currency_converter_app/views/components/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConverterView extends StatelessWidget {
  const ConverterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amount = TextEditingController();

    return GetBuilder<CurrencyController>(
        init: CurrencyController(),
        builder: (controller) {
          if (controller.isLoading) {
            //shimmerCurrencyItem()
            return Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Text(
                    "Magical things take time...!!",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            );
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kDefaultPadding * 4,
                    ),
                    Text(
                      "Currency Converter",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: kDefaultPadding * 4,
                    ),
                    DropDownWidget(
                      text: 'From',
                      dropdownItems: controller.converionRates,
                      selectedValue: controller.selectedFrom,
                      onChanged: (CurrencyInfo? val) =>
                          controller.setSelectedCurrencyFrom(val!),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    DropDownWidget(
                      text: 'To',
                      dropdownItems: controller.converionRates,
                      selectedValue: controller.selectedTo,
                      onChanged: (CurrencyInfo? val) =>
                          controller.setSelectedCurrencyTo(val!),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.selectedTo!.currencyCode.isEmpty
                            ? 'USD'
                            : controller.selectedFrom!.currencyCode,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
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
                        controller.convert(double.parse(amount.text),
                            controller.selectedFrom!, controller.selectedTo!);
                        print(controller.selectedTo!.symbol);
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          controller.selectedFrom!.currencyCode.isEmpty
                              ? 'INR'
                              : controller.selectedTo!.currencyCode,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                    Text(
                      '${controller.convertedAmount}'
                      ' ${controller.selectedTo!.currencyCode}',
                      style: GoogleFonts.notoSans(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
