import 'package:dev_app/models/RadioModel.dart';
import 'package:dev_app/ui/widgets/choiceCategoryRadio.dart';
import 'package:flutter/material.dart';

class RadioSection extends StatelessWidget {
  final String label;
  final List<RadioModel> radioProps;
  const RadioSection({
    super.key,
    required this.label,
    required this.radioProps,
  });

  List<Widget> _buildChoiceCategoryRadio(List<RadioModel> allRadioProps) {
    return allRadioProps.map((radioProp) {
      return CustomRadioButton(props: radioProp);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),
        // Categories Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildChoiceCategoryRadio(radioProps),
        ),
      ],
    );
  }
}
