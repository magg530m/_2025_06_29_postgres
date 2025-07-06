## 更改日期型別和更新字串成為Date

```sql
ALTER TABLE world 
ALTER COLUMN 日期 TYPE DATE
USING 日期::DATE;
```

```sql
SELECT 洲名,國家,日期,總確診數,總死亡數,新增死亡數
FROM world;
```

SELECT 洲名,總死亡數,
FROM world
WHERE 洲名 = '亞洲';