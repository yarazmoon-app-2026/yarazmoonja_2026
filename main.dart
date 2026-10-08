import 'package:flutter/material.dart';

void main() => runApp(const YareAzmoonApp());

class YareAzmoonApp extends StatelessWidget {
  const YareAzmoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'یار آزمون جزا',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF163A5F)),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final pages = const [StudyPage(), QuizPage(), ReviewPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('یار آزمون جزا', style: TextStyle(fontWeight: FontWeight.w800)),
          centerTitle: false,
          backgroundColor: Colors.transparent,
        ),
        body: pages[index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) => setState(() => index = value),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'مطالعه'),
            NavigationDestination(icon: Icon(Icons.quiz_outlined), selectedIcon: Icon(Icons.quiz), label: 'آزمون'),
            NavigationDestination(icon: Icon(Icons.refresh_outlined), selectedIcon: Icon(Icons.refresh), label: 'مرور'),
            NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'پروفایل'),
          ],
        ),
      ),
    );
  }
}

class StudyPage extends StatelessWidget {
  const StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('برنامه امروز', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('۲۰ ماده جدید + مرور مطالب قبلی + آزمون روزانه'),
              const SizedBox(height: 16),
              ClipRRect(borderRadius: BorderRadius.circular(8), child: const LinearProgressIndicator(value: .35, minHeight: 10)),
              const SizedBox(height: 8),
              const Text('۷ از ۲۰ ماده مطالعه شده'),
            ]),
          ),
        ),
        const SizedBox(height: 12),
        const Text('کتابخانه قوانین', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _LawCard(title: 'حقوق جزای عمومی', subtitle: 'مطالعه و تحلیل مواد قانونی', icon: Icons.gavel),
        _LawCard(title: 'حقوق جزای اختصاصی', subtitle: 'مواد و نکات آزمونی', icon: Icons.library_books),
        _LawCard(title: 'آیین دادرسی کیفری', subtitle: 'مواد، نکات و مرور', icon: Icons.account_balance),
        _LawCard(title: 'قوانین خاص جزایی', subtitle: 'منابع مستقل و قابل توسعه', icon: Icons.folder_copy),
      ],
    );
  }
}

class _LawCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const _LawCard({required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: CircleAvatar(child: Icon(icon)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_left),
      onTap: () {},
    ),
  );
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});
  @override
  Widget build(BuildContext context) => const _CenterMessage(icon: Icons.quiz, title: 'آزمون روزانه', text: 'آزمون‌های تألیفی و آزمونی را از این بخش شروع کنید.');
}

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});
  @override
  Widget build(BuildContext context) => const _CenterMessage(icon: Icons.refresh, title: 'مرور هوشمند', text: 'مرورهای ۱، ۳، ۷، ۱۴، ۳۰ و ۶۰ روزه در این بخش قرار می‌گیرند.');
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => const _CenterMessage(icon: Icons.person, title: 'پروفایل', text: 'پیشرفت مطالعه و وضعیت یادگیری شما در اینجا نمایش داده می‌شود.');
}

class _CenterMessage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  const _CenterMessage({required this.icon, required this.title, required this.text});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 72, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 16),
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(text, textAlign: TextAlign.center),
      ]),
    ),
  );
}
