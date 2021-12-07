using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using modelo;
using conexion;

namespace negocio
{
    public class SubCategoriaNegocio
    {
        public List<SubCategoria> listar(string buscarPor, string buscar)
        {
            string consulta = "";
            switch (buscarPor)
            {
                case "categoriaId":
                    consulta = "SELECT * FROM SubCategorias sc, Categorias c WHERE sc.ID_Categoria = c.IDCategoria AND c.nombreCat='" + buscar +  "' ";
                    break;
            }
            ConexionDB con = new ConexionDB();
            List<SubCategoria> subCategoriasList = new List<SubCategoria>();
            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();
                while (con.lector.Read())
                {
                    SubCategoria subC = new SubCategoria();
                    subC.id = Convert.ToInt32(con.lector["IDSubCategoria"]);
                    subC.nombre = (string)con.lector["nombreSub"];
                    subC.categoria = new Categoria();
                    subC.categoria.id= Convert.ToInt32(con.lector["IDCategoria"]);
                    subC.categoria.nombre= (string)con.lector["nombreCat"];
                    subCategoriasList.Add(subC);
                }
                return subCategoriasList;
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
