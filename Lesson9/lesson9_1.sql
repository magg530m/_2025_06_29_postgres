SELECT count(*) AS "筆數"
FROM "台鐵車站資訊"


SELECT count(name) AS "台北車站數"
FROM "台鐵車站資訊"
WHERE "stationAddrTw" LIKE '%臺北%';

SELECT *
FROM "每日各站進出站人數" LEFT JOIN "台鐵車站資訊" ON "每日各站進出站人數"."車站代碼" =  "台鐵車站資訊"."stationCode"
WHERE "stationName" = '基隆'

/*
 * 全省各站點2022年進站總人數
 */

SELECT "name" AS 站名,COUNT("name") AS 筆數,AVG("進站人數") AS "進站人數"
FROM "每日各站進出站人數" LEFT JOIN "台鐵車站資訊" ON "車站代碼" = "stationCode"
WHERE "日期" BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY "name"


/*
*基隆火車站2020,2021,2022,每年進站人數
*/

SELECT 
    EXTRACT(YEAR FROM "日期"::date) AS 年份,
    SUM("進站人數") AS 年度進站人數總計
FROM "每日各站進出站人數" p
JOIN "台鐵車站資訊" s ON p."車站代碼" = s."stationCode"
WHERE s."stationName" = '基隆'
    AND "日期"::date >= '2020-01-01'
    AND "日期"::date <= '2022-12-31'
GROUP BY EXTRACT(YEAR FROM "日期"::date)
ORDER BY 年份;

/*
*基隆火車站, 台北火車站,2020,2021,2022,每年進站人數
*/

SELECT 
    CASE 
        WHEN "車站代碼" = 900 THEN '基隆'
        WHEN "車站代碼" = 1000 THEN '臺北'
    END AS 車站名稱,
    EXTRACT(YEAR FROM "日期"::date) AS 年份,
    SUM("進站人數") AS 年度進站人數總計
FROM "每日各站進出站人數"
WHERE "車站代碼" IN (900, 1000)
    AND "日期"::date >= '2020-01-01'
    AND "日期"::date <= '2022-12-31'
GROUP BY "車站代碼", EXTRACT(YEAR FROM "日期"::date)
ORDER BY "車站代碼", 年份;
/*
*查詢2022年平均每日進站人數超過2萬人的站點
*/

SELECT 
    s."stationName" AS 車站名稱,
    s."stationCode" AS 車站代碼,
    COUNT(p."日期") AS 營運天數,
    SUM(p."進站人數") AS 年度進站人數總計,
    ROUND(AVG(p."進站人數"), 0) AS 平均每日進站人數
FROM "每日各站進出站人數" p
JOIN "台鐵車站資訊" s ON p."車站代碼" = s."stationCode"
WHERE EXTRACT(YEAR FROM p."日期"::date) = 2022
GROUP BY s."stationCode", s."stationName"
HAVING AVG(p."進站人數") > 20000
ORDER BY 平均每日進站人數 DESC;