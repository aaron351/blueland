CREATE DATABASE BlueLand 
use BlueLand

-- Login --
create table rol(
	IdRol int IDENTITY(1,1) NOT NULL,
	NombreRol nvarchar(25) NOT NULL,
	Estado bit NOT NULL,

	CONSTRAINT Pk_Rol primary key(IdRol)
)
create table persona(
	IdPersona int IDENTITY(1,1) NOT NULL,
	Nombre nvarchar(25) NOT NULL,
	Apellido nvarchar(25) NULL,
	CedulaoRuc nvarchar(100) NOT NULL,
	Telefono nvarchar(8) NOT NULL,
	Direccion nvarchar(300) NOT NULL,
	Email nvarchar(300) NOT NULL,
	Estado bit NOT NULL

	CONSTRAINT Pk_IdPersona primary key(IdPersona)
)
create table usuarios(
	CodigoUsuario int IDENTITY(1,1) NOT NULL,
	IdRol int NOT NULL,
	IdPersona int NOT NULL,
	Usuarios nvarchar(100) NOT NULL,
	Contraseñas nvarchar(100) NOT NULL,
	Estado bit NOT NULL,

	CONSTRAINT Pk_Usuarios Primary key(CodigoUsuario),
	CONSTRAINT Fk_PersonaUser Foreign key(IdPersona) References Persona(IdPersona),
	CONSTRAINT Fk_RolPersona Foreign key(IdRol) References Rol(IdRol)
)
-- Login -- 


-- Producto --
create table hoteles(
	id_hoteles int IDENTITY(1,1) NOT NULL,
	id_usuario int NOT NULL,
	nombre_hotel nvarchar(100) NOT NULL,
	descripcion_hotel nvarchar(500) NULL,
	estado bit NOT NULL,	
	
	CONSTRAINT Pk_hoteles Primary key(id_hoteles),
	CONSTRAINT Fk_userhotel Foreign key(id_usuario) References usuarios(CodigoUsuario)
)

create table habitacion(
	id_habitaciones int IDENTITY(1,1) NOT NULL,
	id_hotel int NOT NULL,
	num_habitacion int NOT NULL,
	num_camas int NOT NULL,
	precio real NOT NULL,
	descripcion nvarchar(1000) NOT NULL,

	CONSTRAINT Pk_habitaciones Primary key (id_habitaciones),
	CONSTRAINT Fk_hotelHabitacion Foreign key(id_hotel) References hoteles(id_hoteles)
)

create table restaurante(
	id_restaurante int IDENTITY(1,1) NOT NULL,
	id_usuario int NOT NULL,
	nombre_rest nvarchar(100) NOT NULL,
	estado bit NOT NULL,

	CONSTRAINT Pk_restaurante Primary key(id_restaurante),
	CONSTRAINT Fk_userhotel Foreign key(id_usuario) References usuarios(CodigoUsuario)
)

create table Sturisticos(
	id_Sturisticos int IDENTITY(1,1) NOT NULL,
	id_usuario int NOT NULL,
	nombre_sturisticos nvarchar(100) NOT NULL,
	estado bit NOT NULL,

	CONSTRAINT Pk_Sturisticos Primary key(id_Sturisticos),
	CONSTRAINT Fk_userhotel Foreign key(id_usuario) References usuarios(CodigoUsuario)
)

create table imagenes(
	id_imagenes int IDENTITY(1,1) NOT NULL,
	id_habitaciones int NOT NULL,
	id_restaurantes int NOT NULL,
	id_turismo int NOT NULL,
	imagen_url url NOT NULL,
	alt nvarchar(50) NOT NULL,

	CONSTRAINT Pk_imagenes Primary key (id_imagenes),
	CONSTRAINT Fk_hotelimagen Foreign key (id_habitaciones) References habitacion(id_habitaciones),
	CONSTRAINT Fk_restauranimagen Foreign key (id_restaurantes) References restaurante(id_restaurante),
	CONSTRAINT Fk_hotelimagen Foreign key (id_turismo) References Sturisticos(id_Sturisticos)
)
--Producto--

-- Facturacion --
create table factura(
	id_factura int IDENTITY(1,1) NOT NULL,
	id_usuario int NOT NULL,
	total_fact real NOT NULL,

)
-- Facturacion --


--Tentativo a cambio--
CREATE TABLE auditoria_prod(
	CODIGO_AU INT IDENTITY(1,1)  PRIMARY KEY,
	USUARIO_AU VARCHAR(20) NOT NULL,
	TABLA VARCHAR(20) NOT NULL,
	ACCION VARCHAR(20) NOT NULL,
	IdProducto int NOT NULL,
	Precio real NOT NULL,
	DESCRIPCION VARCHAR(500),
	FECHA_HORA DATETIME NOT NULL,

	Constraint Fk_ProdAuditoria Foreign key (IdProducto) references producto(IdProducto)
)
--Tentativo a cambio--


--chat--
CREATE TABLE chat(
	idChat int IDENTITY(1,1) NOT NULL,
	id_emisor int NOT NULL,
	id_receptor int NOT NULL,
	Mensajes nvarchar(4000) NOT NULL,

	CONSTRAINT Pk_chat Primary key(idChat),
	CONSTRAINT Fk_chatUser Foreign Key(id_emisor) References usuarios(CodigoUsuario),
	CONSTRAINT Fk_chatUser Foreign Key(id_resector) References usuarios(CodigoUsuario)
) 
--chat--


/*-- borrador 
create table producto(
	IdProducto int IDENTITY(1,1) NOT NULL,
	IdUser int NOT NULL,
	NombreProd nvarchar(300) NOT NULL,
	Descripcion nvarchar(500) NOT NULL,
	Precio float NOT NULL,
	Estado bit NOT NULL,
	
	CONSTRAINT Pk_Productos Primary Key(IdProducto),
	CONSTRAINT Fk_ProductoUser Foreign Key(IdUser) References usuarios(CodigoUsuario)
)
create table detalle_prod(
	IdDetalle int IDENTITY(1,1) NOT NULL,
	IdProd int NOT NULL,
	Cantidad int NOT NULL,
	VentasMensual int NOT NULL,
	Puntuacion int NULL,
	ImagenProd image NOT NULL,
	Comentario nvarchar(500) NULL,

	CONSTRAINT Pk_DetalleProd Primary Key(IdDetalle),
	CONSTRAINT Fk_ProductoDetalle Foreign Key(IdProd) References producto(IdProducto)
)
-- Borrador --*/