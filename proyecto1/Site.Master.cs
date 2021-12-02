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
    public partial class SiteMaster : MasterPage
    {
        public List<DetalleVenta> detalleVentasList;
        public Articulo art;
        public static Usuario usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            detalleVentasList = new List<DetalleVenta>();
            if (Session["usuario"] != null)
            {
                if(Session["articulosAgregados"] != null)
                {
                    detalleVentasList = (List<DetalleVenta>)Session["articulosAgregados"];
                    usuario = new Usuario();
                    usuario = (Usuario)Session["usuario"];
                    VentaNegocio venNego = new VentaNegocio();
                    venNego.agregar(usuario.id.ToString());
                    foreach(var d in detalleVentasList)
                    {
                        DetalleVentaNegocio detNego = new DetalleVentaNegocio();
                    }
                    Session.Remove("articulosAgregados");
                }


                usuario = new Usuario();
                usuario = (Usuario)Session["usuario"];
                labelUsuario.Text = usuario.usuario;
            }

            if(Session["articulosAgregados"] != null) detalleVentasList = (List<DetalleVenta>)Session["articulosAgregados"];
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombreArticulo = TextBoxBuscador.Text;
            Response.Redirect("busqueda.aspx?buscar="+ nombreArticulo);
        }

        protected void buttonComprar_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] == null) Response.Redirect("registrarse.aspx?noRegistrado=" + "noRegistrado");
            Response.Redirect("carrito.aspx");
        }

        protected void buttonPerfilRegistrar_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Response.Redirect("perfil.aspx");
            }
            Response.Redirect("login.aspx");
        }
    }
}