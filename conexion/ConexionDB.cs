using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;

namespace conexion
{
    public class ConexionDB
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        public SqlDataReader lector { get; set; }

        public ConexionDB()
        {
            conexion = new SqlConnection("server=.\\SQLEXPRESS; database=TIENDA; integrated security=true");
            comando = new SqlCommand();
        }
        public void consultar(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }
        public void abrir_conexion_y_consultar()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void abrir_conexion_y_ejecutar()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void setear(string clave, object valor)
        {
            comando.Parameters.AddWithValue(clave, valor);
        }

        public void cerrar_conexion()
        {
            if (lector != null) lector.Close();
            conexion.Close();
        }
    }
}
