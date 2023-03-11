import 'package:flutter/material.dart';
import 'package:nodejs/screens/wallet/widget/sidebar.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widgets/input_widget.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/image_input.dart';
import 'dart:async';
import 'dart:io';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final _titleController = TextEditingController();
  final _desController = TextEditingController();
  late final String savedImage;

  final title = 'Booking me';
  final urlImage = './assets/images/dart1.jpeg';

  void savedImages() {}
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        drawer: const SideBarScreen(),
      );

  _buildAppBar() {
    return AppBar(
      shadowColor: Colors.red,
      // backgroundColor: Colors.transparent,
      elevation: 0.0,
      // backgroundColor: Colors.green,
      centerTitle: true,
      title: Text(title),
      actions:  [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('./assets/images/dart1.jpeg'),
          ),
        ),
        IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.cancel)),
      ],
    );
  }

  _buildBody() {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30, left: 7),
          padding: const EdgeInsets.all(8.0),
          child: const Text('Discover ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),),
        ),
        TabBar(
          controller: controller,
          tabs: const [
            Tab(text: 'Bus Ticket', icon: Icon(Icons.directions_bus, color: Colors.green,)),
            Tab(text: 'PeoplesBus', icon: Icon(Icons.directions_bus, color: Colors.green,)),
            Tab(text: 'AirLines', icon: Icon(Icons.airplane_ticket, color: Colors.green,),),
          ],
        ),
        SizedBox(
          height: 400,
          child: TabBarView(controller: controller, children: [
            _buildPackageLoad(),
            _buildPrePaidLoad(),
            _buildPaidLoad()
          ]),
        )
      ],
    );
  }

  _buildPaidLoad() {
    return ListView.builder(
      itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i){
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/post1');
              },
          child: Container(
          width: 200,
          height: 300,
          margin: const EdgeInsets.only(
          right: 10, top: 10, bottom: 0),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
          image: AssetImage("./assets/images/dart3.jpeg"),
          fit: BoxFit.fitHeight),
          ))
          );
        });

  }

  _buildPackageLoad() {
    return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index,){
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/post1');
              },
              child: Container(
                  width: 200,
                  height: 300,
                  margin:  const EdgeInsets.only(
                      right: 10, top: 10, bottom: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image:  DecorationImage(
                        image: AssetImage('./assets/images/dart${index + 1}.jpeg',), fit: BoxFit.fill,),
                    // fit: BoxFit.fitHeight),
                  ), child: const Text('Name'),
              )
          );
        });
  }

  _buildPrePaidLoad() {
    return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i){
          return GestureDetector(
              onTap: () {},
              child: Container(
                  width: 300,
                  height: 300,
                  margin: const EdgeInsets.only(
                      right: 10, top: 10, bottom: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("./assets/images/dart1.jpeg", ),
                        fit: BoxFit.cover, ),
                  ))
          );
        });
  }

  _buildBottomButton() {
    return Utils.popupAwesome(
        context,
        Column(
          children: [
            Center(
                child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 400,
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: _titleController,
                        icon: Icons.text_format,
                        hintText: 'Title',
                        keyBordType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        icon: Icons.money,
                        controller: _desController,
                        hintText: 'Amount',
                        keyBordType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ImageInputScreen(savedImages),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          text: 'Update',
                          icon: Icons.add,
                          onTap: () async {
                            _titleController.text = '';
                            _desController.text = '';
                            // ignore: unrelated_type_equality_checks
                            savedImage != '';
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
        () {});
  }
}
