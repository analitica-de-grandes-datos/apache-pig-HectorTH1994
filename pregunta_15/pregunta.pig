/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
datos= LOAD 'data.csv' USING PigStorage(',') 
        AS ( 
            numeros:int,
            nombre:chararray,
            apellido:chararray,
            fecha_nacimiento:datetime,
            color,chararray,
            numero2:int
            );
resultado= FOREACH datos GENERATE REGEX_EXTRACT(nombre,  '^[Z](.*)',0) as f1, color as f2;
resultado2 = FILTER resultado BY  f1 is not null and f2 == 'blue';

STORE resultado2 INTO 'output2' USING PigStorage(' ') ;

