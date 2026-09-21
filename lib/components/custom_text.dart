import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
	const CustomText({
		super.key,
		required this.text,
		this.style,
		this.fontSize,
		this.color,
		this.fontWeight,
		this.textAlign,
		this.maxLines,
		this.overflow,
	});

	final String text;
	final TextStyle? style;
	final double? fontSize;
	final Color? color;
	final FontWeight? fontWeight;
	final TextAlign? textAlign;
	final int? maxLines;
	final TextOverflow? overflow;

	@override
	Widget build(BuildContext context) {
		return Text(
			text,
			textAlign: textAlign,
			maxLines: maxLines,
			overflow: overflow,
			style: style?.copyWith(
						fontSize: fontSize,
						color: color,
						fontWeight: fontWeight,
					) ??
					TextStyle(
						fontSize: fontSize,
						color: color,
						fontWeight: fontWeight,
					),
		);
	}
}
