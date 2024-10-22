import 'package:flutter/material.dart';
import 'package:samplemodel/views/screens/splash/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onViewModelReady: (model)=>model.startTimer(),
      viewModelBuilder: ()=>SplashViewModel(),
      builder: (BuildContext context, SplashViewModel viewModel, Widget? child) {
        return Scaffold(
          body: Center(
            child: Icon(Icons.access_time_rounded ,size: 180,),
          ),

        );
      },
      onDispose: (model)=>model.dispose(),

    );
  }
}
