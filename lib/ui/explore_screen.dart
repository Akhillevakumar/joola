import 'package:flutter/material.dart';
import 'package:test_project/app_constants/app_data.dart';
import 'package:test_project/widgets/search_text_field.dart';
import 'package:test_project/widgets/text_title.dart';

import '../widgets/oval_outline_button.dart';
import '../widgets/product_widget.dart';
import '../widgets/rounded_corner_card.dart';
import '../widgets/rounded_corner_imageview.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    super.key,
  });

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.history,
                          color: Colors.deepPurple,
                          size: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent.withOpacity(.1),
                              border: Border.all(color: Colors.deepPurple),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            children: [
                          Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://img.icons8.com/?size=30&id=ApOLCbcm9KeC&format=png&color=fffffff',
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return   Icon(Icons.error_outline,color: Colors.red,);
                            },
                          ),
                        ),

                    const Text(
                                "Rewards ",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SearchTextField(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        OvalOutlinedButton(
                          icon: Icons.ac_unit_sharp,
                          text: "New",
                          onPressed: () {
                            print("Button Pressed!");
                          },
                        ),
                        OvalOutlinedButton(
                          icon: Icons.favorite_border,
                          text: "Favourite",
                          onPressed: () {
                            print("Button Pressed!");
                          },
                        ),
                        OvalOutlinedButton(
                          icon: Icons.ac_unit_sharp,
                          text: "Yoga",
                          onPressed: () {
                            print("Button Pressed!");
                          },
                        ),
                        OvalOutlinedButton(
                          icon: Icons.sports_tennis,
                          text: "Play",
                          onPressed: () {
                            print("Button Pressed!");
                          },
                        ),
                      ],
                    ),
                  ),
                  const ProductCard(
                    title: "JOOLA",
                    subtitle: "NEXT GENERATION\n EQUIPMENT",
                  ),
                  titleText("Featured"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    //   horizontal scrolling
                    child: Row(
                      children: [
                        RoundedCornerImageView(
                          imageUrl: sampleImage,
                        ),
                        RoundedCornerImageView(
                          imageUrl: sampleImage2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12,),
                  titleText("Begin your Pickle ball Journey"),
                  const SizedBox(height: 8,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                     child: Row(
                      children: [
                        RoundedCornerCard(
                          imageUrl: sampleImage3,
                          title: "A fresh start",
                          subtitle: "5 min Mindfuniness",
                        ),
                        RoundedCornerCard(
                          imageUrl: sampleImage4,
                          title: "A fresh start",
                          subtitle: "5 min Mindfulness",
                        ),
                      ],
                    ),
                  ),
                  titleText("Your Picks"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                     child: Row(
                      children: [
                        RoundedCornerCard(
                          imageUrl: sampleImage5,
                          title: "A fresh start",
                          subtitle: "5 min Mindfulness",
                        ),
                        RoundedCornerCard(
                          imageUrl: sampleImage2,
                          title: "A fresh start",
                          subtitle: "5 min Mindfulness",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




