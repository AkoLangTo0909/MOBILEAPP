import 'package:flutter/material.dart';

void main() {
  runApp(const CampusChronicleApp());
}

// ============================================================
// APP
// ============================================================

class CampusChronicleApp extends StatefulWidget {
  const CampusChronicleApp({super.key});

  @override
  State<CampusChronicleApp> createState() => _CampusChronicleAppState();
}

class _CampusChronicleAppState extends State<CampusChronicleApp> {
  ThemeMode themeMode = ThemeMode.dark;

  void changeTheme(bool dark) {
    setState(() {
      themeMode = dark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusChronicle',
      themeMode: themeMode,

      // LIGHT THEME
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD90000),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),

      // DARK THEME
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080D18),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD90000),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),

      home: SignInPage(
        onThemeChanged: changeTheme,
        isDarkMode: themeMode == ThemeMode.dark,
      ),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color redColor = Color(0xFFD90000);
const Color blueColor = Color(0xFF3B82F6);
const Color greenColor = Color(0xFF10B981);
const Color yellowColor = Color(0xFFF59E0B);
const Color purpleColor = Color(0xFF8B5CF6);

// ============================================================
// AUTH DATA
// DEMO ONLY
// ============================================================

String? registeredName;
String? registeredEmail;
String? registeredPassword;

// ============================================================
// HELPER COLORS
// ============================================================

Color backgroundColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF080D18)
      : const Color(0xFFF7F7F7);
}

Color cardColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF121B2C)
      : Colors.white;
}

Color cardColor2(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF172238)
      : const Color(0xFFECECEC);
}

Color textColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFFF5F7FA)
      : const Color(0xFF111111);
}

Color mutedText(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF8D99AE)
      : const Color(0xFF666666);
}

// ============================================================
// AUTH LOGO
// ============================================================

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: dark ? Colors.grey.shade500 : Colors.grey.shade700,
              width: 4,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: dark ? Colors.grey.shade700 : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                'C',
                style: TextStyle(
                  color: redColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Campus Chronicle',
          style: TextStyle(
            color: textColor(context),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'serif',
          ),
        ),
      ],
    );
  }
}

// ============================================================
// AUTH FIELD
// ============================================================

class AuthField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;

  const AuthField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: textColor(context),
            fontSize: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: widget.controller,
          obscureText: obscure,
          keyboardType: widget.keyboardType,
          style: TextStyle(
            color: dark ? Colors.black : Colors.black,
            fontSize: 10,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: Color(0xFF777777),
              fontSize: 9,
            ),
            prefixIcon: const Icon(
              Icons.mail_outline,
              color: Color(0xFF777777),
              size: 16,
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: Icon(
                      obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.black54,
                      size: 15,
                    ),
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// AUTH BUTTON
// ============================================================

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: redColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SOCIAL BUTTON
// ============================================================

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 39,
      child: OutlinedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$text is not connected yet.'),
            ),
          );
        },
        icon: Icon(
          icon,
          color: Colors.black,
          size: 15,
        ),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 9,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// AUTH DIVIDER
// ============================================================

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFF555555),
            thickness: .7,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'OR',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 8,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xFF555555),
            thickness: .7,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// AUTH SCAFFOLD
// ============================================================

class AuthScaffold extends StatelessWidget {
  final Widget child;
  final VoidCallback? onToggleTheme;
  final bool isDarkMode;

