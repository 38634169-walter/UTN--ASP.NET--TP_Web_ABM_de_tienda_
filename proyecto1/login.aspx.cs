using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using modelo;
using negocio;

namespace proyecto1
{
    public partial class login : System.Web.UI.Page
    {
        public Usuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void buttonIngresar_Click(object sender, EventArgs e)
        {
            labelError.Text = "";
            UsuarioNegocio usuNego = new UsuarioNegocio();
            usuario = new Usuario();
            usuario=usuNego.buscar("usuarioClave", txbUsuario.Text,txbClave.Text);
            if(usuario.id != 0)
            {
                Session.Add("usuario",usuario);
                Response.Redirect("Default.aspx");
            }
            else
            {
                labelError.Text = "*Usuario y/o contraseña incorrecto";
            }
        }
    }
}