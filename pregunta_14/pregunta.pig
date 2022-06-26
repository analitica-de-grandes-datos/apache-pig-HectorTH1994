/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

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
resultado= FOREACH datos GENERATE REGEX_EXTRACT(color,  '^[a-ac-z](.*)',0) as f1;
resultado2 = FILTER resultado BY  f1 is not null;

STORE resultado2 INTO 'output13' USING PigStorage(',') ;

