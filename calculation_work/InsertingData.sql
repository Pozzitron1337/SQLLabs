USE RieltorsDatabase
GO

INSERT INTO Operations(operation_name) VALUES
('Продаж'),
('Купівля'),
('Обмін')

INSERT INTO Regions(region_name) VALUES
('проспект Миру'),
('вул. Купців'),
('бульвар Французький'),
('вул. Ринкова'),
('вул. Земляна'),
('вул. Центральна'),
('проспект Свободи'),
('вул. Київська'),
('вул. Лисенко')-- 9

INSERT INTO Clients(client_name, phone) VALUES
('Василь Петренко','380981112345'),
('Ума Дурман','380678924433'),
('Микола Кунко','380673458710'),
('Василій Митець','380963341232'),
('Семен Спасокукоцький','38098781311'),
('Данило Галицький','380673459009'),
('Оксана Кновко','380459825423'),
('Захар Беркут','380969873479'),
('Катерина Гул','380985049821')-- 9

INSERT INTO Flats(client_owner,region,square,rooms,floor,price) VALUES
(1,1,41.45,1,4,50000),
(1,2,28.43,2,1,15000),
(2,5,20.93,4,1,50000),
(3,3,103.26,3,1,30000),
(4,6,49.81,3,1,43000),
(4,2,123.5,3,1,98000),
(5,6,68.3,2,4,12000),
(6,7,205.39,2,4,67000),
(6,1,48.88,2,1,76000),
(7,2,123.67,3,1,50000),
(8,5,230.9,5,1,29000),
(8,8,148.39,3,1,45000),
(9,7,191.7,4,1,84000),
(9,1,120.56,3,2,36000)--14

INSERT INTO Requests(operation,client_requester,flat) VALUES
(1,1,9),
(1,4,5),
(2,7,14),
(3,6,1),
(2,9,14)