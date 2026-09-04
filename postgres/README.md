# Postgres

[Documentation](https://www.postgresql.org/docs/18/index.html)

## PSQL

- start interactively: [script](./scripts/psql-shell.sh)
- good commands
  - `\l`: list databases
  - `\dt`: list tables

## Queries

```sql
-- Source - https://stackoverflow.com/a/2611745
-- Posted by Greg Smith, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-09-03, License - CC BY-SA 4.0

SELECT  n.NspName AS Schema_Name, c.RelName AS Table_Name, c.RelTuples::int AS N
FROM    pg_class                AS c
        LEFT JOIN pg_namespace  AS n    ON n.oid = c.RelNameSpace
WHERE   NspName NOT IN ('pg_catalog', 'information_schema')
        AND RelKind='r'
ORDER   BY N DESC;
```
