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
    public partial class perfil : System.Web.UI.Page
    {
        public Usuario usuario;
        public List<Venta> ventasList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                usuario = (Usuario)Session["usuario"];
                DropEstados.Items.Insert(0,new ListItem("Todo","Todo"));
                DropEstados.Items.Insert(1,new ListItem("Recibido", "Recibido"));
                DropEstados.Items.Insert(2,new ListItem("En camino", "En camino"));
                DropEstados.Items.Insert(2,new ListItem("Procesando", "Procesando"));
                VentaNegocio venNego = new VentaNegocio();
                ventasList = new List<Venta>();
                ventasList=venNego.listar("delUsuarioTodo", usuario.id.ToString());
            }
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario");
            Session.Remove("ventaId");
            Response.Redirect("Default.aspx");
        }
    }
}