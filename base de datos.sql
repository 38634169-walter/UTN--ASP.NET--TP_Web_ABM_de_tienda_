CREATE DATABASE TIENDA

GO
USE TIENDA

CREATE TABLE Paises(
	IDPais SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombrePai VARCHAR(30) NOT NULL
)
CREATE TABLE Marcas(
	IDMarca SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ID_Pais SMALLINT NOT NULL FOREIGN KEY REFERENCES Paises(IDPais),
	nombreMar VARCHAR(30) NOT NULL
)
CREATE TABLE Categorias(
	IDCategoria SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombreCat VARCHAR(30) NOT NULL
)
CREATE TABLE SubCategorias(
	IDSubCategoria SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ID_Categoria SMALLINT NOT NULL FOREIGN KEY REFERENCES Categorias(IDCategoria),
	nombreSub VARCHAR(30) NOT NULL
)
CREATE TABLE Articulos(
	IDArticulo BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ID_SubCategoria SMALLINT NOT NULL FOREIGN KEY REFERENCES SubCategorias(IDSubCategoria),
	ID_Marca SMALLINT NOT NULL FOREIGN KEY REFERENCES Marcas(IDMarca),
	nombreArt VARCHAR(30) NOT NULL,
	precio MONEY NOT NULL,	
	detalles VARCHAR(400) NOT NULL,
	imagen1 VARCHAR(100) NOT NULL,
	imagen2 VARCHAR(100) NOT NULL,
	imagen3 VARCHAR(100) NOT NULL,
)
CREATE TABLE Stocks(
	IDStock BIGINT NOT NULL FOREIGN KEY REFERENCES Articulos(IDArticulo),
	cantidad BIGINT NOT NULL,
	PRIMARY KEY(IDStock)
)

CREATE TABLE IngresosArticulos(
	IDIngresoArticulo BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ID_Stock BIGINT NOT NULL FOREIGN KEY REFERENCES Stocks(IDStock),
	cantidad BIGINT NOT NULL,
	fechaIngreso DATE NOT NULL CHECK(fechaIngreso>=GETDATE())
)

CREATE TABLE SalidasArticulos(
	IDSalidaArticulo BIGINT NOT NULL PRIMARY KEY IDENTITY (1,1),
	ID_Stock BIGINT NOT NULL FOREIGN KEY REFERENCES Stocks(IDStock),
	cantidad BIGINT NOT NULL,
	fechaSalida DATE NOT NULL CHECK(fechaSalida>=GETDATE())
)

CREATE TABLE DatosPersonales(
	IDDatosPersonales BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombreDat VARCHAR(30) NOT NULL,
	apellidoDat VARCHAR(30) NOT NULL,
	dni VARCHAR(11) NOT NULL,
	sexo VARCHAR(15) NOT NULL,
	fechaNacimiento DATE NOT NULL CHECK(fechaNacimiento<GETDATE()),
	email VARCHAR(50) NOT NULL,
	codigoPostal VARCHAR(10) NOT NULL
)

CREATE TABLE Usuarios(
	IDUsuario BIGINT NOT NULL FOREIGN KEY REFERENCES DatosPersonales(IDDatosPersonales),
	usuario VARCHAR(30) NOT NULL,
	clave VARCHAR(30) NOT NULL,
	fechaAlta DATE NOT NULL
	PRIMARY KEY(IDUsuario)
)
CREATE TABLE EstadosVentas(
	IDEstadoVenta TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombreEst VARCHAR(30) NOT NULL,
)

drop TABLE Ventas(
	IDVenta BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ID_DatosPersonales BIGINT NOT NULL FOREIGN KEY REFERENCES DatosPersonales(IDDatosPersonales),
	ID_EstadoVenta TINYINT NOT NULL FOREIGN KEY REFERENCES EstadosVentas(IDEstadoVenta),
	ID_TipoPago TINYINT NULL FOREIGN KEY REFERENCES TiposPagos(IDTipoPago)
	monto MONEY NULL,
	fechaVenta DATE NULL,
	LocalidadEntrega VARCHAR(30) NULL,
	CalleEntrega VARCHAR(30) NULL,
	numeroCalleEntrega TINYINT NULL,
	telefonoEntrega VARCHAR(20) NULL,
	comentario VARCHAR(200) NULL
)

