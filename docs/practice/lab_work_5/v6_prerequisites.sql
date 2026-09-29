-- Variant 6. Hotel
-- State of the database BEFORE Practice 4: only dimension table 1
-- ("rooms"), as Practice 1 should have produced.

PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS guests;

CREATE TABLE rooms (
    id INTEGER PRIMARY KEY,
    type TEXT NOT NULL,
    price_per_night REAL NOT NULL CHECK(price_per_night > 0),
    capacity INTEGER NOT NULL,
    status TEXT NOT NULL DEFAULT 'вільний'
);

INSERT INTO rooms (type, price_per_night, capacity, status) VALUES
    ('Стандарт', 1200, 2, 'вільний'),
    ('Стандарт', 1200, 2, 'зайнятий'),
    ('Комфорт', 1800, 2, 'вільний'),
    ('Люкс', 3200, 4, 'вільний'),
    ('Сімейний', 2500, 4, 'зайнятий'),
    ('Економ', 800, 1, 'вільний');

CREATE TABLE guests(
    id integer primary key,
    last_name string not null,
    first_name string not null,
    email string not null DEFAULT"Гість не вказав ел. адресу =(",
    phone string not null UNIQUE
);
INSERT INTO guests (last_name, first_name, email, phone) VALUES
('Шевченко', 'Олександр', 'shevchenko@gmail.com', '+380671234567'),
('Ковальчук', 'Марія', 'kovalchuk@gmail.com', '+380931234568'),
('Мельник', 'Андрій', 'melnyk@gmail.com', '+380501234569'),
('Бондаренко', 'Олена', 'bondarenko@gmail.com', '+380631234570'),
('Ткаченко', 'Дмитро', 'tkachenko@gmail.com', '+380971234571'),
('Романюк', 'Ірина', 'romaniuk@gmail.com', '+380661234572');

CREATE TABLE bookings(
    id INTEGER primary key,
    room_id INTEGER not null,
    guest_id INTEGER not null,
    check_in_date TEXT not null,
    check_out_date TEXT not null,
    FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE RESTRICT,
    FOREIGN KEY (guest_id) REFERENCES guests(id) ON DELETE RESTRICT
);

INSERT INTO bookings (room_id, guest_id, check_in_date, check_out_date) VALUES
(1, 1, '2026-09-01', '2026-09-03'),
(3, 2, '2026-09-02', '2026-09-05'),
(4, 3, '2026-09-05', '2026-09-10'),
(2, 4, '2026-09-07', '2026-09-09'),
(5, 5, '2026-09-10', '2026-09-14'),
(6, 6, '2026-09-12', '2026-09-13'),
(1, 3, '2026-09-15', '2026-09-18'),
(3, 1, '2026-09-18', '2026-09-21'),
(4, 6, '2026-09-20', '2026-09-25'),
(5, 2, '2026-09-22', '2026-09-27');
drop table guests_old

--UPDATE rooms SET price_per_night = -1 WHERE id = 2;

--INSERT INTO rooms (type, price_per_night, status)
--VALUES ('Тест', 1000, 'вільний');

--INSERT INTO guests (last_name, first_name, email, phone)
--VALUES ('Тест', 'Гість', 'test@gmail.com', '+380671234567');