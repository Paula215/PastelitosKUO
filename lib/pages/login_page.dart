import 'package:flutter/material.dart';
import 'package:pastelitos_kuo/widgets/custom_button.dart';
import 'package:pastelitos_kuo/widgets/custom_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              Background(),
              LoginForm(),
            ],
          ),
        ));
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondito.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Logo(),
          const SizedBox(height: 30),
          const _Form(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
        child: ClipRRect(
          child: Image.asset(
            'assets/images/logito.png',
            width: 500,
          ),
        ));
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        child: Text('Bienvenido a Pastelitos Kuo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8B0D32),
              fontSize: 24,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.40),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            CustomField(
              label: 'Email',
              hint: 'Email',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            const SizedBox(height: 30),
            CustomField(
              label: 'Password',
              hint: 'Password',
              icon: Icons.lock,
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: 'Login',
              onPressed: () {
                if (formKey!.currentState!.validate()) {
                  print('Email: ${emailController!.text}');
                  print('Password: ${passwordController!.text}');
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
