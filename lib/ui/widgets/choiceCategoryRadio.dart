import 'package:dev_app/models/RadioModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRadioButton extends StatelessWidget {
  final RadioModel props;

  const CustomRadioButton({required this.props});

  @override
  Widget build(BuildContext context) {
    final value = props.value;
    final groupValue = props.groupValue;
    final onChanged = props.onChanged;
    final icon = props.icon;
    final label = props.label;
    final isSelected = value == groupValue;
    final textStyle = props.textStyle;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: icon != null ? 12 : 30,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF846046) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            icon != null
                ? SvgPicture.asset(
                    icon,
                    color: !isSelected ? Color(0xFF846046) : Colors.white,
                  )
                : SizedBox(),
            icon != null ? const SizedBox(width: 6) : SizedBox(),
            Text(
              label,
              style: textStyle.apply(
                color: isSelected ? Colors.white : Color(0xFF846046),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
