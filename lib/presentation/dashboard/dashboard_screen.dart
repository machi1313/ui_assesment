import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_assignment/core/router/router_constants.dart';
import 'package:flutter_ui_assignment/presentation/dashboard/dashboard_cubit.dart';
import 'package:flutter_ui_assignment/presentation/home_screen.dart';
import 'package:flutter_ui_assignment/presentation/profile_screen.dart';
import 'package:flutter_ui_assignment/presentation/payment_screen.dart';
import 'package:flutter_ui_assignment/presentation/stat_screen.dart';
import 'package:flutter_ui_assignment/presentation/chat_screen.dart';
import 'package:flutter_ui_assignment/core/utils/nav_item.dart';



class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget _currentScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ChatScreen();
      case 2:
        return const PaymentScreen();
      case 3:
        return const StatisticScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit()
        ..openWithIndex(
          ModalRoute.of(context)?.settings.arguments != null
              ? (ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>)['openIndex']
              : 0,
        ),
      child: Scaffold(
        backgroundColor:Colors.white,

        body: BlocBuilder<DashboardCubit, int>(
          builder: (context, index) => _currentScreen(index),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            Navigator.pushNamed(context, RouterConstants.scanRoute);
          },
          shape: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
             "assets/icons/ic_scan.svg",
              height: 23,
              width: 24,
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: BlocBuilder<DashboardCubit, int>(
            builder: (context, selectedIndex) {
              return Container(
                height: 80,
                padding: EdgeInsets.zero,
                color:Colors.white,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// LEFT SIDE
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NavItem(
                            index: 0,
                            label: 'Home',
                            iconPath:"assets/icons/ic_home.svg",
                            selectedIndex: selectedIndex,
                          ),
                          NavItem(
                            index: 1,
                            label: 'Duitin',
                            iconPath: "assets/icons/ic_wallet.svg",
                            selectedIndex: selectedIndex,
                          ),
                        ],
                      ),
                    ),

                    /// RIGHT SIDE
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NavItem(
                            index: 3,
                            label: 'Statistic',
                            iconPath: "assets/icons/ic_stat.svg",
                            selectedIndex: selectedIndex,
                          ),
                          NavItem(
                            index: 4,
                            label: 'Profile',
                            iconPath:"assets/icons/ic_profile.svg",
                            selectedIndex: selectedIndex,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
