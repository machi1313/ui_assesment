import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_assignment/core/router/router_constants.dart';
import 'package:flutter_ui_assignment/domain/usecases/get_transaction_details.dart';
import 'package:flutter_ui_assignment/presentation/bloc/paymentbloc/payment_bloc.dart';
import 'package:flutter_ui_assignment/presentation/bloc/transactionbloc/transaction_bloc.dart';
import 'package:flutter_ui_assignment/presentation/dashboard/dashboard_cubit.dart';
import 'package:flutter_ui_assignment/presentation/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_assignment/presentation/profile_screen.dart';
import 'package:flutter_ui_assignment/presentation/payment_screen.dart';
import 'package:flutter_ui_assignment/presentation/stat_screen.dart';
import 'package:flutter_ui_assignment/presentation/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Initialize dependencies here (Repository, Services, etc)
  // await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashboardCubit()),
        BlocProvider(create: (_) => PaymentBloc()),

        BlocProvider(
          create: (_) => TransactionBloc(
            getTransactionDetails: MockGetTransactionDetails(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Your App',
        theme: ThemeData.light(),

        /// Centralized routing
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.dashboardRoute:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
          settings: settings,
        );

      case RouterConstants.duitinRoute:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case RouterConstants.scanRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case RouterConstants.statRoute:
        return MaterialPageRoute(builder: (_) => const StatisticScreen());
      case RouterConstants.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      /// Add more routes here
      // case RouterConstants.profileRoute:
      //   return MaterialPageRoute(builder: (_) => const UserProfilePage());

      default:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
    }
  }
}
