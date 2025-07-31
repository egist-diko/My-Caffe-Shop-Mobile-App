import 'package:dev_app/models/ProductModel.dart';
import 'package:dev_app/routes/NavigationService.dart';
import 'package:dev_app/routes/routes.dart';
import 'package:dev_app/ui/widgets/ratingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoffeeCard extends StatelessWidget {
  final ProductModel cardProps;

  const CoffeeCard(this.cardProps);

  @override
  Widget build(BuildContext context) {
    final imagePath = cardProps.imagePath;
    final name = cardProps.name;
    final price = cardProps.price;
    final rating = cardProps.rating;
    final description = cardProps.description;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(right: 8, top: 8, child: RatingWidget(rating: rating)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 6,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        price,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF846046),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: SvgPicture.asset(
                        'assets/icons/rounded_plus.svg',
                        width: 12,
                        height: 12,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        NavigationService.navigateTo(AppRoutes.mainScreen, {
                          'mainScreenProps': cardProps,
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
