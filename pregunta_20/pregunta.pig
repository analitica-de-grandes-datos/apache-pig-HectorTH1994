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
   WHERE 
      color REGEXP '^[^b]';

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
resultado= FOREACH datos GENERATE nombre as f1, REGEX_EXTRACT(color,  '^[^b](.*)',0) as f2;
resultado2 = FILTER resultado BY  f2 is not null;

STORE resultado2 INTO 'output' USING PigStorage(',') ;