CREATE TABLE tiposPagos(
	IDTipoPago TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombreTip VARCHAR(15)
)

CREATE TABLE DetallesDeVentas(
	IDDetalleVenta BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ID_Venta BIGINT NOT NULL FOREIGN KEY REFERENCES Ventas(IDVenta),
	ID_Articulo BIGINT NOT NULL FOREIGN KEY REFERENCES Articulos(IDArticulo),
	cantidad SMALLINT NOT NULL,
	precioALaFecha MONEY NOT NULL,
	estado BIT DEFAULT 1
)

-----------------------------------------------------
-----------------------------------------------------
-----------------------INSERTES----------------------
-----------------------------------------------------
-----------------------------------------------------


INSERT INTO Paises(nombrePai)VALUES
('Argentina'),
('Brasil'),
('Estados Unidos')

INSERT INTO Marcas(ID_Pais,nombreMar)VALUES
(1,'Liliana'),
(2,'Mondial'),
(1,'Tascani'),
(3,'Nike')

INSERT INTO Categorias(nombreCat) VALUES
('Electrodomesticos'),
('Ropa')

INSERT INTO SubCategorias(ID_Categoria,nombreSub) VALUES
(1,'Licuadoras'),
(2,'Zapatillas'),
(1,'Calefactores'),
(2,'Shorts')

INSERT INTO Articulos(ID_SubCategoria,ID_Marca,nombreArt,precio,detalles,imagen1,imagen2,imagen3) VALUES
(1,1,'Licuadora Liliana',3600.99,'Liquadora Liliana los mejores liquados de tu vida, asegurado.','/Content/img/Liquadoras/1_1.webp','/Content/img/Liquadoras/1_2.webp','/Content/img/Liquadoras/1_3.webp'),
(1,2,'Liquadora Mondial',3200.50,'Liquadora Mondial te corta hasta las ganas de vivir.','/Content/img/Liquadoras/2_1.webp','/Content/img/Liquadoras/2_2.webp','/Content/img/Liquadoras/2_3.webp'),
(2,1,'Zapatillas Tascani2',6700.99,'Zapatillas Tascani con estas quedas bien donde vayas.','/Content/img/Zapatillas/1_1.webp','/Content/img/Zapatillas/1_2.webp','/Content/img/Zapatillas/1_3.webp'),
(2,1,'Zapatillas Tascani',6200.99,'Zapatillas Tascani nunca vas a tener los pies tan comodos.','/Content/img/Zapatillas/2_1.webp','/Content/img/Zapatillas/2_2.webp','/Content/img/Zapatillas/2_3.webp'),
(2,2,'Zapatillas Nike',5200.00,'Zapatillas Nike con estas no hizo goles messi pero vos los vas a hacer.','/Content/img/Zapatillas/3_1.jpg','/Content/img/Zapatillas/3_2.jpg','/Content/img/Zapatillas/3_3.jpg'),
(3,2,'Caloventor Mondial',5200.00,'Calovetor Mondial muy caliente para invierno.','/Content/img/Caloventores/1_1.jpg','/Content/img/Caloventores/1_2.jpg','/Content/img/Caloventores/1_3.jpg'),
(3,1,'Caloventor Liliana',6200.99,'Calovetor Liliana mas caliente que cualquier otro.','/Content/img/Caloventores/2_1.jpg','/Content/img/Caloventores/2_2.jpg','/Content/img/Caloventores/2_3.jpg'),
(4,1,'Shortcito espectacular',2200.99,'Short Tascani si te lo pone no te lo sacas mas.','/Content/img/Shorts/1_1.jpg','/Content/img/Shorts/1_2.jpg','/Content/img/Shorts/1_3.jpg')

INSERT INTO Stocks (IDStock,cantidad) VALUES
(1,100),
(2,150),
(3,100),
(4,150),
(5,100),
(6,150),
(7,100),
(8,150)

INSERT INTO IngresosArticulos(ID_Stock,cantidad,fechaIngreso)VALUES
(1,100,'2021/12/01'),
(2,200,'2021/12/01'),
(3,100,'2021/12/01'),
(4,200,'2021/12/01'),
(5,100,'2021/12/01'),
(6,200,'2021/12/01'),
(7,100,'2021/12/01'),
(8,200,'2021/12/01')

