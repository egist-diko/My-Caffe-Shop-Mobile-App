import 'package:dev_app/ui/widgets/infoChip.dart';
import 'package:flutter/material.dart';

class InfoChipContainer extends StatelessWidget {
  final List<InfoChipProps> infoChips;
  const InfoChipContainer({super.key, required this.infoChips});

  List<Widget> _buildInfoChips(List<InfoChipProps> allInfoChips) {
    return List.generate(allInfoChips.length, (index) {
      final isLast = index == allInfoChips.length - 1;
      return Row(
        children: [
          InfoChip(infoChipProps: allInfoChips[index]),
          if (!isLast)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 20,
                child: VerticalDivider(thickness: 1, color: Colors.grey),
              ),
            ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildInfoChips(infoChips),
      ),
    );
  }
}
