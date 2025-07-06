## 建立資料表的語法

```sql
CREATE TABLE [IF NOT EXISTS] table_name (
   column1 datatype(length) column_constraint,
   column2 datatype(length) column_constraint,
   ...
   table_constraints
);
```
## 建立一個student資料表

```sql
CREATE TABLE IF NOT EXISTS student(
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE
);
```
## 刪除資料表

```
DROP TABLE IF EXISTS student;
```

## 新增一筆資料

```sql
INSERT INTO student (name, major)
VALUES ('呂育君', '歷史');
```

## 新增多筆資料

```sql
INSERT INTO student (name, major)
VALUES ('小柱', '生物'),('信忠','英語');
```

```sql
SELECT student_id, name, major
From student;
```

```sql
SELECT *
From student
WHERE name='信忠';

```
## 顯示全部資料由大到小

```sql
SELECT *
From student
ORDER BY student_id DESC;

```
## 顯示全部資料由大到小限制３筆

```sql
SELECT *
From student
ORDER BY student_id DESC
LIMIT 3;
```
## 更新資料

```sql
UPDATE student
SET name=　'阿柱',
    major= '數學'
WHERE student_id= 2;
```

## 刪除第二筆資料

```sql
DELETE FROM student
WHERE student_id= 2;
```

## 刪除全部資料

```sql
DELETE FROM student
WHERE student_id in (1,3,4);
```


UPDATE student
SET name = '阿柱',
    major = '數學'
WHERE student_id = 2;

UPDATE student
SET name = '阿柱',
    major = '數學'
WHERE student_id = 2;