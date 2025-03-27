// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gradient_borders/gradient_borders.dart';
//
// import '../style/style.dart';
//
// class CustomTextFormField extends StatefulWidget {
//   final String? label;
//   final String hintText;
//   final bool isRequired;
//   final bool obscureText;
//   final double? width;
//   final double? height;
//   final double fontSize;
//   final double hintFontSize;
//   final Color? fontColor;
//   final Color? labelTextColor;
//   final Color? hintTextColor;
//   final FontWeight? labelFontWeight;
//   final FontWeight? hintFontWeight;
//   final FontWeight? inputFontWeight;
//   final bool isRequiredHint;
//   final String? isRequiredlabelText;
//   final int? maxlines;
//   final bool isCenter;
//   final double? heightlabelbelow;
//   final Gradient? innerGradient;
//
//   /// New optional parameter
//   final Color? isRequiredlabelColor;
//
//   ///New optional parameter
//   final double? isRequiredlabelFontSize;
//
//   /// New optional parameter
//   final Color? borderColor;
//   final double borderWidth;
//   final bool noBorder;
//   final double borderRadius;
//   final Color? focusedBorderColor;
//   final Color? enabledBorderColor;
//   final Color? enabledErrorBorderColor;
//   final Color? focusedErrorBorderColor;
//
//   final bool addShadow;
//   final Color? shadowColor;
//   final double? shadowBlurRadius;
//   final double? shadowOffsetX;
//   final double? shadowOffsetY;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final TextEditingController? controller;
//   final FormFieldValidator<String>? validator;
//
//   final FocusNode? currentFocusNode;
//   final FocusNode? nextFocusNode;
//   final bool allowOnlyText;
//   final bool allowOnlyNumbers;
//
//   final double? heightlabelbelow1;
//   final bool useCustomSize;
//
//   final Color? textfieldcolor;
//   final Gradient? textfieldgradient;
//   final ValueChanged<String>? onChanged;
//
//   const CustomTextFormField({
//     this.innerGradient,
//     this.heightlabelbelow,
//     this.heightlabelbelow1,
//     this.allowOnlyNumbers = false,
//     this.label,
//     this.maxlines,
//     this.hintText = '',
//     this.isRequired = false,
//     this.obscureText = false,
//     this.width,
//     this.height = 40,
//     this.fontSize = 15.0,
//     this.fontColor,
//     this.labelTextColor,
//     this.hintTextColor,
//     this.labelFontWeight,
//     this.hintFontWeight,
//     this.inputFontWeight,
//     this.isRequiredHint = false,
//     this.borderColor = greyColor,
//     this.borderWidth = 1,
//     this.noBorder = false,
//     this.borderRadius = 4,
//     this.isCenter = false,
//     this.focusedBorderColor = btnColor,
//     this.enabledBorderColor,
//     this.focusedErrorBorderColor,
//     this.enabledErrorBorderColor,
//     this.addShadow = false,
//     this.shadowColor,
//     this.shadowBlurRadius,
//     this.shadowOffsetX,
//     this.shadowOffsetY,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.controller,
//     this.validator,
//     this.currentFocusNode,
//     this.nextFocusNode,
//     this.isRequiredlabelText,
//     this.isRequiredlabelColor,
//     this.isRequiredlabelFontSize,
//     this.allowOnlyText = false,
//     this.useCustomSize = false,
//     super.key, this.textfieldcolor, this.textfieldgradient, this.hintFontSize = 15,
//     this.onChanged,
//   });
//
//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }
//
// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   late bool _obscureText;
//
//   @override
//   void initState() {
//     super.initState();
//     _obscureText = widget.obscureText;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.label != null)
//           Row(
//             children: [
//               Text(
//                 widget.label!,
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 14,
//                   fontWeight: widget.labelFontWeight ?? FontWeight.w500,
//                   color: widget.labelTextColor ?? whiteColor,
//                 ),
//               ),
//               if (widget.isRequired)
//                 Text(
//                   widget.isRequiredlabelText ?? " *",
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     color: widget.isRequiredlabelColor ?? redColor,
//                     fontSize: widget.isRequiredlabelFontSize ?? 16,
//                   ),
//                 ),
//             ],
//           ),
//         if (widget.label != null)
//           SizedBox(height: widget.heightlabelbelow ?? 8),
//         SizedBox(height: widget.heightlabelbelow1 ?? 5),
//         Container(
//           width: widget.useCustomSize ? widget.width ?? double.infinity : null,
//           height: widget.useCustomSize ? widget.height ?? 60 : null,
//           decoration: widget.useCustomSize
//               ? BoxDecoration(
//             border: GradientBoxBorder(gradient: linearGradientTextField),
//             borderRadius: BorderRadius.circular(12),
//             gradient: widget.textfieldgradient,
//           )
//               : null,
//           padding: widget.useCustomSize ? const EdgeInsets.all(0) : null,
//           child:  TextFormField(
//             obscuringCharacter: '*',
//             maxLines: widget.maxlines ?? 1,
//             keyboardType: TextInputType.text,
//             controller: widget.controller,
//             focusNode: widget.currentFocusNode,
//             obscureText: _obscureText,
//             textInputAction: widget.nextFocusNode != null
//                 ? TextInputAction.next
//                 : TextInputAction.done,
//             onEditingComplete: () {
//               if (widget.nextFocusNode != null) {
//                 FocusScope.of(context).requestFocus(widget.nextFocusNode);
//               } else {
//                 FocusScope.of(context).unfocus();
//               }
//             },
//             cursorColor: Colors.white,
//             inputFormatters: widget.allowOnlyNumbers
//                 ? [
//               FilteringTextInputFormatter.digitsOnly, // Allow only digits
//             ]
//                 : widget.allowOnlyText
//                 ? [
//               FilteringTextInputFormatter.allow(
//                 RegExp(
//                     r'[a-zA-Z\s]'), // Allows only alphabets and spaces
//               ),
//             ]
//                 : null,
//             style: TextStyle(
//               fontFamily: 'Inter',
//               fontSize: widget.fontSize,
//               color: Colors.white,
//               fontWeight: widget.inputFontWeight ?? FontWeight.normal,
//             ),
//             decoration: InputDecoration(
//               fillColor: Colors.transparent,
//               filled: true,
//               hintText: widget.isRequiredHint && widget.hintText.isNotEmpty
//                   ? "${widget.hintText} "
//                   : widget.hintText,
//               hintStyle: TextStyle(
//                 fontFamily: 'Inter',
//                 color: widget.hintTextColor ?? Colors.grey,
//                 fontSize: widget.hintFontSize,
//                 fontWeight: widget.hintFontWeight ?? FontWeight.normal,
//               ),
//               contentPadding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               border: widget.noBorder
//                   ? InputBorder.none
//                   : GradientOutlineInputBorder(
//                 gradient:
//                 widget.innerGradient ?? linearGradientTextField,
//                 borderRadius: BorderRadius.circular(widget.borderRadius),
//                 width: widget.borderWidth,
//               ),
//               focusedBorder: widget.noBorder
//                   ? InputBorder.none
//                   : GradientOutlineInputBorder(
//                 gradient: linearGradientTextField,
//                 borderRadius: BorderRadius.circular(widget.borderRadius),
//                 width: widget.borderWidth,
//               ),
//               enabledBorder: widget.noBorder
//                   ? InputBorder.none
//                   : GradientOutlineInputBorder(
//                 gradient: linearGradientTextField,
//                 borderRadius: BorderRadius.circular(widget.borderRadius),
//                 width: widget.borderWidth,
//               ),
//               suffixIcon: widget.obscureText
//                   ? IconButton(
//                 icon: Icon(
//                   _obscureText
//                       ? Icons.visibility_off_outlined
//                       : Icons.visibility_outlined,
//                   color: greyColor,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _obscureText = !_obscureText;
//                   });
//                 },
//               )
//                   : widget.suffixIcon,
//               prefixIcon: widget.prefixIcon,
//             ),
//             validator: widget.validator,
//             onChanged: widget.onChanged,
//           ),
//         ),
//       ],
//     );
//   }
// }
