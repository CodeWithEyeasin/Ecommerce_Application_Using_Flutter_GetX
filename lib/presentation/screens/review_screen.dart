import 'package:ecommerce_app/presentation/screens/create_review_screen.dart';
import 'package:ecommerce_app/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 8,
                itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    elevation: 1,
                    surfaceTintColor: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 240,
                        child: _buildReviewSection(),
                      ),
                    ),
                  ),
                ],
              );
            },),
          ),
          _buildCheckoutWidget(),
        ],
      ),
    );
  }

  Widget _buildReviewSection() {
    return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: const Icon(Icons.person_2_outlined,color: Colors.grey,),
                    ),
                  ),
                  const Text('Rabbil Hasan',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),)

                ],
              ),
              const Text('''Lorem ipsum dolor sit amet. Et architecto illum ut sint galisum et sint sunt id praesentium minima. Hic dolorem animi aut tempore dolorem in harum atque aut consequatur quis ea enim laudantium cum odit molestias. Sit quibusdam commodi eum exercitationem perferendis et dolor voluptatem non aperiam laboriosam. Eum velit quod ut dolor officia sit repudiandae temporibus et aliquid obcaecati aut esse earum.''')
            ],
          );
  }

  Widget _buildCheckoutWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTotalPriceWidget(),
          FloatingActionButton(onPressed: (){
            Get.to(()=> const CreateReviewScreen());
          },child: const Icon(Icons.add,color: Colors.black,),)
        ],
      ),
    );
  }

  Widget _buildTotalPriceWidget() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reviews  (1000)',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),),
      ],
    );
  }
}
