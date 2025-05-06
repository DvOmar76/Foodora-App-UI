import 'package:flutter/material.dart';
import 'package:foodora_app_ui/models/category_model.dart';
import 'package:foodora_app_ui/widgets/card_category_widget.dart';

class CategoryCardListWidget extends StatelessWidget {
  const CategoryCardListWidget({super.key, required this.onCategoryTap});
  final Function(String) onCategoryTap;
  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: SizedBox(
    //     height: 100,
    //     child: ListView.builder(
    //       scrollDirection: Axis.horizontal,
    //       itemCount: categories.length,
    //       itemBuilder: (context, index) {
    //         final category = categories[index];
    //         return Padding(
    //           padding: const EdgeInsets.only(right: 20),
    //           child: CardCategoryWidget(
    //             category:category,
    //             onCategoryTap:onCategoryTap
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
    return DefaultTabController(
      length: categories.length, 
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            onTap: (value) {},
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
    
            ),
            dividerColor: Colors.white,
            tabs:
                categories
                    .map(
                      (category) => CardCategoryWidget(
                        category: category,
                        onCategoryTap: onCategoryTap,
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
