
import 'package:flutter/material.dart';

void main() {
  runApp(const NeoxAI());
}

const Color bg = Color(0xFF070B18);
const Color panel = Color(0xFF111A30);
const Color blue = Color(0xFF168CFF);
const Color purple = Color(0xFF8B5CFF);

class NeoxAI extends StatelessWidget {
  const NeoxAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEOX AI',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    Dashboard(),
    ChatScreen(),
    ToolsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: panel,
        indicatorColor: blue.withValues(alpha: 0.22),
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.cyanAccent),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'المحادثة',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome),
            label: 'الأدوات',
          ),
        ],
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(22),
      children: [
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [blue, purple],
                ),
              ),
              child: const Icon(
                Icons.smart_toy_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEOX AI',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    'مساعدك الذكي',
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),
            const Icon(Icons.notifications_none, size: 28),
          ],
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF172D60),
                Color(0xFF251448),
                Color(0xFF101629),
              ],
            ),
            border: Border.all(
              color: blue.withValues(alpha: 0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.auto_awesome,
                color: Colors.cyanAccent,
                size: 34,
              ),
              const SizedBox(height: 18),
              const Text(
                'أهلاً بيك في NEOX',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'اكتشف إمكانيات الذكاء الاصطناعي '
                'وساعد نفسك في التعلم والإبداع.',
                style: TextStyle(
                  color: Colors.white70,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.bolt, color: Colors.amber),
                  SizedBox(width: 6),
                  Text('مساعدك في مكان واحد'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'استكشف الأدوات',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: FeatureCard(
                icon: Icons.chat_rounded,
                title: 'محادثة AI',
                subtitle: 'اسأل وتعلّم',
                color: blue,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: FeatureCard(
                icon: Icons.image_rounded,
                title: 'توليد الصور',
                subtitle: 'حوّل أفكارك لصور',
                color: purple,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
              child: FeatureCard(
                icon: Icons.code_rounded,
                title: 'كتابة الأكواد',
                subtitle: 'ساعدني أبرمج',
                color: Color(0xFF00B894),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: FeatureCard(
                icon: Icons.description_rounded,
                title: 'تلخيص النصوص',
                subtitle: 'اختصر وقتك',
                color: Color(0xFFFF9F43),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'جاهز تبدأ؟',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'اختار أداة من الأدوات الموجودة وهنطوّرها خطوة بخطوة.',
          style: TextStyle(color: Colors.white60, height: 1.6),
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: 0.45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();

  final List<String> messages = [
    'أهلاً بيك! أنا واجهة NEOX AI. قريباً هنربط الشات بذكاء اصطناعي حقيقي.',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void sendMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add('أنت: $text');
      controller.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('الشات لسه محتاج ربط بخدمة AI حقيقية.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.smart_toy, color: Colors.cyanAccent, size: 32),
              SizedBox(width: 12),
              Text(
                'NEOX Chat',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: panel,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  messages[index],
                  style: const TextStyle(height: 1.6),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onSubmitted: (_) => sendMessage(),
                  decoration: InputDecoration(
                    hintText: 'اكتب رسالتك هنا...',
                    filled: true,
                    fillColor: panel,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: sendMessage,
                icon: const Icon(Icons.send_rounded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(22),
      children: const [
        Text(
          'أدوات NEOX',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 22),
        FeatureCard(
          icon: Icons.image,
          title: 'توليد الصور',
          subtitle: 'هنضيف إنشاء الصور في المرحلة القادمة.',
          color: purple,
        ),
        SizedBox(height: 14),
        FeatureCard(
          icon: Icons.code,
          title: 'مساعد البرمجة',
          subtitle: 'هنضيف أدوات كتابة الأكواد لاحقاً.',
          color: blue,
        ),
        SizedBox(height: 14),
        FeatureCard(
          icon: Icons.article,
          title: 'تلخيص النصوص',
          subtitle: 'هنضيف التلخيص الذكي لاحقاً.',
          color: Color(0xFFFF9F43),
        ),
      ],
    );
  }
}