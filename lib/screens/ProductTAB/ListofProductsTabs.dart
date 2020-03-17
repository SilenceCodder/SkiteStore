import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:skitestore/screens/ProductTAB/WearScreen.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppFontSize.dart';
import 'package:skitestore/styles/AppTextStyle.dart';
import 'package:skitestore/viewmodel/ProductsTabsViewModel.dart';

class ListofProductsTabs extends StatefulWidget {
  @override
  _ListofProductsTabsState createState() => _ListofProductsTabsState();
}

class _ListofProductsTabsState extends State<ListofProductsTabs> {
  @override
  Widget build(BuildContext context) {
     return ViewModelProvider<ProductsTabsViewModel>.withConsumer(
      viewModel: ProductsTabsViewModel(),
      builder: (context, model, child) =>
         DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: PreferredSize(
             preferredSize: Size.fromHeight(50.0),  
             child: AppBar(
              backgroundColor: AppColor.red,
              elevation: 0,
              bottom: TabBar(
                 isScrollable: true,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.grey,
                  indicatorWeight: 1.0,
                  labelStyle: AppTextStyle.subHeader2(context, Colors.white),
                  indicator: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [AppColor.teal, AppColor.deep00]),
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.black),
                      //indicatorColor: Color(0xFF45A1C9),
                  tabs: [
                    Container(
                      height: 30,
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Wears"), 
                        ),
                      
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Watch"),
                        ),
                      ),
                    ),
                    Container(
                       height: 30,
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Fashion"),
                        ),
                      ),
                    ),
                    Container(
                       height: 30,
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Accessories"),
                        ),
                      ),
                    ),
                     Container(
                       height: 30,
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Computers"),
                        ),
                      ),
                    ),
                     Container(
                       height: 30,
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Phones"),
                        ),
                      ),
                    ),
                  ]),
         
         
            ),
          ),
          body: TabBarView(children: [
WearScreen(),
Text(''),
Text(''),
Text(''),
Text(''),
Text(''),

          ]),
         
        )
     )
      );
  
  }
}