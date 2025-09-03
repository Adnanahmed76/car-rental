import 'package:carrental/data%20modals/car.dart';
import 'package:carrental/presentation/pages/maps_datapage.dart';
import 'package:carrental/presentation/widgets/car_card.dart';
import 'package:carrental/presentation/widgets/more_car.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;
  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller?.dispose(); // ✅ correct cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.info_outline),
            SizedBox(width: 5),
            Text("Information", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(car: widget.car),
            const SizedBox(height: 20),

            // 👤 User info + map preview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // User Card
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: const [
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
                  const SizedBox(width: 20),

                  // Map Card
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapsDatapage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Transform.scale(
                            scale: _animation!.value,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/maps.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🚗 More cars list
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  MoreCar(
                    car: Car(
                      model: widget.car.model + '1',
                      distance: widget.car.distance + 100,
                      fuelCapacity: widget.car.fuelCapacity + 100,
                      pricePerhour: widget.car.pricePerhour + 100,
                    ),
                  ),
                  const Divider(),
                  MoreCar(
                    car: Car(
                      model: widget.car.model + '2',
                      distance: widget.car.distance + 200,
                      fuelCapacity: widget.car.fuelCapacity + 200,
                      pricePerhour: widget.car.pricePerhour + 200,
                    ),
                  ),
                  const Divider(),
                  MoreCar(
                    car: Car(
                      model: widget.car.model + '3',
                      distance: widget.car.distance + 300,
                      fuelCapacity: widget.car.fuelCapacity + 300,
                      pricePerhour: widget.car.pricePerhour + 300,
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//1. domain/entities
//2. domain/repostiry(interface/contract)
//domain/usecases

//data/mpdel
//2 domain/datasources(detch api/firebase)
//2 domain repository