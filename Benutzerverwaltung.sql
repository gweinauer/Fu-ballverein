--Removes a previously granted or denied permission. 
--Revoking all Permissions to drop user
REVOKE ALL ON DATABASE fussballverein FROM spieler;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM spieler;

REVOKE ALL ON DATABASE fussballverein FROM trainer;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM trainer;

REVOKE ALL ON DATABASE fussballverein FROM analyst;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM analyst;

REVOKE ALL ON DATABASE fussballverein FROM dokumentator;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM dokumentator;

REVOKE ALL ON DATABASE fussballverein FROM vorstand;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM vorstand;

-- dropping the users if they exist
DROP USER spieler;
DROP USER trainer;
DROP USER analyst;
DROP USER dokumentator;
DROP USER vorstand;

-- creating the users
\c fussballverein 

CREATE USER spieler WITH PASSWORD 'spieler';
CREATE USER trainer WITH PASSWORD 'trainer';
CREATE USER spielanalyst WITH PASSWORD 'analyst';
CREATE USER dokumentator WITH PASSWORD 'dokumentator';
CREATE USER vorstand WITH PASSWORD 'vorstand';

-- granting conenction privileges to all users
GRANT CONNECT ON DATABASE fussballverein TO spieler;
GRANT CONNECT ON DATABASE fussballverein TO trainer;
GRANT CONNECT ON DATABASE fussballverein TO analyst;
GRANT CONNECT ON DATABASE fussballverein TO dokumentator;
GRANT CONNECT ON DATABASE fussballverein TO vorstand;

--privileges for spieler
GRANT SELECT (persnr,position,von,bis) ON spieler TO spieler;
GRANT SELECT ON spiel TO spieler;
GRANT SELECT ON spielt TO spieler;

--privileges for trainer
GRANT SELECT (von,bis,mannschaft) ON trainer TO trainer;
GRANT SELECT (position,von,bis) ON spieler TO trainer;
GRANT SELECT ON mannschaft TO trainer;
GRANT SELECT ON spiel TO trainer;
GRANT SELECT ON spielt TO trainer;
GRANT SELECT ON hatGespielt TO trainer;
GRANT UPDATE,INSERT (position) ON spieler TO trainer;

--privileges for analyst
GRANT SELECT ON spieler TO analyst;
GRANT SELECT ON trainer TO analyst;
GRANT SELECT ON mannschaft TO analyst;
GRANT SELECT ON spiel TO analyst;
GRANT SELECT ON spielt TO analyst;

--privileges for dokumentator
GRANT SELECT,UPDATE,INSERT ON spielt TO dokumentator;
GRANT SELECT,UPDATE,INSERT ON spiel TO dokumentator;

--privileges for vorstand
GRANT SELECT,UPDATE,INSERT ON ALL TABLES IN SCHEMA public TO vorstand;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO vorstand;
