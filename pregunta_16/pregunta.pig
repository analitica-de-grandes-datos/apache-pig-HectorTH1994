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
   WHERE color = 'blue' OR firstname LIKE 'K%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<< 
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
resultado= FOREACH datos GENERATE nombre as f0, REGEX_EXTRACT(nombre,  '^[K](.*)',0) as f1, color as f2;
resultado2 = FILTER resultado BY  f1 is not null OR f2 == 'blue';
resultado3= FOREACH resultado2 GENERATE f0,f2;
STORE resultado3 INTO 'output' USING PigStorage(',') ;


