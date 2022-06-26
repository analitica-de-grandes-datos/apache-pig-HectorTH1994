/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

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
            numoer2:int
            );
resultado= FOREACH datos GENERATE apellido AS F1,SIZE(apellido) AS F2;
resultado2 = ORDER resultado BY F2 DESC, F1 ASC;
resultado3 = LIMIT resultado2 5 ;
STORE resultado3 INTO 'output' USING PigStorage(',') ;
