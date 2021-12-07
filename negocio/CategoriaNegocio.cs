using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using modelo;
using conexion;

namespace negocio
{
    public class CategoriaNegocio
    {

        public List<Categoria> listar()
        {
            List<Categoria> listaCat = new List<Categoria>();
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("SELECT * FROM Categorias c, SubCategorias sc WHERE c.IDCategoria = sc.ID_Categoria");
                con.ejecutar_lectura();
                while(con.lector.Read())
                {
                    Categoria cat = new Categoria();
                    cat.id = Convert.ToInt32(con.lector["IDCategoria"]);
                    cat.nombre = (string)con.lector["nombreCat"];
                    cat.subCategoria = new SubCategoria();
                    cat.subCategoria.id = Convert.ToInt32(con.lector["IDSubCategoria"]);
                    cat.subCategoria.nombre = (string)con.lector["nombreSub"];
                    listaCat.Add(cat);
                }
                return listaCat;
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
        public Categoria buscar(string buscarPor, string buscar)
        {
            string consulta = "";
            switch (buscarPor)
            {
                case "nombreCategoria":
                    consulta = "SELECT * FROM Categorias WHERE nombreCat='" + buscar + "' ";
                    break;
            }
            Categoria categoria = new Categoria();
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();
                while(con.lector.Read())
                {
                    categoria.id = Convert.ToInt32(con.lector["IDCategoria"]);
                    categoria.nombre = (string)con.lector["nombreCat"];
                }
                return categoria;
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
