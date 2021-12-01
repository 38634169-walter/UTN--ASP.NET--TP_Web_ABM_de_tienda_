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
        protected void Page_Load(object sender, EventArgs e)
        {
            detalleVentasList = new List<DetalleVenta>();
            if(Session["articulosAgregados"] != null)
            {
                detalleVentasList = (List<DetalleVenta>)Session["articulosAgregados"];
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombreArticulo = TextBoxBuscador.Text;
            Response.Redirect("busqueda.aspx?buscar="+ nombreArticulo);
        }

        protected void buttonComprar_Click(object sender, EventArgs e)
        {
            if (Session["logged"] == null) Response.Redirect("registrarse.aspx?noRegistrado=" + "noRegistrado");
        }
    }
}