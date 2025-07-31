import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoChipProps {
  final String? icon;
  final String label;

  const InfoChipProps({this.icon, required this.label});
}

class InfoChip extends StatelessWidget {
  final InfoChipProps infoChipProps;

  const InfoChip({required this.infoChipProps});

  @override
  Widget build(BuildContext context) {
    final localIcon = infoChipProps.icon;
    return Row(
      children: [
        localIcon != null ? SvgPicture.asset(localIcon) : SizedBox(),
        localIcon != null ? const SizedBox(width: 4) : SizedBox(),
        Text(
          infoChipProps.label,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
        ),
      ],
    );
  }
}
