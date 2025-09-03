import 'package:carrental/data%20modals/car.dart';
import 'package:carrental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  final List<Car> cars = [
    Car(model: "Fortuner", distance: 870, fuelCapacity: 50, pricePerhour: 45),
    Car(model: "Fortuner", distance: 870, fuelCapacity: 50, pricePerhour: 45),
    Car(model: "Fortuner", distance: 870, fuelCapacity: 50, pricePerhour: 45),
    Car(model: "Fortuner", distance: 870, fuelCapacity: 50, pricePerhour: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Choose your Car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
