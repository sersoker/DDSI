Supongamos que tenemos una tabla de distancias de diferentes rutas y que queremos guardar estas distancias en kilómetros y en millas.
– Distancias (ruta#, distancia_k, distancia_m).
Crear disparadores para conseguir que cuando se introduzca (o se modifique) una  distancia en kilómetros, 
automáticamente se introduzca también en millas y viceversa. (1 Km=0.621371 millas y 1 Milla=1.609344 Km)


CREATE TRIGGER 
	disparador before insert or update on Distancias

	FOR EACH ROW
	DECLARE
	millas Distancias.distancia_m%TYPE;
	kilometros Distancias.distancia_k%TYPE;
	
	BEGIN
	IF INSERTING  THEN
		if(:NEW.distancia_k>0&&:NEW.distancia_k>0)
			INSERT INTO Distancias VALUES(:NEW.ruta,:NEW.distancia_k,:NEW.distancia_m);
		elsif (:NEW.distancia_k>0)
			millas=:NEW.distancia_k/1.609344;
			INSERT INTO Distancias VALUES(:NEW.ruta,:NEW.distancia_k,:millas);
		elsif (:NEW.distancia_m>0)
			kilometros=:NEW.distancia_m/0.621371;
			INSERT INTO Distancias VALUES(:NEW.ruta,kilometros,:NEW.distancia_m);
		end if;
	ELSIF UPDATING ('distancia_k')THEN
			:OLD.distancia_m=:NEW.distancia_k/1.609344;
	ELSIF UPDATING ('distancia_m') THEN
			:OLD.distancia_k=:NEW.distancia_m/0.621371;
	END IF;	
	
END;



Supongamos el siguiente esquema de base de datos:
– Productos (CodProducto, Nombre,LineaProducto,PrecioUnitario, Stock);
– Empleados (CodEmpleado, Salario, Comision,Nombre, CodJefe, Departamento);
– Ventas (CodVenta, CodProducto, CodEmpleado, FechaVenta, UnidadesVendidas);

Escribir un disparador que limite la suma total de los salarios de los empleados a 50,000.


CREATE TRIGGER 
	limiteSalarios before insert or update on Empleados
	DECLARE
	sumaSalario Empleados.Salario%TYPE;
	
	BEGIN
	FOR EACH ROW
	sumaSalario=sumaSalario+Salario;
	
	if(sumaSalario+:NEW.Salario<50000)
	IF INSERTING THEN
		INSERT INTO EMPLEADOS VALUES(:NEW.CodEmpleado, :NEW.Salario, 
									:NEW.Comision,:NEW.Nombre, :NEW.CodJefe, :NEW.Departamento);
	ELSIF UPDATING ('Salario')THEN
		:OLD.Salario=:New.Salario;
	END IF;
	END


Escribir un disparador que verifique que el salario de un empleado sea inferior al de su jefe.

CREATE TRIGGER 
	salarioJefe before insert or update on Empleados
	DECLARE
	sJefe Empleados.Salario%TypeM;
	BEGIN
	SELECT Salario FROM Empleados WHERE CodEmpleado == :NEW.CodJefe;
	INTO sJefe;

	IF INSERTING THEN
		if(:New.Salario>sJefe)
			EXCEPTION
			DBMS_OUTPUT.PUT_LINE("Error, salario superior al jefe.");
			RAISE;
		end if;
	ELSIF UPDATING ('Salario') THEN
		if(:New.Salario>sJefe)
			EXCEPTION
			DBMS_OUTPUT.PUT_LINE("Error, salario superior al jefe.");
			RAISE;
		end if;
	END IF;
END;


Escriba un procedimiento para Insertar una nueva Venta. Recuerde realizar las comprobaciones necesarias para mantener la integridad de la base de datos.


CREATE PROCEDURE nuevaVenta 
	@codVenta	Ventas.CodVenta%TYPE,
	@CodProducto Ventas.CodProducto%TYPE,
	@CodEmpleado Ventas.CodEmpleado%TYPE,
	@FechaVenta Ventas.FechaVenta%TYPE,
	@UnidadesVendidas Ventas.UnidadesVendidas%TYPE,

AS
BEGIN
	if (EXISTS (SELECT * FROM Empleados WHERE CodEmpleado==@CodEmpleado);)
		INSERT INTO empleados
		(nEmp,nombre, apellido, fe_alta, sueldo, ventas, ndep) VALUES
		(@nemp,@nombre, @apellido, @fechaAlta,@sueldo, @ventas, @nDep)
	end if;
END



Supongamos que tenemos las tablas:
– Cuenta (cuenta#, saldo)
– Prestamo (prestamo#, cuenta#, capital, capital_pendiente, interes, importe_letra, num_letras, letras_pendientes)
– letras_prestamo (prestamo#, letra#,capital_amortizado)
Construir un disparador que, cada vez que insertemos o actualicemos una tupla en letras_prestamo, controle:
Si hay saldo suficiente en la cuenta asociada. En caso contrario, suspenda la inserción y genere una excepción que de un mensaje de salida indicando lo sucedido.
Si hay saldo, debe descontar la cantidad de la letra de la cuenta correspondiente y actualizar la tabla préstamo para que refleje el 
capital pendiente, de acuerdo con el capital que amortiza la letra y el número de letras pendientes


CREATE TRIGGER 
	cambioLetras BEFORE INSERT OR UPDATE ON letras_prestamo
	
	DECLARE 
	sld Cuenta.saldo%TYPE;
	cnt Prestamo.cuenta%TYPE;
BEGIN
	SELECT cuenta FROM Prestamo WHERE :new.prestamo==prestamo;
	INTO cnt
	
	select saldo FROM Cuenta WHERE cnt=cuenta;
	into sld;
	
	if(:new.capital_amortizado>sld)
		EXCEPTION
			DBMS_OUTPUT.PUT_LINE("Saldo insuficiente.");
		RAISE;
	else
		UPDATE Cuenta SET saldo=saldo-:new.capital_amortizado
			WHERE cuenta= cnt;
		UPDATE Prestamo SET
						letras_pendientes=letras_pendientes-1,
						capital_pendiente=capital_pendiente-:new.capital_amortizado;
			WHERE prestamo=:new.prestamo;
		INSERT INTO letras_prestamo
			VALUES(:NEW.prestamo, :NEW.letra,:NEW.capital_amortizado,);
	end if
END;

	
	
	
	
	

