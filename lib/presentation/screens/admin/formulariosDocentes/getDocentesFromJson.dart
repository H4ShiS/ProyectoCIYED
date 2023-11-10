
import 'dart:convert';

List<GetDocentes> getDocentesFromJson(String str) => List<GetDocentes>.from(json.decode(str).map((x) => GetDocentes.fromJson(x)));

String getDocentesToJson(List<GetDocentes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDocentes {

    final String id;
    final String nombre;
    final String appaterno;
    final String apmaterno;
    final String email;
    final String contrasena;
    final String matricula;
    final String recordatorio;
    

    GetDocentes({

        required this.id,
        required this.nombre,
        required this.appaterno,
        required this.apmaterno,
        required this.email,
        required this.contrasena,
        required this.matricula,
        required this.recordatorio,
        
    });

    factory GetDocentes.fromJson(Map<String, dynamic> json) => GetDocentes(
        id: json["id"],
        nombre: json["nombre"],
        appaterno: json["appaterno"],
        apmaterno: json["apmaterno"],
        email: json["email"],
        contrasena: json["contrasena"],
        matricula: json["matricula"],
        recordatorio: json["recordatorio"],
        
    );

    Map<String, dynamic> toJson() => {
        
        "id": id,
        "nombre": nombre,
        "appaterno": appaterno,
        "apmaterno": apmaterno,
        "email": email,
        "contrasena": contrasena,
        "matricula": matricula,
        "recordatorio": recordatorio,
        
    };
}
