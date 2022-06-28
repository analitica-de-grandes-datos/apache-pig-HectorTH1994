/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

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
            fecha_nacimiento:chararray,
            color,chararray,
            numero2:int
            );
resultado= FOREACH datos GENERATE nombre as f2;

--resultado2 = FILTER resultado BY  SUBSTRING(f2, 0,1) > 'm' or SUBSTRING(f2, 0,1) == 'm';

resultado2 = FOREACH resultado GENERATE f2, SUBSTRING(f2, 0,1) as f3;

resultado3 =  FILTER resultado2 BY (f3 MATCHES '.*[M-Z]');

resultado4 = FOREACH resultado3 GENERATE f2;

STORE resultado4 INTO 'output' USING PigStorage(',') ;
