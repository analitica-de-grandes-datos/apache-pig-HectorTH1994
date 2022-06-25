/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/
datos= LOAD 'data.csv' USING PigStorage(',') 
        AS ( 
              driverId:int,
              truckId:int,
              eventTime:chararray,
              eventType:chararray,
              longitude:float,
              latitude:float,
              eventKey:chararray,
              correlationId:chararray,
              driverName:chararray,
              routeId:chararray,
              routeName:chararray,
              eventDate:chararray
        );

s = limit datos 10;

 
BY_ORDER = FOREACH s GENERATE  driverId as f1, truckId as f2, eventTime as f3;

BY_ORDER2 = ORDER BY_ORDER BY f1 asc, f2 asc, f3 asc;

STORE BY_ORDER2 INTO 'output' USING PigStorage(',') ;
