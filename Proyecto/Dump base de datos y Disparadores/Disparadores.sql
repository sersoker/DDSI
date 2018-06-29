CREATE TRIGGER 
	insercionProducto BEFORE INSERT Productos
	
BEGIN

	if(:new.PrecioCompra>=:new.PrecioVenta)
		EXCEPTION
			DBMS_OUTPUT.PUT_LINE("Precio de Venta debe ser myor que precio de compra.");
		RAISE;
	else
		INSERT INTO Productos
			VALUES(:NEW.Referencia,:NEW.Nombre,:NEW.Tipo,:NEW.PrecioCompra,
			       :NEW.PrecioVenta,:NEW.IVA,:NEW.Peso,:NEW.Volumen,:NEW.Proveedor);
	end if
END;

	
CREATE TRIGGER 
	modificacionProducto before update on Productos
	BEGIN

	IF UPDATING ('PrecioCompra') THEN
		if(:new.PrecioCompra>=:old.PrecioVenta)
			EXCEPTION
			DBMS_OUTPUT.PUT_LINE("Precio de compra incorrecto.");
			RAISE;
		else
			:old.PrecioCompra=:new.PrecioCompra;		
		end if;
	ELSIF UPDATING ('PrecioVenta') THEN
		if(:old.PrecioCompra>=:new.PrecioVenta)
			EXCEPTION
			DBMS_OUTPUT.PUT_LINE("Precio de venta incorrecto.");
			RAISE;
		else
			:old.PrecioVenta=:new.PrecioVenta;
		end if;
	END IF;
END;

