import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_api_node/connect/models/api_response.dart';
import 'package:flutter_api_node/connect/models/user.dart';
import 'package:flutter_api_node/connect/screens/widgets/simple_button.dart';
import 'package:flutter_api_node/connect/services/user_services.dart';
import 'package:flutter_api_node/connect/utils/utils.dart';

class Register extends StatefulWidget {
    const Register({super.key});

    @override
    State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    bool loading = false;
    TextEditingController? emailController;
    TextEditingController? passwordController;
    TextEditingController? passwordConfirmController;

    void _loginUser() async {
        ApiResponse response = await register(emailController!.text, passwordController!.text);
        if (response.error == null){
            _saveAndRedirectToLogin();
        }
        else {
            setState(() {
                loading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${response.error}')
            ));
        }
    }

    void _saveAndRedirectToLogin() {
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }

    void validateAndSave() {
        final FormState? form = formKey.currentState;
        if (form!.validate()) {
            form.save();
            _loginUser();
            setState(() {
                loading = true;
            });
        }else{
            setState(() {
                loading = false;
            });
        }
    }

    @override
    void initState() {
        emailController = TextEditingController();
        passwordController = TextEditingController();
        passwordConfirmController = TextEditingController();
        super.initState();
    }

    @override
    void dispose() {
        emailController!.dispose();
        passwordController!.dispose();
        super.dispose();
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Utils.backgroundColor,
            body: Form(
                key: formKey,
                child: Center(
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Image.asset(Utils.getImagePath('winedge-logo.png'),width: 200,height: 200,),
                                const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 50),
                                            child: Text("Inscription",
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Utils.black)
                                            ),
                                        ),
                                    ],
                                ),
                                getEmailTextFormField(),
                                getPasswordTextFormField(),
                                getPasswordConfirmField(),
                                loading ? const CircularProgressIndicator(color: Utils.primary) : SimpleButton(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.width * 0.13,
                                    borderRadius: 10,
                                    backgroundColor: Utils.primary,
                                    buttonText: "S'inscrire",
                                    borderColor: Utils.backgroundColor,
                                    textColor: Utils.white,
                                    textFontSize: 16,
                                    onButtonPressed: () {
                                        setState(() {
                                            loading = true;
                                        });
                                        validateAndSave();
                                    },
                                ),
                                const Row(
                                    children: [
                                        Expanded(
                                            child: Padding(
                                                padding: EdgeInsetsDirectional.only(start: 15.0),
                                                child: Divider(
                                                    indent: 20.0,
                                                    endIndent: 5.0,
                                                    thickness: 1,
                                                    color: Colors.black45),
                                            ),
                                        ),
                                        Text(
                                            "Ou",
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 12,
                                                color: Utils.black
                                            )
                                        ),
                                        Expanded(
                                        child: Padding(
                                            padding: EdgeInsetsDirectional.only(end: 15.0),
                                            child: Divider(
                                                indent: 5.0,
                                                endIndent: 20.0,
                                                thickness: 1,
                                                color: Colors.black45),
                                        ),
                                        ),
                                    ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            const Text("Vous avez déjà un compte ? ",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontSize: 15,
                                                    color: Utils.black)),
                                            TextButton(
                                                onPressed: () {
                                                    Navigator.pushNamed(context, '/login');
                                                },
                                                child: const Text("Connexion",
                                                    style: TextStyle(
                                                        decoration: TextDecoration.none,
                                                        fontSize: 15,
                                                        color: Utils.primary)),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            )
        );
    }

    getEmailTextFormField() {
        return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.13,
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    cursorColor: Utils.primary,
                    validator: (val) => val!.isEmpty ? "Entrez un email" : null,
                    style: const TextStyle(color: Utils.black, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined,color: Utils.primary,),
                        hintText: "Adresse email",
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Utils.black),
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                    ),
                ),
            ),
        );
    }

    getPasswordTextFormField() {
        return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.13,
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: passwordController,
                    style: const TextStyle(color: Utils.black, fontWeight: FontWeight.normal),
                    obscureText: true,
                    validator: (val) => val!.isEmpty ? "Entrez le mot de passe" : null,
                    cursorColor: Utils.primary,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline,color: Utils.primary),
                        hintText: "Mot de passe",
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Utils.black),
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                    ),
                ),
            ),
        );
    }

    getPasswordConfirmField() {
        return Padding(
            padding: const EdgeInsetsDirectional.only(top: 15.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.13,
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(color: Utils.black, fontWeight: FontWeight.normal),
                    obscureText: true,
                    controller: passwordConfirmController,
                    cursorColor: Utils.primary,
                    validator: (val) => val != passwordController?.text ? 'Les mots de passe ne correspondent pas' : null,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline,color: Utils.primary,),
                        hintText: "Confirmer le mot de passe",
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Utils.black),
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                    ),
                ),
            ),
        );
    }
}