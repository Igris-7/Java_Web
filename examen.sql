create database examen
use examen

create table distrito
(
distrito_id int not null primary key,
distrito_nombre varchar(45),
distrito_provincia varchar(45)
);

insert into distrito values(1,'SJL','LA PERLA');
insert into distrito values(2,'MIRAFLORES','LOS DURAZNOS');
insert into distrito values(3,'SURCO','PRIALE');
insert into distrito values(4,'LA MOLINA','LA MOLINA');
insert into distrito values(5,'LA VICTORIA','VICKY');
insert into distrito values(6,'SURCO','SURCO SUR');
insert into distrito values(7,'SAN BORJA','SAN BORJA SUR');
insert into distrito values(8,'SAN LUIS','SAN HILARION');
insert into distrito values(9,'LOS OLIVOS','ASTANA');
insert into distrito values(10,'LOS NARANJOS','DULCELIOS');


create table modelo
(
modelo_id int not null primary key,
modelo_nombre varchar(45),
modelo_marca varchar(45)
);

INSERT INTO MODELO VALUES(1,'MODELO1','ADIDAS');
INSERT INTO MODELO VALUES(2,'MODELO2','NIKE');
INSERT INTO MODELO VALUES(3,'MODELO3','PUMA');
INSERT INTO MODELO VALUES(4,'MODELO4','NEW ATHETIC');
INSERT INTO MODELO VALUES(5,'MODELO5','BATA');


create table cliente
(
cliente_id int not null primary key,
cliente_nombre varchar(45),
cliente_direccion varchar(45),
distrito_id int,
foreign key (distrito_id) references distrito(distrito_id)
);

INSERT INTO CLIENTE VALUES(1,'Eyner	Torres','Av los naranjos 456',1)
INSERT INTO CLIENTE VALUES(2,'Luis Molina','Av San Carlos 45',2)
INSERT INTO CLIENTE VALUES(3,'Elias Espinoza','Av Aviacion 345',3)


create table producto
(
producto_id int not null primary key,
producto_nombre varchar(45),
producto_precio double,
modelo_id int,
foreign key(modelo_id) references modelo(modelo_id)
)

insert into producto values(1,'Zapatilla Blancas',50,1);
insert into producto values(2,'Chimpunes ',60.70,1);
insert into producto values(3,'Zapatilla losera',80,1);
insert into producto values(4,'Zapatilla para grass',90,2);
insert into producto values(5,'Zapatos charol',110,2);
insert into producto values(6,'Zapatilla negras',120,2);
insert into producto values(7,'Zapatos mocasines',150,3);
insert into producto values(8,'Zapatilla para caminar',180,3);
insert into producto values(9,'Zapatos con resorte',200,3);
insert into producto values(10,'Zapatillas verdes',140,3);
insert into producto values(11,'Zapatillas azules',120,4);
insert into producto values(12,'Zapatillas pie plano',110,4);
insert into producto values(13,'Zapatillas grass artificial',125,5);
insert into producto values(14,'Zapatillas gradiente',167,5);
insert into producto values(15,'Zapatillas stand up',149,5);


create table pedido
(
pedido_id int not null,
cliente_id int,
producto_id int,
pedido_cantidad varchar(45),
pedido_fecha date,
foreign key (cliente_id) references cliente(cliente_id),
foreign key (producto_id) references producto(producto_id)
)

insert into pedido values(1,1,1,'2','2019/12/14');
select * from pedido

select * from cliente;