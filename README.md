# app_ciyed

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.






/*
revision de ese codigo para implementarlo en la validacion de la api
void dispose() {
    _emailController.dispose(); // ¡No olvides liberar recursos!
    super.dispose();
  }

  TextEditingController,
  
*/

#snackbar y un appbar
#manejo de animaciones en el codigo
#crear los semestres en botones
#crear




#para limpiar el textformfield cuando el campo sea valido
onPressed: () {
  if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {
    print("Validacion Exitosa");
    _emailController.clear(); // Limpia el campo
  } else {
    print("Validacion no Exitosa");
  }
},


******************************** Pendientes Importantes

encriptacion de contraseñas pendiente

revision de los ScaffoldMessenger para que cambie e color cuando sea una peticion erronea