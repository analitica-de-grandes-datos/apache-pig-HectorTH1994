/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos= LOAD 'data.tsv' USING PigStorage('\t') 
        AS ( 
            fila:chararray,
            letras:chararray,
            otras:MAP[]
            );
datos2 = FOREACH datos GENERATE  FLATTEN(otras) AS word;

grouped = GROUP datos2 BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(datos2);

STORE wordcount INTO 'output' USING PigStorage(',') ;

