using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using modelo;
using conexion;

namespace negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> listar(string buscarPor, string buscar)
        {
            string consulta = "";
            switch (buscarPor)
            {
                case "todo":
                    consulta = "SELECT * FROM Usuarios u, DatosPersonales dp WHERE u.IDUsuario = dp.IDDatosPersonales";
                    break;
            }

            List<Usuario> usuarioList = new List<Usuario>();
            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();
                while (con.lector.Read())
                {
                    Usuario usu = new Usuario();
                    usu.nombre = (string)con.lector["nombreDat"];
                    usu.apellido = (string)con.lector["apellidoDat"];
                    usu.dni = (string)con.lector["dni"];
                    usu.sexo = (string)con.lector["sexo"];
                    usu.fechaNacimiento = Convert.ToDateTime(con.lector["fechaNacimiento"]);
                    usu.email = (string)con.lector["email"];
                    usu.codigoPostal = (string)con.lector["codigoPostal"];
                    usu.clave = (string)con.lector["clave"];
                    usu.usuario = (string)con.lector["usuario"];
                    usuarioList.Add(usu);
                }
                return usuarioList;
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

        public Usuario buscar(string buscarPor, string buscar,string buscar2)
        {
            Usuario usu = new Usuario();
            ConexionDB con = new ConexionDB();
            string consulta = "";
            switch (buscarPor)
            {
                case "usuarioClave":
                    consulta = "SELECT * FROM Usuarios u, DatosPersonales dp WHERE u.IDUsuario = dp.IDDatosPersonales AND u.usuario='" + buscar + "' AND u.clave='" + buscar2 + "' ";
                    break;
            }
            try
            {
                con.consultar(consulta);
                con.ejecutar_lectura();
                while (con.lector.Read())
                {
                    usu.id = Convert.ToInt32(con.lector["IDUsuario"]);
                    usu.nombre = (string)con.lector["nombreDat"];
                    usu.apellido = (string)con.lector["apellidoDat"];
                    usu.dni = (string)con.lector["dni"];
                    usu.sexo = (string)con.lector["sexo"];
                    usu.fechaNacimiento = Convert.ToDateTime(con.lector["fechaNacimiento"]);
                    usu.email = (string)con.lector["email"];
                    usu.codigoPostal = (string)con.lector["codigoPostal"];
                    usu.clave = (string)con.lector["clave"];
                    usu.usuario = (string)con.lector["usuario"];
                }
                return usu;
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
        public void agregar(Usuario usu)
        {

            ConexionDB con = new ConexionDB();
            try
            {
                con.consultar("EXEC PS_INSERTAR_USUARIO '" + usu.nombre + "', '" + usu.apellido + "','" + usu.dni +"','" + usu.sexo +"','" + usu.fechaNacimiento.ToString("yyyy/MM/dd") + "','" + usu.email +"','" + usu.codigoPostal +"','" + usu.clave +"','" + usu.usuario +"' ");
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
