CREATE TABLE [Departments] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [description] VARCHAR (100)
);
INSERT INTO "Departments" VALUES(1,'Sales');
INSERT INTO "Departments" VALUES(2,'Customer Service');
INSERT INTO "Departments" VALUES(3,'I.T.');
INSERT INTO "Departments" VALUES(4,'Finance');
INSERT INTO "Departments" VALUES(5,'Marketing');
INSERT INTO "Departments" VALUES(6,'Human Resources');
INSERT INTO "Departments" VALUES(7,'Research and Development');

CREATE TABLE [Employees] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [first_name] VARCHAR (50),
  [last_name] VARCHAR (50),
  [department_id] INTEGER REFERENCES [Departments] ([id])
);
INSERT INTO "Employees" VALUES(1,'Tracy','Ouellette',1);
INSERT INTO "Employees" VALUES(2,'Chris','Daniel',1);
INSERT INTO "Employees" VALUES(3,'Jason','Alexander',3);
INSERT INTO "Employees" VALUES(4,'Jennifer','Hannah',7);
INSERT INTO "Employees" VALUES(5,'Maxx','Slayde',4);
