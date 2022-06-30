/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

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

words = FOREACH datos GENERATE FLATTEN(letras) AS word;
-- agrupa los registros que tienen la misma palabra
grouped = GROUP words BY word;
-- genera una variable que cuenta las ocurrencias por cada grupo
wordcount = FOREACH grouped GENERATE group, COUNT(words);
STORE wordcount INTO 'output' USING PigStorage(',');
