import 'package:dev_app/models/ProductModel.dart';
import 'package:dev_app/models/RadioModel.dart';
import 'package:dev_app/models/enums.dart';
import 'package:dev_app/ui/widgets/infoChip.dart';
import 'package:dev_app/ui/widgets/infoChipContainer.dart';
import 'package:dev_app/ui/widgets/radioSection.dart';
import 'package:dev_app/ui/widgets/ratingWidget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final ProductModel coffeCardProps;
  const MainScreen({Key? key, required this.coffeCardProps}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CoffeSizes _coffeSize = CoffeSizes.Small;
  final List<InfoChipProps> infoChipProps = [
    InfoChipProps(
      label: 'Coffee',
      icon: 'assets/icons/openmoji_roasted-coffee-bean.svg',
    ),
    InfoChipProps(
      label: 'Chocolate',
      icon: 'assets/icons/emojione_chocolate-bar.svg',
    ),
    InfoChipProps(label: 'Medium Roasted'),
  ];

  void changeCoffeSizeState(value) {
    setState(() => _coffeSize = value);
  }

  final TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    print(widget.coffeCardProps);
    List<RadioModel> radioProps = [
      RadioModel(
        label: "Small",
        value: CoffeSizes.Small,
        groupValue: _coffeSize,
        onChanged: changeCoffeSizeState,
        textStyle: textStyle,
      ),
      RadioModel(
        label: "Medium",
        value: CoffeSizes.Medium,
        groupValue: _coffeSize,
        onChanged: changeCoffeSizeState,
        textStyle: textStyle,
      ),
      RadioModel(
        label: "Large",
        value: CoffeSizes.Large,
        groupValue: _coffeSize,
        onChanged: changeCoffeSizeState,
        textStyle: textStyle,
      ),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF4E342E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    widget.coffeCardProps.imagePath,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 200,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black54,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withAlpha(200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.coffeCardProps.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              widget.coffeCardProps.description,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        RatingWidget(
                          rating: widget.coffeCardProps.rating,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              transform: Matrix4.translationValues(
                0.0,
                -20.0,
                0.0,
              ), // Pull upward
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding: const EdgeInsets.all(21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tags
                  InfoChipContainer(infoChips: infoChipProps),
                  const SizedBox(height: 30),

                  Container(
                    child: RadioSection(
                      label: 'Coffe Size',
                      radioProps: radioProps,
                    ),
                  ),
                  const SizedBox(height: 33),

                  const Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat '
                    'aliquam porttitor molestie. Neque, vel duis sit vel pellentesque '
                    'tempor. A commodo arcu tortor arcu, elit.',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF846046),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            widget.coffeCardProps.price,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
