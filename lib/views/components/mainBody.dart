import 'package:currency_converter_app/constants.dart';
import 'package:currency_converter_app/views/converter_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
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
          "Let's start!",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}


// DropdownButton<String>(
//               value: selectedValue,
//               padding: const EdgeInsets.all(4),
//               underline: const SizedBox(),
//               isExpanded: true,
//               hint: const Text('Select country'),
//               icon: const Icon(
//                 Icons.arrow_drop_down_rounded,
//                 size: 40,
//               ),
//               items: dropdownItems
//                   .map(
//                     (e) => DropdownMenuItem<String>(
//                       value: e,
//                       child: Text(e),
//                     ),
//                   )
//                   .toList(),
//               onChanged: (String? val) => onChanged!(val)),