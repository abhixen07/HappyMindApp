// import 'package:flutter/material.dart';
// import 'package:gradient_borders/gradient_borders.dart';
// import '../style/style.dart';
//
// class CustomDropdown extends StatefulWidget {
//   final String? label;
//   final String? hint;
//   final List<String> options;
//   final ValueChanged<String?> onChanged;
//   final double? height;
//   final double? width;
//   final Color? fontColor;
//   final double? fontSize;
//   final FontWeight? fontWeight;
//   final Color? labelColor;
//   final FontWeight? labelFontWeight;
//   final TextStyle? labelStyle;
//   final double borderRadius;
//   final bool addShadow;
//   final Color? shadowColor;
//   final double? shadowBlurRadius;
//   final double? shadowOffsetX;
//   final double? shadowOffsetY;
//   final Gradient? borderGradient;
//   final Gradient? backgroundGradient;
//   final Color? iconColor;
//   final double? iconSize;
//   final double? heightlabelbelow;
//   final double? heightlabelbelow1;
//   final Color? hintColor;
//
//   // Added parameters
//   final TextEditingController? controller;
//   final FocusNode? currentFocusNode;
//   final FocusNode? nextFocusNode;
//
//   final EdgeInsetsGeometry? contentPadding;
//   final bool isCenterHint;
//   final bool isCenterIcon;
//
//   const CustomDropdown({
//     super.key,
//     this.heightlabelbelow,
//     this.heightlabelbelow1,
//     this.label,
//     required this.options,
//     required this.onChanged,
//     this.hint = 'Select',
//     this.height = 50,
//     this.width,
//     this.fontColor,
//     this.fontSize = 14.5,
//     this.fontWeight,
//     this.labelColor,
//     this.labelFontWeight,
//     this.labelStyle,
//     this.borderRadius = 5.0,
//     this.addShadow = false,
//     this.shadowColor,
//     this.shadowBlurRadius,
//     this.shadowOffsetX,
//     this.shadowOffsetY,
//     this.borderGradient,
//     this.backgroundGradient,
//     this.iconColor,
//     this.hintColor,
//     this.controller,
//     this.currentFocusNode,
//     this.nextFocusNode,
//     this.iconSize,
//     this.contentPadding,
//     this.isCenterHint = false,
//     this.isCenterIcon = false,
//   });
//
//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }
//
// class _CustomDropdownState extends State<CustomDropdown> {
//   String? selectedValue;
//
//   @override
//   void initState() {
//     super.initState();
//     // Ensure selectedValue is valid
//     selectedValue = (widget.controller?.text.isNotEmpty == true &&
//         widget.options.contains(widget.controller!.text))
//         ? widget.controller!.text
//         : widget.hint;
//   }
//
//   void _onValueChange(String? value) {
//     if (value != null && widget.options.contains(value)) {
//       setState(() {
//         selectedValue = value;
//       });
//       if (widget.controller != null) {
//         widget.controller!.text = value;
//       }
//       widget.onChanged(value);
//
//       if (widget.nextFocusNode != null) {
//         FocusScope.of(context).requestFocus(widget.nextFocusNode);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Gradient effectiveBorderGradient =
//         widget.borderGradient ?? linearGradientTextField;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.label != null)
//           Text(
//             widget.label!,
//             style: widget.labelStyle ??
//                 TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 14,
//                   fontWeight: widget.labelFontWeight ?? FontWeight.w500,
//                   color: widget.labelColor ?? whiteColor,
//                 ),
//           ),
//         if (widget.label != null) SizedBox(height: widget.heightlabelbelow ?? 8),
//         if (widget.heightlabelbelow1 != null)
//           SizedBox(height: widget.heightlabelbelow1),
//         SizedBox(
//           height: widget.height,
//           width: widget.width,
//           child: DropdownButtonFormField<String>(
//             focusNode: widget.currentFocusNode,
//             decoration: InputDecoration(
//               contentPadding: widget.contentPadding ??
//                   const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               enabledBorder: GradientOutlineInputBorder(
//                 gradient: effectiveBorderGradient,
//                 borderRadius: BorderRadius.circular(widget.borderRadius),
//                 width: 1,
//               ),
//               focusedBorder: GradientOutlineInputBorder(
//                 gradient: effectiveBorderGradient,
//                 borderRadius: BorderRadius.circular(widget.borderRadius),
//                 width: 1,
//               ),
//               filled: true,
//               fillColor: Colors.transparent,
//               hintText: widget.hint,
//               hintStyle: TextStyle(
//                 fontFamily: 'Inter',
//                 fontSize: widget.fontSize,
//                 color: widget.hintColor ?? greyColor,
//                 fontWeight: widget.fontWeight ?? FontWeight.normal,
//               ),
//             ),
//             dropdownColor: textFieldColor, // Dropdown background color
//             value: selectedValue,
//             style: TextStyle(
//               fontFamily: 'Inter',
//               fontSize: widget.fontSize,
//               color: widget.fontColor ?? whiteColor,
//               fontWeight: widget.fontWeight ?? FontWeight.normal,
//             ),
//             icon: Icon(
//               Icons.keyboard_arrow_down_rounded,
//               color: widget.iconColor ?? greyColor,
//               size: widget.iconSize ?? 14,
//             ),
//             isExpanded: true,
//             items: widget.options
//                 .map(
//                   (option) => DropdownMenuItem<String>(
//                 value: option,
//                 child: Text(
//                   option,
//                   style: TextStyle(
//                     fontSize: widget.fontSize,
//                     color: widget.fontColor ?? whiteColor,
//                     fontWeight: widget.fontWeight ?? FontWeight.normal,
//                   ),
//                 ),
//               ),
//             )
//                 .toList(),
//             onChanged: _onValueChange,
//           ),
//         ),
//       ],
//     );
//   }
// }
