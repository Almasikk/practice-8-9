import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice9/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:practice9/presentation/screens/apps_screen.dart';
import 'package:practice9/presentation/screens/home_screen.dart';
import 'package:practice9/presentation/screens/profile_screen.dart';
import 'package:practice9/presentation/screens/work_screen.dart';

class BottomNavbar extends StatefulWidget {
  final int id;
  final String name;
  final String username;
  final String phone;
  final String website;
  final String street;
  final String suite;
  final String city;

  const BottomNavbar({
    Key? key,
    required this.name,
    required this.username,
    required this.phone,
    required this.website,
    required this.id,
    required this.street,
    required this.suite,
    required this.city,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 3;

  @override
  void initState() {
    super.initState();

    // Trigger LoadedNavigationState when entering the ProfilePage immediately
    context.read<NavigationBloc>().add(ChangePage(index: _currentIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BottomExample",
          style: TextStyle(
            color: Color(0xFF4C97EB),
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 1,
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is LoadedNavigationState) {
            if (state.index == 0) {
              return HomePage(
                id: widget.id,
                name: widget.name,
                street: widget.street,
                suite: widget.suite,
                city: widget.city,
              );
            } else if (state.index == 1) {
              return const WorkPage();
            } else if (state.index == 2) {
              return const AppsPage();
            } else if (state.index == 3) {
              return ProfilePage(
                name: widget.name,
                username: widget.username,
                phone: widget.phone,
                website: widget.website,
              );
            }
          }
          return Container();
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFF4D859),
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFF9B9B9B),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 32),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline_outlined, size: 32),
              label: 'Work',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps, size: 32),
              label: 'Apps',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined, size: 32),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              context.read<NavigationBloc>().add(ChangePage(index: index));
            });
          },
        ),
      ),
    );
  }
}
