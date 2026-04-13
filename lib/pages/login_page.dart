import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_primeiro_app/pages/registrar_page.dart';

class MinhaLoginPage extends StatefulWidget {
  MinhaLoginPage({super.key});

  @override
  State<MinhaLoginPage> createState() => _MinhaLoginPageState();
}

class _MinhaLoginPageState extends State<MinhaLoginPage> {
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailControler = new TextEditingController();
  TextEditingController _senhaControler = new TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 68, 52, 0),
              const Color.fromARGB(255, 236, 185, 17),
              Color.fromARGB(255, 250, 176, 79),
              const Color.fromARGB(255, 255, 136, 0),
            ],
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 243, 243),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/imgs/logolansutech.png",
                        height: 100.0,
                        width: 100.0,
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _emailControler,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 119, 119, 119),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: const Color.fromARGB(255, 255, 154, 72)),
                          ),
                          labelText: "E-mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.user,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _emailControler.clear();
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.xmark,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "Informe o e-mail";
                          } else if(!value.contains('@')) {
                            return "Informe um e-mail válido!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _senhaControler,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 119, 119, 119),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: const Color.fromARGB(255, 255, 154, 72)),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.lock),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                 _obscureText = !_obscureText;   
                              });
                            }, 
                          icon: FaIcon(_obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye))
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "Informe a senha";
                          } else if(value.length < 6) {
                            return "A senha deve conter mais de 5 digitos!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => RegistrarUsuario()));
                            },
                            child: Text(
                              "Não Possuí Cadastro? Clique Aqui!",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        height: 40.0,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if(_formKey.currentState!.validate()) {
                              print("Logado com Sucesso!");
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Verifiqe o formulário!"), 
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 4),));
                            }
                          },
                          label: Text("Logar"),
                          icon: Icon(Icons.login),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}