using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using modelo;
using conexion;

namespace negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> listar(string buscarPor, string buscar)
        {
            string consulta="";
            switch (buscarPor)
            {
                case "todo":
                    consulta = "SELECT * FROM Articulos a, Categorias c, SubCategorias sc, Marcas m WHERE a.ID_Marca=m.IDMarca AND a.ID_SubCategoria=sc.IDSubCategoria AND sc.ID_Categoria=c.IDCategoria";
                    break;
                case "nombre":
                    consulta= "SELECT * FROM Articulos a, Categorias c, SubCategorias sc, Marcas m WHERE a.ID_Marca=m.IDMarca AND a.ID_SubCategoria=sc.IDSubCategoria AND sc.ID_Categoria=c.IDCategoria AND  a.nombreArt LIKE '%"+buscar+"%' " ;
                    break;
                case "subCategoraId":
                    consulta = "SELECT * FROM Articulos a, Categorias c, SubCategorias sc, Marcas m WHERE a.ID_Marca=m.IDMarca AND a.ID_SubCategoria=sc.IDSubCategoria AND sc.ID_Categoria=c.IDCategoria AND sc.IDSubCategoria='" + buscar + "' ";
                    break;

            }

            List<Articulo> listaArticulo = new List<Articulo>();
            ConexionDB con = new ConexionDB();

            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();

                while (con.lector.Read())
                {
                    Articulo art = new Articulo();
                    art.id = Convert.ToInt32(con.lector["IDArticulo"]);
                    art.nombre = (string)con.lector["nombreArt"];
                    art.detalle = (string)con.lector["detalles"];
                    if (!(con.lector["imagen1"] is DBNull)) art.imagen1 = (string)con.lector["imagen1"];                    
                    art.precio = Convert.ToDecimal(con.lector["precio"]);
                    art.precioDecimal=art.convertir_precio("decimal",art.precio);
                    art.precioEntero=art.convertir_precio("entero", art.precio);
                    art.subCategoria = new SubCategoria();
                    art.subCategoria.id = Convert.ToInt32(con.lector["IDSubCategoria"]);
                    art.subCategoria.nombre = (string)con.lector["nombreSub"];

                    art.subCategoria.categoria = new Categoria();
                    art.subCategoria.categoria.id = Convert.ToInt32(con.lector["IDCategoria"]);
                    art.subCategoria.categoria.nombre = (string)con.lector["nombreCat"];                    
                    art.marca = new Marca();
                    art.marca.id = Convert.ToInt32(con.lector["IDMarca"]);
                    art.marca.nombre = (string)con.lector["nombreMar"];
                    listaArticulo.Add(art);
                }
                return listaArticulo;
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

        public Articulo buscar(string buscarPor, string buscar)
        {
            string consulta = "";
            switch (buscarPor)
            {
                case "id":
                    consulta = "SELECT * FROM Articulos a, Categorias c, SubCategorias sc, Marcas m WHERE a.ID_Marca=m.IDMarca AND a.ID_SubCategoria=sc.IDSubCategoria AND sc.ID_Categoria=c.IDCategoria AND  a.IDArticulo = '" + buscar + "' ";
                    break;
            }

            ConexionDB con = new ConexionDB();
            Articulo art = new Articulo();
            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();
                while (con.lector.Read())
                {
                    art.id = Convert.ToInt32(con.lector["IDArticulo"]);
                    art.nombre = (string)con.lector["nombreArt"];
                    art.detalle = (string)con.lector["detalles"];
                    if (!(con.lector["imagen1"] is DBNull)) art.imagen1 = (string)con.lector["imagen1"];
                    if (!(con.lector["imagen2"] is DBNull)) art.imagen2 = (string)con.lector["imagen2"];
                    if (!(con.lector["imagen3"] is DBNull)) art.imagen3 = (string)con.lector["imagen3"];
                    art.precio = Convert.ToDecimal(con.lector["precio"]);
                    art.precioDecimal = art.convertir_precio("decimal", art.precio);
                    art.precioEntero = art.convertir_precio("entero", art.precio);
                    art.subCategoria = new SubCategoria();
                    art.subCategoria.id = Convert.ToInt32(con.lector["IDSubCategoria"]);
                    art.subCategoria.nombre = (string)con.lector["nombreSub"];
                    art.subCategoria.categoria = new Categoria();
                    art.subCategoria.categoria.id = Convert.ToInt32(con.lector["IDCategoria"]);
                    art.subCategoria.categoria.nombre = (string)con.lector["nombreCat"];
                    art.marca = new Marca();
                    art.marca.id = Convert.ToInt32(con.lector["IDMarca"]);
                    art.marca.nombre = (string)con.lector["nombreMar"];
                }
                return art;
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
