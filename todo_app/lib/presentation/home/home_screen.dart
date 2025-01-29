import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/base_screen.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    
    return BaseScreen(
      title: 'My Lists',
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        onTap: (index) {
          if (index == 2) { // Logout item index
            Get.dialog(
              AlertDialog(
                title: const Text('Confirm Logout'),
                content: const Text('Are you sure you want to logout?'),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      authController.logout();
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            );
          }
        },
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildListCard(
              context,
              title: 'Personal',
              taskCount: 2,
              icon: Icons.person,
              color: Colors.purple,
            ),
            _buildListCard(
              context,
              title: 'Work',
              taskCount: 1,
              icon: Icons.work,
              color: Colors.pink,
            ),
            _buildListCard(
              context,
              title: 'Movie to watch',
              taskCount: 0,
              icon: Icons.movie,
              color: Colors.green,
            ),
            _buildAddListCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildListCard(
    BuildContext context, {
    required String title,
    required int taskCount,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              '$taskCount Task',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddListCard() {
    return Card(
      child: InkWell(
        onTap: () {},
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
} 