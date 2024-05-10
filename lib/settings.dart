import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.brown.shade200,
                      radius: 90,
                      child: const Icon(
                        Icons.person_4_rounded,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Column(
                children: [
                  Text(
                    "Tshepho.T.Khame",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "tshepho@pcgsoftware.co",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300,
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.person_pin),
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Personal Info",
                          style: TextStyle(),
                        )),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300,
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.key_outlined),
                        Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "Password and Security",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade700,
                      thickness: 0.1,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.grid_view_rounded),
                        Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "App and Services",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade700,
                      thickness: 0.1,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.lock_rounded),
                        Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "Privacy",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade700,
                      thickness: 0.1,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.devices_outlined),
                        Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "Devices",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300,
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.notifications),
                        Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "Notifications",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade700,
                      thickness: 0.1,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.help),
                        Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "Help",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade700,
                      thickness: 0.1,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.info_rounded),
                        Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "About",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("LogOut")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
