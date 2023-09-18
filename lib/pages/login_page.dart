import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController senhaController = TextEditingController(text: "");

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 8,
                    child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Já tem cadastro?",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Faça seu login e make the change_",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center, // Alinhar texto
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),

                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 17),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 118, 17, 120))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 118, 17, 120))),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 118, 17, 120),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: 50,
                child: TextField(
                  obscureText: isObscureText,
                  controller: senhaController,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 17),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 118, 17, 120))),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 118, 17, 120))),
                    hintText: "Senha",
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.lock,
                        color: Color.fromARGB(255, 118, 17, 120)),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color.fromARGB(255, 118, 17, 120),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (emailController.text.trim() == "email@gmail" &&
                          senhaController.text.trim() == "123") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Login efetuado com Sucesso!")));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Erro ao efetuar o Login!")));
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 118, 17, 120))),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                height: 30,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  "Esqueci minha senha",
                  style: TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                width: double.infinity,
                height: 30,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text("Criar conta",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
