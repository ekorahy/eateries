import 'package:eateries/provider/detail/restaurant_detail_provider.dart';
import 'package:eateries/static/customer_review_result_state.dart';
import 'package:flutter/material.dart';
import 'package:eateries/data/model/restaurant_detail.dart';
import 'package:provider/provider.dart';

class BodyOfDetail extends StatefulWidget {
  final Restaurant restaurant;

  const BodyOfDetail({super.key, required this.restaurant});

  @override
  State<BodyOfDetail> createState() => _BodyOfDetailState();
}

class _BodyOfDetailState extends State<BodyOfDetail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  void _addReview() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final review = _reviewController.text.trim();

      context.read<RestaurantDetailProvider>().postReview(
            widget.restaurant.id,
            name,
            review,
          );

      _nameController.clear();
      _reviewController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              widget.restaurant.name,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox.square(dimension: 16),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.network(
                "https://restaurant-api.dicoding.dev/images/small/${widget.restaurant.pictureId}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox.square(dimension: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius:
                        BorderRadius.circular(30), // Menambahkan radius
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox.square(
                            dimension: 4,
                          ),
                          Text(
                            "Rating",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                      const SizedBox.square(
                        dimension: 4,
                      ),
                      Text(
                        widget.restaurant.rating.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                const SizedBox.square(
                    dimension: 12.0), // Memberikan jarak antara kontainer
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainer, // Warna latar belakang
                    borderRadius:
                        BorderRadius.circular(30.0), // Menambahkan radius
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_city,
                              color: Theme.of(context).colorScheme.primary),
                          const SizedBox.square(
                            dimension: 4,
                          ),
                          Text(
                            "City",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                      const SizedBox.square(
                        dimension: 4,
                      ),
                      Text(
                        widget.restaurant.city,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                const SizedBox.square(
                    dimension: 12.0), // Memberikan jarak antara kontainer
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainer, // Warna latar belakang
                    borderRadius:
                        BorderRadius.circular(30.0), // Menambahkan radius
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_rounded,
                              color: Theme.of(context).colorScheme.secondary),
                          const SizedBox.square(
                            dimension: 4,
                          ),
                          Text(
                            "Address",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                      const SizedBox.square(
                        dimension: 4,
                      ),
                      Text(
                        widget.restaurant.address,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox.square(dimension: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .surfaceContainer, // Warna latar belakang
              borderRadius: BorderRadius.circular(16.0), // Menambahkan radius
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox.square(dimension: 8),
                Text(
                  widget.restaurant.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Menus",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Foods",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.restaurant.menus.foods
                            .map((food) => Container(
                                  height: 100,
                                  width: 150,
                                  margin: const EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -30,
                                        right: -20,
                                        child: Container(
                                          width: 100,
                                          height:
                                              100, // Sesuaikan tinggi sesuai dengan gambar
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/foods.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          food.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Drinks",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.restaurant.menus.drinks
                            .map((drink) => Container(
                                  height: 100,
                                  width: 150,
                                  margin: const EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -30,
                                        right: -20,
                                        child: Container(
                                          width: 100,
                                          height:
                                              100, // Sesuaikan tinggi sesuai dengan gambar
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/drinks.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          drink.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox.square(dimension: 28),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer, // Warna latar belakang
              borderRadius: BorderRadius.circular(20.0), // Menambahkan radius
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Leave a Review",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                const SizedBox(height: 8),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                          hintText: "Enter your name",
                          hintStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7), // Warna placeholder
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary, // Warna border saat tidak fokus
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary, // Warna border saat fokus
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary, // Warna teks input
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _reviewController,
                        decoration: InputDecoration(
                          labelText: "Review",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                          hintText: "Write your review here",
                          hintStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.7), // Warna placeholder
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary, // Warna border saat tidak fokus
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary, // Warna border saat fokus
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary, // Warna teks input
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Review cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: _addReview,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary, // Warna tombol
                          ),
                          child: Text(
                            "Submit Review",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text(
            "Customer Reviews",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer<RestaurantDetailProvider>(
            builder: (context, value, child) {
              return switch (value.customerReviewState) {
                CustomerReviewLoadingState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                CustomerReviewLoadedState(data: var customerReviews) =>
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: customerReviews.length,
                    itemBuilder: (context, index) {
                      final review = customerReviews[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                            borderRadius:
                                BorderRadius.circular(16), // Menambahkan radius
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.account_circle_rounded,size: 40,),
                                  const SizedBox.square(dimension: 4,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                    review.name,
                                    style: Theme.of(context).textTheme.titleSmall),
                                    const SizedBox.square(dimension: 4,),
                                    Text(
                                    review.date,
                                    style: Theme.of(context).textTheme.labelMedium)
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(review.review, style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                CustomerReviewErrorState(error: var message) => Center(
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                _ => const SizedBox(),
              };
            },
          )
        ],
      ),
    ));
  }
}
