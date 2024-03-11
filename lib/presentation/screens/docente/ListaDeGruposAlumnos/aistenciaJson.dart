//     final asistenciaAlumnos = asistenciaAlumnosFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<AsistenciaAlumnos> asistenciaAlumnosFromJson(String str) => List<AsistenciaAlumnos>.from(json.decode(str).map((x) => AsistenciaAlumnos.fromJson(x)));

String asistenciaAlumnosToJson(List<AsistenciaAlumnos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AsistenciaAlumnos {
    final String id;
    final String nombre;
    final String appaterno;
    final String apmaterno;
    final String nombretutor;
    final String apptutor;
    final String apmtutor;
    final String telefono;
    final String telefonoopcional;
    final String matricula;
    final String nia;
    final String idGrupo;
    final String idSemestre;

    AsistenciaAlumnos({
        required this.id,
        required this.nombre,
        required this.appaterno,
        required this.apmaterno,
        required this.nombretutor,
        required this.apptutor,
        required this.apmtutor,
        required this.telefono,
        required this.telefonoopcional,
        required this.matricula,
        required this.nia,
        required this.idGrupo,
        required this.idSemestre,
    });

    AsistenciaAlumnos copyWith({
        String? id,
        String? nombre,
        String? appaterno,
        String? apmaterno,
        String? nombretutor,
        String? apptutor,
        String? apmtutor,
        String? telefono,
        String? telefonoopcional,
        String? matricula,
        String? nia,
        String? idGrupo,
        String? idSemestre,
    }) => 
        AsistenciaAlumnos(
            id: id ?? this.id,
            nombre: nombre ?? this.nombre,
            appaterno: appaterno ?? this.appaterno,
            apmaterno: apmaterno ?? this.apmaterno,
            nombretutor: nombretutor ?? this.nombretutor,
            apptutor: apptutor ?? this.apptutor,
            apmtutor: apmtutor ?? this.apmtutor,
            telefono: telefono ?? this.telefono,
            telefonoopcional: telefonoopcional ?? this.telefonoopcional,
            matricula: matricula ?? this.matricula,
            nia: nia ?? this.nia,
            idGrupo: idGrupo ?? this.idGrupo,
            idSemestre: idSemestre ?? this.idSemestre,
        );

    factory AsistenciaAlumnos.fromJson(Map<String, dynamic> json) => AsistenciaAlumnos(
        id: json["id"],
        nombre: json["nombre"],
        appaterno: json["appaterno"],
        apmaterno: json["apmaterno"],
        nombretutor: json["nombretutor"],
        apptutor: json["apptutor"],
        apmtutor: json["apmtutor"],
        telefono: json["telefono"],
        telefonoopcional: json["telefonoopcional"],
        matricula: json["matricula"],
        nia: json["nia"],
        idGrupo: json["id_grupo"],
        idSemestre: json["id_semestre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "appaterno": appaterno,
        "apmaterno": apmaterno,
        "nombretutor": nombretutor,
        "apptutor": apptutor,
        "apmtutor": apmtutor,
        "telefono": telefono,
        "telefonoopcional": telefonoopcional,
        "matricula": matricula,
        "nia": nia,
        "id_grupo": idGrupo,
        "id_semestre": idSemestre,
    };
}
