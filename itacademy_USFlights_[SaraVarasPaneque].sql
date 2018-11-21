/*Quantitat de registres de la taula de vols*/
SELECT COUNT(*) FROM usairlineflights2.flights;

/*Retard promig de sortida i arribada segons l’aeroport origen*/
SELECT Origin, AVG(ArrDelay), AVG(DepDelay) FROM usairlineflights2.flights GROUP BY Origin;

/* Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen. */
SELECT Origin, colYear, colMonth,  if (AVG(ArrDelay)>=1, 'Retard','En hora')  
FROM usairlineflights2.flights  /*WHERE ArrDelay >=1*/
GROUP BY Origin, colYear, colMonth ORDER BY Origin, colYear, colMonth;

/*Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen 
canviant el codi de l'aeroport pel nom de la ciutat*/
SELECT City, colYear, colMonth, if (AVG(ArrDelay)>=1,'Retard', 'En hora') 
FROM usairlineflights2.flights 
LEFT JOIN usairlineflights2.usairports on usairlineflights2.flights.Origin = 
usairlineflights2.usairports.IATA WHERE ArrDelay >=1
GROUP BY City, colYear, colMonth ORDER BY City, colYear, colMonth;

/*Companyies amb més vols cancelats*/
SELECT Description, COUNT(Cancelled) FROM usairlineflights2.flights
INNER JOIN 	usairlineflights2.carriers on usairlineflights2.flights.UniqueCarrier = 
usairlineflights2.carriers.CarrierCode WHERE Cancelled =1 GROUP BY Description
ORDER BY SUM(Cancelled) DESC;

/*L’identificador dels 10 avions que més distància han recorregut fent vols.*/
SELECT TailNum, SUM(Distance) FROM usairlineflights2.flights WHERE TailNum !='NA' GROUP BY TailNum 
ORDER BY SUM(Distance) DESC LIMIT 10;

/*Companyies amb el seu retard promig només d’aquelles les quals els seus vols 
arriben al seu destí amb un retràs promig major de 10 minuts.*/
SELECT Description, AVG(ArrDelay)
FROM usairlineflights2.flights LEFT JOIN usairlineflights2.carriers on usairlineflights2.flights.UniqueCarrier =
usairlineflights2.carriers.CarrierCode WHERE ArrDelay > 10
GROUP BY Description ORDER BY AVG(ArrDelay) ASC;
