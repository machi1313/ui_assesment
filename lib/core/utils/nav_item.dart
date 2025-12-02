import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_assignment/presentation/dashboard/dashboard_cubit.dart';

class NavItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String label;
  final String iconPath;

  const NavItem({
    super.key,
    required this.index,
    required this.label,
    required this.iconPath,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    // final isSelected = selectedIndex == index;

    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        context.read<DashboardCubit>().changeTab(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: Colors.black,
            // color: isSelected ? Colors.black : Colors.white,
            width: 25,
            height: 25,
            // You can also force the color to apply to the fill only
            colorBlendMode: BlendMode.srcIn,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
