import 'package:carrental/data%20modals/car.dart';
import 'package:carrental/presentation/widgets/car_card.dart';
import 'package:carrental/presentation/widgets/more_car.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text("Information", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(
              car: Car(
                model: "Fortuner",
                distance: 870,
                fuelCapacity: 50,
                pricePerhour: 45,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/user.png'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Jane Copper",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("\$4,453", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/maps.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  MoreCar(
                    car: Car(
                      model: "Fortuner",
                      distance: 870,
                      fuelCapacity: 50,
                      pricePerhour: 45,
                    ),
                  ),
                  Divider(),
                  MoreCar(
                    car: Car(
                      model: "Fortuner",
                      distance: 870,
                      fuelCapacity: 50,
                      pricePerhour: 45,
                    ),
                  ),
                  Divider(),
                  MoreCar(
                    car: Car(
                      model: "Fortuner",
                      distance: 870,
                      fuelCapacity: 50,
                      pricePerhour: 45,
                    ),
                  ),
                  Divider(),
                  MoreCar(
                    car: Car(
                      model: "Fortuner",
                      distance: 870,
                      fuelCapacity: 50,
                      pricePerhour: 45,
                    ),
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
