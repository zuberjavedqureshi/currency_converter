import 'package:currency_converter_app/constants.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.text,
    required this.dropdownItems,
    this.onChanged,
    this.selectedValue,
  });
  final String text;
  final Iterable<String> dropdownItems;
  final String? selectedValue;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: kGrayColor), color: kGrayColor),
          child: DropdownButton<String>(
              value: selectedValue,
              padding: const EdgeInsets.all(4),
              underline: const SizedBox(),
              isExpanded: true,
              hint: const Text('Select country'),
              icon: const Icon(
                Icons.arrow_drop_down_rounded,
                size: 40,
              ),
              items: dropdownItems
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (String? val) => onChanged!(val)),
        ),
      ],
    );
  }
}
