import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_description.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onMealSelect});

  final Meal meal;
  final void Function() onMealSelect;
  static const affordability = {
    Affordability.affordable: 1,
    Affordability.pricey: 2,
    Affordability.luxurious: 3
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
          onTap: onMealSelect,
          child: Stack(
            children: [
              FadeInImage(
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl)),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            meal.title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealDescription(
                                icon: Icons.schedule,
                                label: "${meal.duration} min"),
                            const SizedBox(
                              width: 12,
                            ),
                            for (int i = 0;
                                i < affordability[meal.affordability]!;
                                ++i)
                              const Icon(Icons.currency_rupee, size: 16,),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