INSERT INTO SalidasArticulos(ID_Stock,cantidad,fechaSalida)VALUES
(2,50,'2021/12/03'),
(4,50,'2021/12/03'),
(6,50,'2021/12/03'),
(8,50,'2021/12/03')

INSERT INTO EstadosVentas(nombreEst)VALUES
('En carrito'),
('Procesando'),
('En camino'),
('Recibido'),
('Cancelado')

INSERT INTO tiposPagos(nombreTip) VALUES
('Debito'),
('Credito'),
('Cheque'),
('Efectivo')

----------------------------------------------------------
----------------PROCEDIMIENTOS ALMACENADOS----------------
----------------------------------------------------------

CREATE PROCEDURE PS_INSERTAR_USUARIO(
	@nombre VARCHAR(30),
	@apellido VARCHAR(30),
	@dni VARCHAR(11),
	@sexo VARCHAR(15),
	@fechaNacimiento DATE,
	@email VARCHAR(50),
	@codigoPostal VARCHAR(10),
	@clave VARCHAR(30),
	@usuario VARCHAR(30)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			
			DECLARE @IDUsuario BIGINT

			INSERT INTO DatosPersonales(nombreDat,apellidoDat,dni,sexo,fechaNacimiento,email,codigoPostal)VALUES
			(@nombre,@apellido,@dni,@sexo,@fechaNacimiento,@email,@codigoPostal)
			SET @IDUsuario = @@IDENTITY

			INSERT INTO Usuarios(IDUsuario,usuario,clave,fechaAlta)VALUES
			(@IDUsuario,@usuario,@clave,GETDATE())

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR('NO SE PUDO AGREGAR',16,1)
	END CATCH
END

CREATE PROCEDURE INSERTAR_VENTA(
	@ID_DatosPersonales BIGINT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ID_EstadoVenta TINYINT
			SELECT  @ID_EstadoVenta=IDEstadoVenta FROM EstadosVentas WHERE nombreEst='En carrito'
			
			INSERT INTO Ventas(ID_DatosPersonales,ID_EstadoVenta)VALUES
			(@ID_DatosPersonales,@ID_EstadoVenta)

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR('No se pudo agregar',16,1)
	END CATCH
END

CREATE PROCEDURE ELIMINAR_DETALLE_VENTA (
	@IDArticulo BIGINT,
	@IDVenta BIGINT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @IDDetalleVenta BIGINT
			SELECT @IDDetalleVenta=IDDetalleVenta FROM DetallesDeVentas WHERE ID_Venta=@IDVenta AND ID_Articulo=@IDArticulo
			UPDATE DetallesDeVentas SET estado=0 WHERE IDDetalleVenta=@IDDetalleVenta
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR('No se pudo dar la baja logica',16,1)
	END CATCH
END

SELECT * FROM DetallesDeVentas

SELECT * FROM Ventas

select * from Ventas as v
INNER JOIN DetallesDeVentas as dv on dv.ID_Venta=v.IDVenta

CREATE PROCEDURE ACTUALIZAR_VENTA_POR_COMPRA(
	@IDVenta BIGINT,
	@monto MONEY,
	@fecha DATE,
	@localidad VARCHAR(30),
	@calleEntrega VARCHAR(30),
	@numeroCalle TINYINT,
	@telefono VARCHAR(20),
	@comentario VARCHAR(200),
	@nombreTipoPago VARCHAR(15)
)
AS
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @IDEstadoVenta TINYINT
			SELECT @IDEstadoVenta=IDEstadoVenta FROM EstadosVentas WHERE nombreEst='Procesando'
			DECLARE @IDTipoPago TINYINT
			SELECT @IDTipoPago=IDTipoPago FROM tiposPagos WHERE nombreTip=@nombreTipoPago

			UPDATE Ventas SET ID_EstadoVenta=@IDEstadoVenta, monto=@monto, fechaVenta=@fecha, localidadEntrega=@localidad, calleEntrega=@calleEntrega, numeroCalleEntrega=@numeroCalle,telefonoEntrega=@telefono, comentario=@comentario,ID_TipoPago=@IDTipoPago WHERE IDVenta=@IDVenta
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR('Error al actualizar',16,1)
	END CATCH
END
------------------------------------------------------------
--------------------------TRIGGERS--------------------------
------------------------------------------------------------



