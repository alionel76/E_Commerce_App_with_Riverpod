import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../settings/presentation/providers/theme_provider.dart';
import '../providers/user_profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final user = ref.watch(userProfileProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 50,
          child: Icon(Icons.person, size: 50),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => _showEditNameDialog(context, ref, user?.name ?? ''),
          child: Text(
            user?.name ?? 'Guest',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              decoration: TextDecoration.underline,
              color: Colors.blue,
            ),
          ),
        ),
        Text(
          user?.email ?? '',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
        ListTile(
          title: const Text('Dark Mode'),
          trailing: Switch(
            value: themeMode == ThemeMode.dark,
            onChanged: (_) => ref.read(themeProvider.notifier).toggleTheme(),
          ),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.history),
          title: Text('Order History'),
        ),
        const ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Shipping Addresses'),
        ),
        const ListTile(
          leading: Icon(Icons.payment),
          title: Text('Payment Methods'),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Logout'),
        ),
      ],
    );
  }

  void _showEditNameDialog(BuildContext context, WidgetRef ref, String currentName) {
    final controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter your name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(userProfileProvider.notifier).updateName(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
