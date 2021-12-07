using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using modelo;
using conexion;

namespace negocio
{
    public class VentaNegocio
    {
        public List<Venta> listar(string buscarPor,string buscar)
        {
            string consulta = "";
            switch (buscarPor)
            {
                case "todo":
                    consulta = "SELECT * FROM Ventas v, EstadosVentas ev WHERE v.ID_EstadoVenta = ev.IDEstadoVenta";
                    break;
                case "delUsuarioTodo":
                    consulta = "SELECT * FROM Ventas v, EstadosVentas ev WHERE v.ID_EstadoVenta = ev.IDEstadoVenta AND v.ID_DatosPersonales='" + buscar + "' AND v.IDVenta <> ALL (SELECT IDVenta FROM Ventas ve, EstadosVentas evv WHERE ve.ID_EstadoVenta=evv.IDEstadoVenta AND evv.nombreEst='En carrito') ORDER BY v.fechaVenta DESC ";
                    break;
                case "delUsuarioEnCarrito":
                    consulta = "SELECT * FROM Ventas v, EstadosVentas ev WHERE v.ID_EstadoVenta = ev.IDEstadoVenta AND ev.nombreEst='En carrito' AND v.ID_DatosPersonales='" + buscar + "' ORDER BY v.fechaVenta DESC ";
                    break;
                case "delUsuarioRecibido":
                    consulta = "SELECT * FROM Ventas v, EstadosVentas ev WHERE v.ID_EstadoVenta = ev.IDEstadoVenta AND ev.nombreEst='Recibido' AND v.ID_DatosPersonales='" + buscar + "' ORDER BY v.fechaVenta DESC";
                    break;
                case "delUsuarioEnCamino":
                    consulta = "SELECT * FROM Ventas v, EstadosVentas ev WHERE v.ID_EstadoVenta = ev.IDEstadoVenta AND ev.nombreEst='En camino' AND v.ID_DatosPersonales='" + buscar + "' ORDER BY v.fechaVenta DESC";
                    break;
                case "delUsuarioProcesando":
                    consulta = "SELECT * FROM Ventas v, EstadosVentas ev WHERE v.ID_EstadoVenta = ev.IDEstadoVenta AND ev.nombreEst='Procesando' AND v.ID_DatosPersonales='" + buscar + "' ORDER BY v.fechaVenta DESC";
                    break;
            }
            List<Venta> ventasList = new List<Venta>();
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();
                while (con.lector.Read())
                {
                    Venta venta = new Venta();
                    venta.id = Convert.ToInt32(con.lector["IDVenta"]);
                    venta.estado = new EstadoVenta();
                    venta.estado.id = Convert.ToInt32(con.lector["IDEstadoVenta"]);
                    venta.estado.nombre = (string)con.lector["nombreEst"];
                    venta.monto = Convert.ToDecimal(con.lector["monto"]);
                    venta.fecha = Convert.ToDateTime(con.lector["fechaVenta"]);
                    venta.localidad = (string)con.lector["localidadEntrega"];
                    venta.calleEntrega = (string)con.lector["calleEntrega"];
                    venta.numeroCalleEntrega = Convert.ToInt32(con.lector["numeroCalleEntrega"]);
                    ventasList.Add(venta);
                }
                return ventasList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.cerrar_conexion();
            }
        }
        
        public Venta buscar(string buscarPor,string buscar)
        {
            string consulta = "";
            switch (buscarPor)
            {
                case "id":
                    consulta = "SELECT * FROM Ventas v, EstadosVentas ev WHERE v.ID_EstadoVenta = ev.IDEstadoVenta AND v.IDVenta='" + buscar + "' ";
                    break;
                case "ultima venta":
                    consulta = "SELECT TOP 1 * FROM Ventas v, EstadosVentas ev WHERE v.ID_EstadoVenta = ev.IDEstadoVenta AND v.ID_DatosPersonales = '" + buscar + "' AND ev.nombreEst='En carrito' ORDER BY v.IDVenta DESC";
                    break;
            }
            Venta venta = new Venta();
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();
                while (con.lector.Read())
                {
                    venta.id = Convert.ToInt32(con.lector["IDVenta"]);
                    venta.estado = new EstadoVenta();
                    venta.estado.id = Convert.ToInt32(con.lector["IDEstadoVenta"]);
                    venta.estado.nombre = (string)con.lector["nombreEst"];
                    venta.cliente = new DatosPersonales();
                    venta.cliente.id = Convert.ToInt32(con.lector["ID_DatosPersonales"]);
                    if(!(con.lector["monto"] is DBNull)) venta.monto = Convert.ToDecimal(con.lector["monto"]);
                    if(!(con.lector["localidadEntrega"] is DBNull)) venta.localidad = (string)con.lector["localidadEntrega"];
                    if(!(con.lector["calleEntrega"] is DBNull))venta.calleEntrega = (string)con.lector["calleEntrega"];
                    if(!(con.lector["numeroCalleEntrega"] is DBNull))venta.numeroCalleEntrega = Convert.ToInt32(con.lector["numeroCalleEntrega"]);
                    if(!(con.lector["fechaVenta"] is DBNull)) venta.fecha = Convert.ToDateTime(con.lector["fechaVenta"]);
                }
                return venta;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.cerrar_conexion();
            }
        }

        public void agregar(string idCliente)
        {
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("EXEC INSERTAR_VENTA '" + idCliente + "' ");
                con.ejecutar_escritura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.cerrar_conexion();
            }
        }
        
        public void actualizar(Venta venta)
        {
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("EXEC ACTUALIZAR_VENTA_POR_COMPRA '" + venta.id +"', '" + venta.monto + "', '" + venta.fecha.ToString("yyyy/MM/dd") + "', '" + venta.localidad + "', '" + venta.calleEntrega + "', '" + venta.numeroCalleEntrega + "', '" + venta.telefonoEntrega +"', '" + venta.comentario + "', '" + venta.tipoPago.nombre + "'  ");
                con.ejecutar_escritura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.cerrar_conexion();
            }
        }
        public void eliminar(string ventaId)
        {
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("DELETE FROM Ventas WHERE IDVenta='" + ventaId + "' ");
                con.ejecutar_escritura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.cerrar_conexion();
            }
        }
    }
}
