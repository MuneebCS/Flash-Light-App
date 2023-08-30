import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isActive = false;
  var controller = TorchController();

  @override
  void initState() {
    super.initState();
    controller.hasTorch.then((hasTorch) {
      if (hasTorch != null && !hasTorch) {
        print('Device does not have a flashlight.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Flash Light App',
          style: TextStyle(color: Colors.white), // Change text color to white
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Torch4.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.hasTorch.then((hasTorch) {
                          if (hasTorch != null && hasTorch) {
                            controller.toggle();
                            setState(() {
                              isActive = !isActive;
                            });
                          }
                        });
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 68.0,
                            horizontal: 20,
                          ),
                          child: Text(
                            isActive ? 'On' : 'Off',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                'Developed by Muhammad Muneeb Iftikhar',
                style: TextStyle(
                    fontSize: 12, color: const Color.fromARGB(255, 189, 16, 4)),
              ),
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
