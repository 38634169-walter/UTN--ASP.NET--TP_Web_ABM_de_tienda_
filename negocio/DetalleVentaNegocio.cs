using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using modelo;
using conexion;

namespace negocio
{
    public class DetalleVentaNegocio
    {
        public List<DetalleVenta> listar(string buscarPor,string buscar)
        {
            string consulta = "";
            switch(buscarPor)
            {
                case "ventaId_EnCarrito":
                    consulta = "SELECT * FROM DetallesDeVentas dv, Articulos a, Marcas m, EstadosVentas ev, Ventas v WHERE dv.ID_Articulo=a.IDArticulo AND a.ID_Marca=m.IDMarca AND v.IDVenta=dv.ID_Venta AND v.ID_EstadoVenta=ev.IDEstadoVenta AND dv.ID_Venta = '" + buscar + "' AND ev.nombreEst='En carrito' AND dv.estado <> 0";
                    break;
                case "ventaId":
                    consulta = "SELECT * FROM DetallesDeVentas dv, Articulos a, Marcas m, EstadosVentas ev, Ventas v WHERE dv.ID_Articulo=a.IDArticulo AND a.ID_Marca=m.IDMarca AND v.IDVenta=dv.ID_Venta AND v.ID_EstadoVenta=ev.IDEstadoVenta AND dv.ID_Venta = '" + buscar + "' AND dv.estado <> 0";
                    break;
            }
            List<DetalleVenta> detalleVentaList = new List<DetalleVenta>();
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();
                while (con.lector.Read())
                {
                    DetalleVenta detalleVenta = new DetalleVenta();
                    detalleVenta.id = Convert.ToInt32(con.lector["IDDetalleVenta"]);
                    detalleVenta.cantidad  = Convert.ToInt32(con.lector["cantidad"]);
                    detalleVenta.precioALaFecha = Convert.ToDecimal(con.lector["precioALaFecha"]);
                    detalleVenta.articulo = new Articulo();
                    detalleVenta.articulo.id  = Convert.ToInt32(con.lector["IDArticulo"]);
                    detalleVenta.articulo.nombre  = (string)con.lector["nombreArt"];
                    detalleVenta.articulo.precio=Convert.ToDecimal(con.lector["precio"]);
                    detalleVenta.articulo.precioDecimal = detalleVenta.articulo.convertir_precio("decimal", detalleVenta.articulo.precio);
                    detalleVenta.articulo.precioEntero = detalleVenta.articulo.convertir_precio("entero", detalleVenta.articulo.precio);

                    detalleVenta.articulo.imagen1= (string)con.lector["imagen1"];
                    detalleVenta.articulo.marca= new Marca ();
                    detalleVenta.articulo.marca.id= Convert.ToInt32(con.lector["IDMarca"]);
                    detalleVenta.articulo.marca.nombre = (string)con.lector["nombreMar"];
                    detalleVentaList.Add(detalleVenta);
                }
                return detalleVentaList;
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
        public void agregar(DetalleVenta det)
        {
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("INSERT INTO DetallesDeVentas(ID_Venta,ID_Articulo,cantidad,precioALaFecha) VALUES (@venta,@articulo,@cantidad,@precioALaFecha) ");
                con.setear("@venta",det.venta.id);
                con.setear("@articulo",det.articulo.id);
                con.setear("@cantidad",det.cantidad);
                con.setear("@precioALaFecha", det.articulo.precio);
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
        public void eliminar(string articuloId,string ventaId)
        {
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("EXEC ELIMINAR_DETALLE_VENTA '" + articuloId + "', '" + ventaId + "' ");
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
