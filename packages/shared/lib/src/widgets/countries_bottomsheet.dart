import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared/shared.dart';

import '../models/country/country_model.dart';
import 'editors/base_editor.dart';

class CountriesBottomSheet extends StatefulWidget {
  const CountriesBottomSheet({super.key});

  @override
  State<CountriesBottomSheet> createState() => _CountriesBottomSheetState();
}

class _CountriesBottomSheetState extends State<CountriesBottomSheet> {
  String? query;
  late List<CountryModel> countries;
  CountryModel? countryModel;
  Timer? _debounce;

  String _getFlag(String code) => 'assets/flags/${code.toLowerCase()}.svg';

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        setState(() {
          countries = kCountries;
        });
      } else {
        setState(() {
          countries =
              kCountries.where((element) {
                return element.nameEn!.toLowerCase().contains(query.toLowerCase()) ||
                    element.dialCode!.contains(query);
              }).toList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    countries = List<CountryModel>.from(countriesList.map((model) => CountryModel.fromJson(model)));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: BaseEditor(
            prefixIcon: const Icon(Icons.search),
            hintText: context.appLocalization.countrySearchHint,
            onChanged: _onSearchChanged,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: countries.length,
            separatorBuilder: (context, index) => const Divider(height: 0),
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              final country = countries[index];
              return ListTile(
                onTap: () {
                  countryModel = CountryModel.fromJson(country.toJson());
                  Navigator.pop(context, countryModel);
                },
                leading: SvgPicture.asset(_getFlag(country.code!), width: 30),
                title: Text(
                  context.isRTL ? country.nameAr! : country.nameEn!,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(country.dialCode!),
              );
            },
          ),
        ),
      ],
    );
  }
}
