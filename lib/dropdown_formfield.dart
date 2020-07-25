library dropdown_formfield;

//import 'dart:ffi';

import 'package:flutter/material.dart';

class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;
  final bool filled;
  final bool fieldExpand;
  final bool listExpand;
  final double fieldRadius;
  final double hintFontSize;
  final double titleFontSize;
  final double textFontSize;
  final EdgeInsets contentPadding;
  final Color backgroundColor;
  final Color hintTextColor;
  final Color titleTextColor;
  final Color textColor;
  final Color iconColor;
  final double iconButtonSize;
  final Color listBackgroundColor;

  DropDownFormField(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      bool autovalidate = false,
      this.titleText = 'Title',
      this.hintText = 'Select one option',
      this.required = false,
      this.errorText = 'Please select one option',
      this.value,
      this.dataSource,
      this.textField,
      this.valueField,
      this.onChanged,
      this.filled = true,
      this.fieldExpand = true,
      this.listExpand = true,
      this.fieldRadius = 0.0,
      this.hintFontSize = 12.0,
      this.titleFontSize = 16.0,
      this.textFontSize = 16.0,
      this.iconButtonSize = 32.0,
      this.backgroundColor = Colors.white,
      this.hintTextColor = Colors.black,
      this.titleTextColor = Colors.grey,
      this.textColor = Colors.black,
      this.iconColor = Colors.black,
      this.listBackgroundColor = Colors.white,
      this.contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0)})
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidate: autovalidate,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return Container(
              decoration: (fieldRadius == 0.0)
                  ? BoxDecoration(color: backgroundColor)
                  : BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(fieldRadius),
                    ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputDecorator(
                    expands: fieldExpand,
                    decoration: InputDecoration(
                      contentPadding: contentPadding,
                      labelText: titleText,
                      filled: filled,
                      labelStyle: TextStyle(
                        color: titleTextColor,
                        fontSize: titleFontSize,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        dropdownColor: listBackgroundColor,
                        iconEnabledColor: iconColor,
                        iconSize: iconButtonSize,
                        isExpanded: listExpand,
                        hint: Text(
                          hintText,
                          style: TextStyle(
                            color: hintTextColor,
                            fontSize: hintFontSize,
                          ),
                        ),
                        value: value == '' ? null : value,
                        onChanged: (dynamic newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        items: dataSource.map((item) {
                          return DropdownMenuItem<dynamic>(
                            value: item[valueField],
                            child: Text(
                              item[textField],
                              style: TextStyle(
                                color: textColor,
                                fontSize: textFontSize,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: state.hasError ? 5.0 : 0.0),
                  Text(
                    state.hasError ? state.errorText : '',
                    style: TextStyle(
                        color: Colors.redAccent.shade700,
                        fontSize: state.hasError ? 12.0 : 0.0),
                  ),
                ],
              ),
            );
          },
        );
}
