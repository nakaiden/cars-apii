DROP TABLE Vehicles;
DROP TABLE Makes; 

CREATE TABLE IF NOT EXISTS Makes(
    make_id SERIAL PRIMARY KEY,
    name TEXT,
    origin TEXT

);

CREATE TABLE IF NOT EXISTS Vehicles(
    vehicle_id SERIAL PRIMARY KEY,
    -- make SERIAL FOREIGN KEY REFERENCES Makes(make_id),
    make INT,
    CONSTRAINT FK_make_id FOREIGN KEY (make)
    REFERENCES Makes(make_id),
    model TEXT NOT NULL,
    engine TEXT NOT NULL,
    color TEXT NOT NULL,
    license_plate_number TEXT,
    drive INT NOT NULL
);


INSERT INTO Makes VALUES (DEFAULT, 'BMW', 'Germany');
INSERT INTO Makes VALUES(DEFAULT, 'Mercedes', 'Germany');
INSERT INTO Makes VALUES(DEFAULT, 'Tesla', 'America');
INSERT INTO Makes VALUES(DEFAULT, 'Toyota', 'Japan');

INSERT INTO Vehicles VALUES (DEFAULT, (SELECT make_id FROM Makes WHERE name = 'BMW'), 'M6', 'V10', 'BLUE', 'J25-8674', '2');
INSERT INTO Vehicles VALUES (DEFAULT, (SELECT make_id FROM Makes WHERE name = 'Mercedes'), 'S63', 'V12', 'SILVER', 'E67-4511', '4');
INSERT INTO Vehicles VALUES (DEFAULT, (SELECT make_id FROM Makes WHERE name = 'Tesla'), 'P-90', 'N/A', 'BLACK', 'IMGONE', '4');
INSERT INTO Vehicles VALUES (DEFAULT, (SELECT make_id FROM Makes WHERE name = 'Toyota'), 'Highlander', 'V6', 'WHITE', 'ABC-1234', '2');