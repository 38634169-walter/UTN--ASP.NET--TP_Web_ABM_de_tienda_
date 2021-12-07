using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using modelo;
using conexion;

namespace negocio
{
    public class MarcaNegocio
    {
        public List<Marca> listar()
        {
            List<Marca> listaMar = new List<Marca>();
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("SELECT * FROM Marcas");
                con.ejecutar_lectura();
                while(con.lector.Read())
                {
                    Marca mar = new Marca();
                    mar.id = Convert.ToInt32(con.lector["IDMarca"]);
                    mar.nombre = (string)con.lector["nombreMar"];
                    listaMar.Add(mar);
                }
                con.cerrar_conexion();
                return listaMar;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