  const AuthScaffold({
    super.key,
    required this.child,
    this.onToggleTheme,
    this.isDarkMode = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(context),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 430,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                18,
                20,
                8,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SIGN IN
// ============================================================

class SignInPage extends StatefulWidget {
  final ValueChanged<bool>? onThemeChanged;
  final bool isDarkMode;

  const SignInPage({
    super.key,
    this.onThemeChanged,
    this.isDarkMode = true,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  void signIn() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      message('Please enter your email and password.');
      return;
    }

    if (registeredEmail == null) {
      message('No account found. Please sign up first.');
      return;
    }

    if (email.toLowerCase() !=
            registeredEmail!.toLowerCase() ||
        password != registeredPassword) {
      message('Incorrect email or password.');
      return;
    }

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => MainNavigation(
          onThemeChanged: widget.onThemeChanged,
          isDarkMode: widget.isDarkMode,
        ),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Center(
              child: AuthLogo(),
            ),

            const SizedBox(height: 25),

            AuthField(
              label: 'Email Address',
              hint: 'name@company.com',
              controller: emailController,
              icon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 12),

            AuthField(
              label: 'Password',
              hint: '••••••••',
              controller: passwordController,
              icon: Icons.lock_outline,
              obscureText: true,
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ForgotPasswordPage(
                        onThemeChanged: widget.onThemeChanged,
                        isDarkMode: widget.isDarkMode,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: redColor,
                    fontSize: 8,
                  ),
                ),
              ),
            ),

            AuthButton(
              text: 'Sign In',
              onPressed: signIn,
            ),

            const SizedBox(height: 13),

            const AuthDivider(),

            const SizedBox(height: 13),

            const SocialButton(
              text: 'Continue with Google',
              icon: Icons.g_mobiledata,
            ),

            const SizedBox(height: 8),

            const SocialButton(
              text: 'Continue with Apple',
              icon: Icons.apple,
            ),

            const SizedBox(height: 45),

            Center(
              child: Wrap(
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: textColor(context),
                      fontSize: 8,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignUpPage(
                            onThemeChanged: widget.onThemeChanged,
                            isDarkMode: widget.isDarkMode,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: redColor,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SIGN UP
// ============================================================

class SignUpPage extends StatefulWidget {
  final ValueChanged<bool>? onThemeChanged;
  final bool isDarkMode;

  const SignUpPage({
    super.key,
    this.onThemeChanged,
    this.isDarkMode = true,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool agreed = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  void createAccount() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      message('Please complete all fields.');
      return;
    }

    if (!email.contains('@') ||
        !email.contains('.')) {
      message('Please enter a valid email.');
      return;
    }

    if (password.length < 8) {
      message('Password must contain at least 8 characters.');
      return;
    }

    if (!agreed) {
      message(
        'Please agree to the Terms of Service and Privacy Policy.',
      );
      return;
    }

    registeredName = name;
    registeredEmail = email;
    registeredPassword = password;

    message('Account created successfully.');

    Future.delayed(
      const Duration(milliseconds: 700),
      () {
        if (!mounted) return;

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => SignInPage(
              onThemeChanged: widget.onThemeChanged,
              isDarkMode: widget.isDarkMode,
            ),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),

            Text(
              'Create your account',
              style: TextStyle(
                color: textColor(context),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 17),

            AuthField(
              label: 'Full Name',
              hint: 'Juan Dela Cruz',
              controller: nameController,
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 12),

            AuthField(
              label: 'Email Address',
              hint: 'name@company.com',
              controller: emailController,
              icon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 12),

            AuthField(
              label: 'Password',
              hint: 'Minimum 8 characters',
              controller: passwordController,
              icon: Icons.lock_outline,
              obscureText: true,
            ),

            const SizedBox(height: 8),

            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: agreed,
                  onChanged: (value) {
                    setState(() {
                      agreed = value ?? false;
                    });
                  },
                  activeColor: redColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      'I agree to the Terms of Service and Privacy Policy.',
                      style: TextStyle(
                        color: mutedText(context),
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            AuthButton(
              text: 'Create Account',
              onPressed: createAccount,
            ),

            const SizedBox(height: 35),

            const SocialButton(
              text: 'Continue with Google',
              icon: Icons.g_mobiledata,
            ),

            const SizedBox(height: 8),

            const SocialButton(
              text: 'Continue with Apple',
              icon: Icons.apple,
            ),

            const SizedBox(height: 35),

            Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  'Already have an account? Log in',
                  style: TextStyle(
                    color: redColor,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// FORGOT PASSWORD
// ============================================================

class ForgotPasswordPage extends StatefulWidget {
  final ValueChanged<bool>? onThemeChanged;
  final bool isDarkMode;

  const ForgotPasswordPage({
    super.key,
    this.onThemeChanged,
    this.isDarkMode = true,
  });

  @override
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void resetPassword() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email.'),
        ),
      );
      return;
    }

    if (registeredEmail == null ||
        email.toLowerCase() !=
            registeredEmail!.toLowerCase()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No account is registered with that email.',
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Reset link sent to $email.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                size: 14,
                color: textColor(context),
              ),
              label: Text(
                'Back to Log In',
                style: TextStyle(
                  color: textColor(context),
                  fontSize: 8,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Center(
              child: Icon(
                Icons.key_outlined,
                color: redColor,
                size: 45,
              ),
            ),

            const SizedBox(height: 15),

            Center(
              child: Text(
                'Reset password',
                style: TextStyle(
                  color: textColor(context),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Center(
              child: Text(
                'Enter your registered email below.',
                style: TextStyle(
                  color: mutedText(context),
                  fontSize: 8,
                ),
              ),
            ),

            const SizedBox(height: 20),

            AuthField(
              label: 'Email Address',
              hint: 'name@company.com',
              controller: emailController,
              icon: Icons.mail_outline,
              keyboardType:
                  TextInputType.emailAddress,
            ),

            const SizedBox(height: 15),

            AuthButton(
              text: 'Send Reset Link',
              onPressed: resetPassword,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// MAIN NAVIGATION
// ============================================================

class MainNavigation extends StatefulWidget {
  final ValueChanged<bool>? onThemeChanged;
  final bool isDarkMode;

  const MainNavigation({
    super.key,
    this.onThemeChanged,
    this.isDarkMode = true,
  });

  @override
  State<MainNavigation> createState() =>
      _MainNavigationState();
}

class _MainNavigationState
    extends State<MainNavigation> {
  int currentIndex = 0;

  Widget pageForIndex(int index) {
    switch (index) {
      case 0:
        return const HomePage();

      case 1:
        return const EventsPage();

      case 2:
        return const CreatePostPage();

      case 3:
        return const AdminPage();

      case 4:
        return ProfilePage(
          onThemeChanged: widget.onThemeChanged,
          isDarkMode: widget.isDarkMode,
        );

      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageForIndex(currentIndex),
      bottomNavigationBar:
          BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: cardColor(context),
        selectedItemColor: redColor,
        unselectedItemColor:
            mutedText(context),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
            activeIcon: Icon(
              Icons.calendar_month,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
            ),
            activeIcon: Icon(Icons.add_circle),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.admin_panel_settings_outlined,
            ),
            activeIcon: Icon(
              Icons.admin_panel_settings,
            ),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// TOP HEADER
// ============================================================

class TopHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showBack;

  const TopHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        18,
        18,
        18,
        15,
      ),
      child: Row(
        children: [
          if (showBack)
            IconButton(
              onPressed: () =>
                  Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: textColor(context),
                size: 20,
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor(context),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: mutedText(context),
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CATEGORY CARD
// ============================================================

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor(context),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(.12),
                  borderRadius:
                      BorderRadius.circular(9),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor(context),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: mutedText(context),
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: mutedText(context),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// HOME
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const TopHeader(
                title: 'CampusChronicle',
                subtitle:
                    'Your campus community',
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.all(18),
                      decoration:
                          BoxDecoration(
                        color: cardColor(context),
                        borderRadius:
                            BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          const Icon(
                            Icons.campaign,
                            color: redColor,
                            size: 25,
                          ),
                          const SizedBox(
                              height: 10),
                          Text(
                            'Campus Updates',
                            style: TextStyle(
                              color:
                                  textColor(
                                      context),
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                              height: 5),
                          Text(
                            'Stay updated with the latest news, events, stories, and announcements from your campus.',
                            style: TextStyle(
                              color:
                                  mutedText(
                                      context),
                              fontSize: 10,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      'Latest Stories',
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 14,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    StoryCard(
                      title:
                          'My Experience at the College Hackathon',
                      category: 'Stories',
                      author: 'Student',
                    ),

                    StoryCard(
                      title:
                          'New Campus Technology Center Opens',
                      category: 'News',
                      author: 'CampusChronicle',
                    ),

                    StoryCard(
                      title:
                          'Student Organization Fair',
                      category: 'Events',
                      author: 'Student Affairs',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// STORY CARD
// ============================================================

class StoryCard extends StatelessWidget {
  final String title;
  final String category;
  final String author;

  const StoryCard({
    super.key,
    required this.title,
    required this.category,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor(context),
      elevation: 0,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  StoryDetailPage(
                title: title,
                category: category,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 65,
                decoration: BoxDecoration(
                  color: cardColor2(context),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.article_outlined,
                  color:
                      mutedText(context),
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        color: redColor,
                        fontSize: 8,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      title,
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 11,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      author,
                      style: TextStyle(
                        color:
                            mutedText(context),
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// EVENTS
// ============================================================

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopHeader(
                title: 'Events',
                subtitle:
                    'Upcoming campus events',
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  children: const [
                    EventCard(
                      title:
                          'Student Organization Fair',
                      date: 'October 10',
                      location:
                          'Main Campus',
                    ),
                    EventCard(
                      title:
                          'College Hackathon',
                      date: 'October 15',
                      location:
                          'Technology Center',
                    ),
                    EventCard(
                      title:
                          'Campus Sports Festival',
                      date: 'October 20',
                      location:
                          'University Gym',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// EVENT CARD
// ============================================================

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor(context),
      elevation: 0,
      margin:
          const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color:
                    redColor.withOpacity(.12),
                borderRadius:
                    BorderRadius.circular(9),
              ),
              child: const Icon(
                Icons.event,
                color: redColor,
                size: 25,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color:
                          textColor(context),
                      fontSize: 12,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: const TextStyle(
                      color: redColor,
                      fontSize: 9,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    location,
                    style: TextStyle(
                      color:
                          mutedText(context),
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// CREATE POST
// ============================================================

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() =>
      _CreatePostPageState();
}

class _CreatePostPageState
    extends State<CreatePostPage> {
  String category = 'News';

  final titleController =
      TextEditingController();

  final contentController =
      TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void publish() {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'Post submitted successfully!',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopHeader(
                title: 'Create Post',
                subtitle:
                    'Share with your community',
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Category',
                      style: TextStyle(
                        color:
                            mutedText(context),
                        fontSize: 9,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      decoration:
                          BoxDecoration(
                        color:
                            cardColor(context),
                        borderRadius:
                            BorderRadius.circular(
                          7,
                        ),
                      ),
                      child:
                          DropdownButtonHideUnderline(
                        child:
                            DropdownButton<String>(
                          value: category,
                          isExpanded: true,
                          dropdownColor:
                              cardColor2(
                                  context),
                          style: TextStyle(
                            color:
                                textColor(
                                    context),
                            fontSize: 11,
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'News',
                              child:
                                  Text('News'),
                            ),
                            DropdownMenuItem(
                              value: 'Events',
                              child:
                                  Text('Events'),
                            ),
                            DropdownMenuItem(
                              value: 'Stories',
                              child:
                                  Text('Stories'),
                            ),
                            DropdownMenuItem(
                              value:
                                  'Achievements',
                              child: Text(
                                  'Achievements'),
                            ),
                          ],
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }

                            setState(() {
                              category = value;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      height: 110,
                      width: double.infinity,
                      decoration:
                          BoxDecoration(
                        color:
                            cardColor(context),
                        borderRadius:
                            BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            color:
                                mutedText(
                                    context),
                            size: 32,
                          ),
                          const SizedBox(
                              height: 6),
                          Text(
                            'Add Image',
                            style: TextStyle(
                              color:
                                  mutedText(
                                      context),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Title',
                      style: TextStyle(
                        color:
                            mutedText(context),
                        fontSize: 9,
                      ),
                    ),

                    const SizedBox(height: 5),

                    TextField(
                      controller:
                          titleController,
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 11,
                      ),
                      decoration:
                          InputDecoration(
                        hintText:
                            'Give your post a catchy title',
                        hintStyle: TextStyle(
                          color:
                              mutedText(
                                  context),
                          fontSize: 10,
                        ),
                        filled: true,
                        fillColor:
                            cardColor(context),
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      7),
                          borderSide:
                              BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Content',
                      style: TextStyle(
                        color:
                            mutedText(context),
                        fontSize: 9,
                      ),
                    ),

                    const SizedBox(height: 5),

                    TextField(
                      controller:
                          contentController,
                      maxLines: 7,
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 11,
                      ),
                      decoration:
                          InputDecoration(
                        hintText:
                            'Write your news, story, event details, or announcement...',
                        hintStyle: TextStyle(
                          color:
                              mutedText(
                                  context),
                          fontSize: 10,
                        ),
                        filled: true,
                        fillColor:
                            cardColor(context),
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      7),
                          borderSide:
                              BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: publish,
                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              redColor,
                          foregroundColor:
                              Colors.white,
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        7),
                          ),
                        ),
                        child: const Text(
                          'Publish Post',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// ADMIN
// ============================================================

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopHeader(
                title: 'Admin',
                subtitle:
                    'Manage campus content',
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  children: [
                    ModerationCard(
                      title:
                          'College Hackathon Experience',
                      author:
                          'Student User',
                    ),
                    ModerationCard(
                      title:
                          'Upcoming Campus Event',
                      author:
                          'Campus Organization',
                    ),
                    ModerationCard(
                      title:
                          'New Technology Center',
                      author:
                          'Campus Admin',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MODERATION CARD
// ============================================================

class ModerationCard extends StatelessWidget {
  final String title;
  final String author;

  const ModerationCard({
    super.key,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor(context),
      elevation: 0,
      margin:
          const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor(context),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Submitted by $author',
              style: TextStyle(
                color:
                    mutedText(context),
                fontSize: 9,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(
                              context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Post rejected.',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Reject',
                      style: TextStyle(
                        color: redColor,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(
                              context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Post approved.',
                          ),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          greenColor,
                    ),
                    child: const Text(
                      'Approve',
                      style: TextStyle(
                        fontSize: 9,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PROFILE
// ============================================================

class ProfilePage extends StatelessWidget {
  final ValueChanged<bool>? onThemeChanged;
  final bool isDarkMode;

  const ProfilePage({
    super.key,
    this.onThemeChanged,
    this.isDarkMode = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopHeader(
                title: 'Profile',
                subtitle:
                    'Your CampusChronicle account',
              ),

              const SizedBox(height: 10),

              CircleAvatar(
                radius: 42,
                backgroundColor:
                    cardColor2(context),
                child: Icon(
                  Icons.person,
                  size: 42,
                  color:
                      mutedText(context),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                registeredName ??
                    'Juan Dela Cruz',
                style: TextStyle(
                  color:
                      textColor(context),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'Student • CampusChronicle',
                style: TextStyle(
                  color:
                      mutedText(context),
                  fontSize: 10,
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  children: [
                    CategoryCard(
                      icon:
                          Icons.settings_outlined,
                      title:
                          'Account Settings',
                      subtitle:
                          'Manage your account and appearance',
                      iconColor: blueColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                SettingsPage(
                              isDarkMode:
                                  widget.isDarkMode,
                              onThemeChanged:
                                  widget
                                      .onThemeChanged,
                            ),
                          ),
                        );
                      },
                    ),

                    CategoryCard(
                      icon:
                          Icons.bookmark_outline,
                      title:
                          'Saved Stories',
                      subtitle:
                          'Your saved campus stories',
                      iconColor: purpleColor,
                      onTap: () {
                        ScaffoldMessenger.of(
                                context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Saved Stories opened.',
                            ),
                          ),
                        );
                      },
                    ),

                    CategoryCard(
                      icon:
                          Icons.notifications_none,
                      title:
                          'Notifications',
                      subtitle:
                          'Manage notifications',
                      iconColor: yellowColor,
                    ),

                    CategoryCard(
                      icon: Icons.logout,
                      title: 'Log Out',
                      subtitle:
                          'Sign out of your account',
                      iconColor: redColor,
                      onTap: () {
                        Navigator.of(context)
                            .pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) =>
                                SignInPage(
                              onThemeChanged: widget
                                  .onThemeChanged,
                              isDarkMode:
                                  widget.isDarkMode,
                            ),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SETTINGS
// ============================================================

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool>? onThemeChanged;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    this.onThemeChanged,
  });

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState
    extends State<SettingsPage> {
  late bool darkMode;

  @override
  void initState() {
    super.initState();
    darkMode = widget.isDarkMode;
  }

  void toggleTheme(bool value) {
    setState(() {
      darkMode = value;
    });

    widget.onThemeChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              const TopHeader(
                title: 'Settings',
                subtitle:
                    'Customize your CampusChronicle experience',
                showBack: true,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appearance',
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 14,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration:
                          BoxDecoration(
                        color:
                            cardColor(context),
                        borderRadius:
                            BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration:
                                BoxDecoration(
                              color: redColor
                                  .withOpacity(
                                      .12),
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                9,
                              ),
                            ),
                            child: Icon(
                              darkMode
                                  ? Icons
                                      .dark_mode_outlined
                                  : Icons
                                      .light_mode_outlined,
                              color: redColor,
                              size: 20,
                            ),
                          ),

                          const SizedBox(
                              width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                Text(
                                  'Dark Mode',
                                  style:
                                      TextStyle(
                                    color:
                                        textColor(
                                            context),
                                    fontSize: 12,
                                    fontWeight:
                                        FontWeight
                                            .w600,
                                  ),
                                ),
                                const SizedBox(
                                    height: 3),
                                Text(
                                  darkMode
                                      ? 'Use the dark CampusChronicle theme'
                                      : 'Use the clean white light theme',
                                  style:
                                      TextStyle(
                                    color:
                                        mutedText(
                                            context),
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Switch(
                            value: darkMode,
                            activeColor:
                                redColor,
                            onChanged:
                                toggleTheme,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      padding:
                          const EdgeInsets.all(
                        13,
                      ),
                      decoration:
                          BoxDecoration(
                        color:
                            cardColor(context),
                        borderRadius:
                            BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color:
                                mutedText(
                                    context),
                            size: 17,
                          ),
                          const SizedBox(
                              width: 10),
                          Expanded(
                            child: Text(
                              'Your theme applies across the entire CampusChronicle app.',
                              style: TextStyle(
                                color:
                                    mutedText(
                                        context),
                                fontSize: 9,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    Text(
                      'Account',
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 14,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    CategoryCard(
                      icon:
                          Icons.lock_outline,
                      title:
                          'Password & Security',
                      subtitle:
                          'Manage your password and account security',
                      iconColor: blueColor,
                    ),

                    CategoryCard(
                      icon:
                          Icons.notifications_none,
                      title:
                          'Notifications',
                      subtitle:
                          'Choose what notifications you receive',
                      iconColor: yellowColor,
                    ),

                    CategoryCard(
                      icon:
                          Icons.privacy_tip_outlined,
                      title: 'Privacy',
                      subtitle:
                          'Manage your privacy preferences',
                      iconColor: purpleColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// STORY DETAIL
// ============================================================

class StoryDetailPage extends StatelessWidget {
  final String title;
  final String category;

  const StoryDetailPage({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              TopHeader(
                title: 'Story Detail',
                subtitle:
                    '$category • Student',
                showBack: true,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'CampusChronicle Student',
                      style: TextStyle(
                        color:
                            mutedText(context),
                        fontSize: 9,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      width: double.infinity,
                      height: 190,
                      decoration:
                          BoxDecoration(
                        color:
                            cardColor(context),
                        borderRadius:
                            BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Icons.article,
                        color:
                            mutedText(context),
                        size: 60,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Campus Story',
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 14,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'This is a sample CampusChronicle story. Students can use this section to read campus news, personal experiences, announcements, and other community updates.',
                      style: TextStyle(
                        color:
                            mutedText(context),
                        fontSize: 11,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: redColor,
                          size: 17,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '48 Likes',
                          style: TextStyle(
                            color:
                                mutedText(
                                    context),
                            fontSize: 9,
                          ),
                        ),
                        const SizedBox(
                            width: 18),
                        Icon(
                          Icons
                              .chat_bubble_outline,
                          color:
                              mutedText(context),
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '12 Comments',
                          style: TextStyle(
                            color:
                                mutedText(
                                    context),
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// INSTITUTES
// ============================================================

class InstitutesPage extends StatelessWidget {
  const InstitutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopHeader(
                title: 'Institutes',
                subtitle:
                    'Explore campus departments',
                showBack: true,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  children: [
                    InstituteListCard(
                      title:
                          'Institute of Computing Science',
                      abbreviation: 'ICS',
                      icon:
                          Icons.computer,
                      color: redColor,
                    ),

                    InstituteListCard(
                      title:
                          'Institute of Business',
                      abbreviation: 'IB',
                      icon:
                          Icons.business,
                      color: blueColor,
                    ),

                    InstituteListCard(
                      title:
                          'Institute of Education',
                      abbreviation: 'IE',
                      icon:
                          Icons.school,
                      color: greenColor,
                    ),

                    InstituteListCard(
                      title:
                          'Institute of Engineering',
                      abbreviation: 'IE',
                      icon:
                          Icons.engineering,
                      color: purpleColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// INSTITUTE LIST CARD
// ============================================================

class InstituteListCard
    extends StatelessWidget {
  final String title;
  final String abbreviation;
  final IconData icon;
  final Color color;

  const InstituteListCard({
    super.key,
    required this.title,
    required this.abbreviation,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor(context),
      elevation: 0,
      margin:
          const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  InstituteDetailPage(
                name: title,
                shortName:
                    abbreviation,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 25,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color:
                        textColor(context),
                    fontSize: 11,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color:
                    mutedText(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// INSTITUTE DETAIL
// ============================================================

class InstituteDetailPage
    extends StatelessWidget {
  final String name;
  final String shortName;

  const InstituteDetailPage({
    super.key,
    required this.name,
    required this.shortName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              TopHeader(
                title: shortName,
                subtitle: name,
                showBack: true,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 130,
                      decoration:
                          BoxDecoration(
                        color:
                            cardColor(context),
                        borderRadius:
                            BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Icons.school,
                        size: 55,
                        color:
                            mutedText(context),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      name,
                      style: TextStyle(
                        color:
                            textColor(context),
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Explore programs, activities, events, student organizations, and academic opportunities offered by this institute.',
                      style: TextStyle(
                        color:
                            mutedText(context),
                        fontSize: 10,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 20),

                    CategoryCard(
                      icon:
                          Icons.menu_book_outlined,
                      title: 'Programs',
                      subtitle:
                          'Explore available academic programs',
                      iconColor: blueColor,
                    ),

                    CategoryCard(
                      icon:
                          Icons.event_outlined,
                      title: 'Events',
                      subtitle:
                          'View institute events',
                      iconColor: redColor,
                    ),

                    CategoryCard(
                      icon:
                          Icons.groups_outlined,
                      title:
                          'Organizations',
                      subtitle:
                          'Discover student organizations',
                      iconColor: greenColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}