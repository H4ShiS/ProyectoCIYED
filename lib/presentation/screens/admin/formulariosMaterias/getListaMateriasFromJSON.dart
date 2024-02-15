// ignore_for_file: file_names

import 'dart:convert';

List<GetMateriaLista> getMateriaListaFromJson(String str) => List<GetMateriaLista>.from(json.decode(str).map((x) => GetMateriaLista.fromJson(x)));

String getMateriaListaToJson(List<GetMateriaLista> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMateriaLista {
    final String id;
    final String nombre;
    final String matricula;
    final String idUsuario;
    final String idSemestre;

    GetMateriaLista({
        required this.id,
        required this.nombre,
        required this.matricula,
        required this.idUsuario,
        required this.idSemestre,
    });

    GetMateriaLista copyWith({
        String? id,
        String? nombre,
        String? matricula,
        String? idUsuario,
        String? idSemestre,
    }) => 
        GetMateriaLista(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            matricula: matricula ?? this.matricula,
            idUsuario: idUsuario ?? this.idUsuario,
            idSemestre: idSemestre ?? this.idSemestre,
        );

    factory GetMateriaLista.fromJson(Map<String, dynamic> json) => GetMateriaLista(
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
