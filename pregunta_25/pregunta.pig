/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

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
resultado= FOREACH datos GENERATE REGEX_EXTRACT(fecha_nacimiento,  '-(.*)-',1) as f2;

resultado2 = FILTER resultado BY  f2 is not null;

STORE resultado2 INTO 'output' USING PigStorage(',') ;

