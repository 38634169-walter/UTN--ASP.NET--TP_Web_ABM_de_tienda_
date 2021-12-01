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
    public partial class registrarse : System.Web.UI.Page
    {
        public List<Usuario> usuariosList;
        public Usuario usuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                dropSexo.DataBind();
                dropSexo.Items.Insert(0, new ListItem("Masculino", "Masculino"));
                dropSexo.Items.Insert(1, new ListItem("Femenino", "Femenino"));
            }
            if (Request.QueryString["noRegistrado"] != null)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "abrir", "confirmarDesicion('" + "abrir" + "');", true);
            }

        }

        protected void buttonRegistrar_Click(object sender, EventArgs e)
        {
            usuarioError.Text = "";
            emailError.Text = "";
            UsuarioNegocio usuNego = new UsuarioNegocio();
            usuariosList = new List<Usuario>();
            usuariosList=usuNego.listar("todo", "");
            bool validar = true;
            foreach (var usu in usuariosList)
            {
                if (usu.usuario == txbUsuario.Text) usuarioError.Text = "*El usuario ya existe";
                if (usu.email == txbEmail.Text) emailError.Text = "*El mail ya esta registrado";
                if (usu.email == txbEmail.Text || usu.usuario == txbUsuario.Text) validar = false;
            }
            
            if(validar==true)
            {
                usuario = new Usuario();
                usuario.nombre = txbNombre.Text;
                usuario.apellido= txbApellido.Text;
                usuario.dni = txbDni.Text;
                usuario.sexo= dropSexo.SelectedValue;
                usuario.fechaNacimiento= Convert.ToDateTime(txbFechaNacimiento.Text);
                usuario.email= txbEmail.Text;
                usuario.codigoPostal= (string)txbCodigoPostal.Text;
                usuario.clave= txbClave.Text;
                usuario.usuario= txbUsuario.Text;
                usuNego.agregar(usuario);
                Response.Redirect("Default.aspx?accion=" + "agregado");
            }
           
        }

        protected void buttonCerrarModal_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "cerrar", "confirmarDesicion('" + "cerrar" + "');", true);
        }
    }
}