// To parse this JSON data, do
//
//     final materiasDocente = materiasDocenteFromJson(jsonString);

import 'dart:convert';

List<MateriasDocente> materiasDocenteFromJson(String str) => List<MateriasDocente>.from(json.decode(str).map((x) => MateriasDocente.fromJson(x)));

String materiasDocenteToJson(List<MateriasDocente> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MateriasDocente {
    final String id;
    final String nombre;
    final String matricula;
    final String idUsuario;
    final String idSemestre;

    MateriasDocente({
        required this.id,
        required this.nombre,
        required this.matricula,
        required this.idUsuario,
        required this.idSemestre,
    });

    MateriasDocente copyWith({
        String? id,
        String? nombre,
        String? matricula,
        String? idUsuario,
        String? idSemestre,
    }) => 
        MateriasDocente(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            matricula: matricula ?? this.matricula,
            idUsuario: idUsuario ?? this.idUsuario,
            idSemestre: idSemestre ?? this.idSemestre,
        );

    factory MateriasDocente.fromJson(Map<String, dynamic> json) => MateriasDocente(
        id: json["id"],
        nombre: json["nombre"],
        matricula: json["matricula"],
        idUsuario: json["id_usuario"],
        idSemestre: json["id_semestre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "matricula": matricula,
        "id_usuario": idUsuario,
        "id_semestre": idSemestre,
    };
}
