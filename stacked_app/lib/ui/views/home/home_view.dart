import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/views/login/login_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stacked App'),
        backgroundColor: Color.fromARGB(255, 47, 0, 129),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return TabletView(formKey: formKey, viewModel: viewModel);
            } else {
              return MobileView(formKey: formKey, viewModel: viewModel);
            }
          })),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class MobileView extends StatelessWidget {
  const MobileView({super.key, required this.formKey, required this.viewModel});

  final GlobalKey<FormState> formKey;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(80, 35))),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                SizedBox(height: 30),
                Text(
                  'LAYOUT BUILDER',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabletView extends StatelessWidget {
  const TabletView({super.key, required this.formKey, required this.viewModel});

  final GlobalKey<FormState> formKey;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter your name',
                            border: OutlineInputBorder()),
                        controller: viewModel.name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter your location',
                            border: OutlineInputBorder()),
                        controller: viewModel.location,
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                          onPressed: showLoadingDialog,
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size(80, 35))),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                      SizedBox(height: 30),
                      // Image.asset(
                      //     height: 300,
                      //     width: 300,
                      //     "assets/images/flutter1.png")
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'LAYOUT BUILDER',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
