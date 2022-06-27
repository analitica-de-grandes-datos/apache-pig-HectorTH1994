/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos= LOAD 'data.tsv' USING PigStorage('\t') AS (
            fila:chararray,
            letras:bag{},
            otras:MAP[]
    );

words2 = FOREACH datos GENERATE FLATTEN(letras), FLATTEN(otras);
-- agrupa los registros que tienen la misma palabra
words = FOREACH words2 GENERATE TOTUPLE($0,$1) AS word;
grouped = GROUP words BY word;
-- genera una variable que cuenta las ocurrencias por cada grupo
wordcount = FOREACH grouped GENERATE group, COUNT(words);

STORE wordcount INTO 'output' USING PigStorage(',');
