/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos= LOAD 'data.tsv' USING PigStorage('\t') 
        AS ( 
            fila:chararray,
            letras:bag{},
            otras:MAP[]
            );
datos2 =  FOREACH datos GENERATE fila as f1,COUNT_STAR(letras) as f2, SIZE(otras) as f3;
resultado= order datos2 by f1 asc, f2 asc, f3 asc;
STORE resultado INTO 'output' USING PigStorage(',') ;
