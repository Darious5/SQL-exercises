/*EJ1*/
select pais,capital from paises;
/*EJ2*/
select top 10 pais,capital from paises;
/*EJ3*/
select capital from paises where pais='estonia';
/*EJ4*/
select capital from paises where pais IN ('LITUANIA','CROACIA','DINAMARCA');
/*EJ5*/
select pais from Paises where Lengua='Catalán';
/*EJ6*/
select pais from Paises where Religion='Musulmana';
/*EJ7*/
select pais from Paises where Religion='Católica' and Continente='Europa';
/*EJ8*/
select pais from Paises where Lengua='inglés' or Lengua='neerlandés';
/*EJ9*/
select pais from Paises where Lengua='inglés' and not (Religion='protestante');
/*EJ10*/
select distinct moneda from Paises where Continente='Europa';
/*EJ11*/
select distinct moneda from Paises where Continente='América' and Lengua='Español'
/*EJ12*/
select distinct moneda from Paises where Continente='africa' and Lengua !='ingles'
/*EJ13*/
SELECT Pais FROM Paises WHERE Capital LIKE 'B%'
/*EJ14*/
SELECT Pais FROM Paises WHERE Pais NOT LIKE '%IA'
/*EJ15*/
SELECT Pais FROM Paises WHERE PNBCapita>20000
/*EJ16*/
SELECT Pais FROM Paises WHERE PNBCapita>10000 and PNBCapita<20000
/*EJ17*/
SELECT Pais FROM Paises WHERE RELIGION!='MUSULMANA' AND RELIGION!='CATÓLICA' AND Religion!='PROTESTANTE'
/*EJ18*/
SELECT Pais FROM Paises WHERE Poblacion/Superficie<100
/*EJ19*/
SELECT Pais,Poblacion/SUPERFICIE AS Densidad FROM Paises WHERE Poblacion/Superficie<100 ORDER BY Poblacion/Superficie
/*EJ20*/
SELECT PAIS,ROUND(Poblacion/SUPERFICIE,2) FROM Paises
/*EJ21*/
SELECT Pais FROM Paises WHERE 10000<PNB AND PNB<20000 AND Continente IN ('EUROPA','ASIA')
/*EJ22*/
SELECT Pais FROM Paises WHERE EsperVidaida<50 AND CONTINENTE='AFRICA'
/*EJ23*/
SELECT TOP 10 PAIS FROM Paises ORDER BY SUPERFICIE DESC
/*EJ24*/
SELECT TOP 5 PAIS FROM Paises ORDER BY SUPERFICIE ASC
/*EJ25*/
SELECT Pais,MONEDA FROM Paises where Moneda like'dólar%'
/*EJ26*/
SELECT Pais,MONEDA FROM Paises WHERE Moneda like'FRANCO%'
/*EJ27*/
SELECT Pais,CAPITAL FROM Paises WHERE Capital=PAIS
/*EJ28*/
SELECT Pais,MORTALINFANTIL FROM PAISES WHERE MortalInfantil>100
/*EJ29*/
SELECT COUNT(PAIS) AS 'NUMERO PAISES' FROM Paises WHERE MortalInfantil>100
/*EJ30*/
SELECT TOP 1 Pais FROM Paises ORDER BY Superficie DESC
/*EJ31*/
SELECT TOP 1 Pais FROM Paises ORDER BY POBLACION ASC
/*EJ32*/
SELECT TOP 1 Pais FROM Paises ORDER BY PNB DESC
/*EJ33*/
SELECT SUM(POBLACION) FROM PAISES GROUP BY Continente HAVING CONTINENTE='AFRICA'
/*EJ34*/
SELECT SUM(SUPERFICIE) FROM PAISES WHERE Continente='ASIA'
/*EJ35*/
SELECT CONTINENTE,DISTINCT COUNT(DISTINCT LENGUA) AS "NUMERO DE LENGUAS" FROM PAISES GROUP BY CONTINENTE
/*EJ36*/
SELECT AVG(ESPERVIDAIDA) FROM PAISES
/*EJ37*/
SELECT Pais FROM Paises WHERE EsperVidaida>=(SELECT AVG(ESPERVIDAIDA) FROM PAISES)
/*EJ38*/
SELECT AVG(PNBCAPITA)FROM Paises
/*EJ39*/
SELECT Pais FROM Paises WHERE PNBCapita>=(SELECT AVG(PNBCAPITA)FROM Paises)