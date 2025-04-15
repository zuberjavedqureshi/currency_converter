import 'package:currency_converter_app/constants.dart';
import 'package:currency_converter_app/views/converter_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        Text(
          "Currency Converter",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: kSecondaryColor, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Text(
          "Welcome!",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        InkWell(
          onTap: () => Get.to(() => const ConverterView()),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: kPrimaryColor),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        const Text(
          "Let's Get Started!",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
