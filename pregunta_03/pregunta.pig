/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos= LOAD 'data.tsv'
    AS(
        letra:chararray,
        fecha:chararray,
        numero:int
    );
    
BY_ORDER = ORDER datos BY numero asc;
 
numeros = FOREACH BY_ORDER GENERATE FLATTEN(numero) AS f1:int;



s = limit numeros 5;

DUMP s;

STORE s INTO 'output';
