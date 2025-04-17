import 'package:currency_converter_app/constants.dart';
import 'package:currency_converter_app/models/country_info_model.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shimmer/shimmer.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.text,
    required this.dropdownItems,
    this.onChanged,
    this.selectedValue,
  });
  final String text;
  final List<CurrencyInfo> dropdownItems;
  final CurrencyInfo? selectedValue;
  final Function(CurrencyInfo?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: kDefaultPadding * 3,
          decoration: BoxDecoration(
              border: Border.all(color: kGrayColor), color: kGrayColor),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<CurrencyInfo>(
              value: selectedValue,
              isExpanded: true,
              hint: Text(
                'Select Currency',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: dropdownItems
                  .map(
                    (e) => DropdownMenuItem<CurrencyInfo>(
                      value: e,
                      child: Row(
                        children: [
                          Image.network(
                            e.flagUrl,
                            width: 25,
                            height: 18,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.flag),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 25,
                                  height: 18,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${e.countryName} (${e.currencyCode})',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (CurrencyInfo? val) => onChanged!(val) ?? (val) {},
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 140,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 200,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    expands: true,
                    maxLines: null,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Search for an item...',
                      hintStyle: const TextStyle(fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value!.countryName
                          .toLowerCase()
                          .contains(searchValue.toLowerCase()) ||
                      item.value!.currencyCode
                          .toLowerCase()
                          .contains(searchValue.toLowerCase());
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            ),
          ),
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