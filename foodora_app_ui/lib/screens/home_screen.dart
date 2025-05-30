import 'package:flutter/material.dart';
import 'package:foodora_app_ui/classes/circleDot.dart';
import 'package:foodora_app_ui/models/food_model.dart';
import 'package:foodora_app_ui/screens/cart_screen.dart';
import 'package:foodora_app_ui/widgets/burger_card_list_widget.dart';
import 'package:foodora_app_ui/widgets/category_card_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedCategorys = ["Burgers"];
  onTapCategory(String category) {
    setState(() {
      if (selectedCategorys.contains(category)) {
        selectedCategorys.remove(category);
      } else {
        selectedCategorys.add(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // if i select a category it will return foods with same category [Filter]
    List<FoodModel> foodsWithSameCategory =
        selectedCategorys.isEmpty
            ? listOfFood
            : listOfFood
                .where((food) => selectedCategorys.contains(food.category))
                .toList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset("assets/images/profile.png"),
          SizedBox(width: 29),
        ],
      ),
      //drawer
      drawer: Drawer(),

      floatingActionButton: Container(
        width: 55,
        height: 55,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 4),
              blurStyle: BlurStyle.outer,
            ),
          ],
          borderRadius: BorderRadius.circular(32),
          color: Color.fromRGBO(255, 0, 54, 1),
          border: Border.all(color: Colors.white, width: 3),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          },
          child: Center(
            child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose the", style: TextStyle(fontSize: 18)),
            Text(
              "Food you love",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // search 
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: "Search for a food item",
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 20),

                  Text("Categories", style: TextStyle(fontSize: 12)),
                  SizedBox(height: 12),
                  // show  categories [ pass the onTap to get selected category to filter in foodsWithSameCategory list ]
                  SizedBox(
                    height: 100,
                    child: CategoryCardListWidget(onCategoryTap: onTapCategory),
                  ),
                  SizedBox(height: 32),

                  Text("Burgers", style: TextStyle(fontSize: 12)),
                  SizedBox(height: 32),
                  // show  foods 
                  BurgerCardListWidget(
                    foodWithSamCategory: foodsWithSameCategory,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleDot(isActive: true),
                      SizedBox(width: 8),
                      CircleDot(),
                      SizedBox(width: 8),
                      CircleDot(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
