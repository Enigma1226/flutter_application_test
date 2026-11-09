import 'package:flutter/material.dart';

const Color kFbBlue = Color(0xFF1877F2);
const Color kFbBorder = Color(0xFFDADDE1);
const Color kFbGrey = Color(0xFFF0F2F5);

/// Dropdown kecil di bagian atas (mis. "English (US)")
class FbLanguageDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const FbLanguageDropdown({
    super.key,
    this.value = 'English (US)',
    this.items = const ['English (US)', 'Bahasa Indonesia'],
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

/// Logo teks "facebook" berwarna biru
class FbLogoText extends StatelessWidget {
  final String text;
  final double fontSize;

  const FbLogoText({
    super.key,
    this.text = 'facebook',
    this.fontSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: kFbBlue,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        letterSpacing: -1,
      ),
    );
  }
}

/// TextField berbentuk pill dengan border abu-abu
class FbTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;

  const FbTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: kFbBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: kFbBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: kFbBlue, width: 1.5),
        ),
      ),
    );
  }
}

/// Tombol biru utama (Log in)
class FbPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const FbPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kFbBlue,
          disabledBackgroundColor: kFbBlue.withOpacity(0.6),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}

/// Teks link (mis. "Forgot password?")
class FbTextLink extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const FbTextLink({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Tombol abu-abu outline di bagian bawah (Create new account)
class FbSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const FbSecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: kFbGrey,
          foregroundColor: kFbBlue,
          side: const BorderSide(color: Color(0xFFCCE0FF)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

/// Halaman login lengkap yang siap dipakai.
/// Mengirim username & password ke controller lewat callback [onLogin].
class FbLoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onCreateAccount;
  final bool isLoading;

  const FbLoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.onLogin,
    this.onForgotPassword,
    this.onCreateAccount,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.topCenter,
                child: FbLanguageDropdown(),
              ),
              const SizedBox(height: 40),
              const FbLogoText(),
              const SizedBox(height: 32),
              FbTextField(
                controller: usernameController,
                hintText: 'Mobile number or email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              FbTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              FbPrimaryButton(
                text: 'Log in',
                onPressed: onLogin,
                isLoading: isLoading,
              ),
              const SizedBox(height: 16),
              FbTextLink(
                text: 'Forgot password?',
                onTap: onForgotPassword,
              ),
              const SizedBox(height: 120),
              FbSecondaryButton(
                text: 'Create new account',
                onPressed: onCreateAccount,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}