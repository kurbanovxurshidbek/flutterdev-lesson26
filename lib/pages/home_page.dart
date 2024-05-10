import 'package:flutter/material.dart';
import 'package:ngdemo23/pages/lesson2/bloc_builder_page.dart';
import 'package:ngdemo23/pages/lesson3/multi_repository_page.dart';
import 'package:ngdemo23/pages/lesson3/single_repository_page.dart';
import 'package:ngdemo23/pages/lesson4/bloc_selector_page.dart';

import 'lesson1/bloc_provider_page.dart';
import 'lesson1/multi_bloc_provider_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Bloc State Management"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("BlocProvider"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const BlocProviderPage()),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("MultiBlocProvider"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MultiBlocProviderPage()),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("BlocBuilder"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const BlocBuilderPage()),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("RepositoryProvider"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SingleRepositoryPage()),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("MultiRepositoryProvider"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MultiRepositoryPage()),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("Bloc Selector"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const BlocSelectorPage()),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("Bloc Listener"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {

                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("Bloc Consumer"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {

                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("Bloc vs Cubit"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {

                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 45,
                width: double.infinity,
                child: MaterialButton(
                  child: Text("Bloc Concurrency"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {

                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
