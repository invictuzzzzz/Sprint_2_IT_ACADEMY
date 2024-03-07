--  Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select apellido1, apellido2 from persona where tipo = "alumno" order by  apellido1, apellido2, nombre;
-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select nombre, apellido1, apellido2 from persona where tipo = "alumno" and telefono is null;
-- Retorna el llistat dels alumnes que van néixer en 1999.
select * from persona where tipo = "alumno" and year(fecha_nacimiento) = 1999;
-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
select * from persona where tipo = "profesor" and telefono is null and nif like "%k";
-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select nombre from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;
-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
select persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre from profesor inner join persona on profesor.id_profesor = persona.id inner join departamento on departamento.id = profesor.id_departamento order by  persona.apellido1, persona.apellido2, persona.nombre;
-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
select persona.nombre as "Nombre alumno", asignatura.nombre as "Asignatura", curso_escolar.anyo_inicio, curso_escolar.anyo_fin from persona inner join alumno_se_matricula_asignatura on alumno_se_matricula_asignatura.id_alumno = persona.id inner join asignatura on asignatura.id = alumno_se_matricula_asignatura.id_asignatura inner join curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar and nif = "26902806M";
-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
select departamento.nombre from departamento inner join profesor on departamento.id = profesor.id_departamento inner join asignatura on asignatura.id_profesor = profesor.id_profesor inner join grado on asignatura.id_grado = grado.id where grado.nombre = "Grado en Ingeniería Informática (Plan 2015)";
-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
select persona.nombre, persona.apellido1, persona.apellido2, asignatura.nombre from persona inner join alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno inner join asignatura on asignatura.id = alumno_se_matricula_asignatura.id_asignatura inner join curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar where curso_escolar.anyo_inicio = 2018 and curso_escolar.anyo_fin = 2019;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
select departamento.nombre as "Nombre Departamento", persona.apellido1, persona.apellido2, persona.nombre from persona left join profesor on profesor.id_profesor = persona.id left join departamento on departamento.id = profesor.id_departamento order by departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
-- Retorna un llistat amb els professors/es que no estan associats a un departament.
select persona.nombre, persona.apellido1 from persona right join profesor on profesor.id_profesor = persona.id right join departamento on departamento.id = profesor.id_departamento where persona.tipo = "profesor" and profesor.id_departamento is null;
-- Retorna un llistat amb els departaments que no tenen professors/es associats.
select departamento.nombre from departamento left join profesor on profesor.id_departamento = departamento.id where profesor.id_departamento is null;
-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
select persona.nombre, persona.apellido1 from persona left join profesor on persona.id = profesor.id_profesor left join asignatura on profesor.id_profesor = asignatura.id_profesor where persona.tipo = "profesor" and asignatura.nombre is null;
-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
select asignatura.nombre from asignatura left join profesor on asignatura.id_profesor = profesor.id_profesor where asignatura.id_profesor is null;
-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
select distinct departamento.nombre from departamento left join profesor on departamento.id = profesor.id_departamento left join asignatura on profesor.id_profesor = asignatura.id_profesor where asignatura.nombre is null;
-- Consultes resum:
--
-- Retorna el nombre total d'alumnes que hi ha.
select count(tipo) as "Total Alumnos" from persona where tipo = "alumno";
-- Calcula quants alumnes van néixer en 1999.
select count(tipo) as "Total alumnos en 1999" from persona where year(fecha_nacimiento) = 1999;
-- Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
select departamento.nombre as "Nombre Departamento", count(profesor.id_profesor) as "Numero profesores" from departamento inner join profesor on departamento.id = profesor.id_departamento group by departamento.nombre order by count(profesor.id_profesor) desc;
-- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
select departamento.nombre as "Nombre Departamento", count(profesor.id_profesor) as "Numero profesores" from departamento left join profesor on departamento.id = profesor.id_departamento group by departamento.nombre;
-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
select grado.nombre as "Nombre grado", count(asignatura.id_grado) as "Numero asignaturas" from grado left join asignatura on grado.id = asignatura.id_grado group by grado.nombre order by count(asignatura.id_grado) desc;
-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
select grado.nombre as "Nombre grado", count(asignatura.id_grado) as "Numero asignaturas" from grado left join asignatura on grado.id = asignatura.id_grado group by grado.nombre having count(asignatura.id_grado) > 40;
-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
select grado.nombre as "Nombre grado", asignatura.tipo, sum(asignatura.creditos) from grado inner join asignatura on grado.id = asignatura.id_grado group by grado.nombre, asignatura.tipo;
-- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
select curso_escolar.anyo_inicio as "Inicio curso", count(alumno_se_matricula_asignatura.id_alumno) as "Numero alumnos" from curso_escolar inner join alumno_se_matricula_asignatura on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar group by curso_escolar.anyo_inicio;
-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
select distinct persona.id, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id) from persona left join profesor on persona.id = profesor.id_profesor left join asignatura on profesor.id_profesor = asignatura.id_profesor group by persona.id, asignatura.nombre;
-- Retorna totes les dades de l'alumne/a més jove.
select * from persona where persona.fecha_nacimiento order by (persona.fecha_nacimiento)desc limit 1;
-- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
select persona.* from persona left join profesor on persona.id = profesor.id_profesor left join asignatura on profesor.id_profesor = asignatura.id_profesor where persona.tipo = "profesor" and asignatura.id_profesor is null;

