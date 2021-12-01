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
    public partial class quitarArticulo : System.Web.UI.Page
    {
        public List<DetalleVenta> detalleVentasList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["id"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                detalleVentasList = new List<DetalleVenta>();
                detalleVentasList = (List<DetalleVenta>)Session["articulosAgregados"];
                int cont = 0;
                bool b = false;
                foreach (var det in detalleVentasList)
                {
                    if (det.articulo.id == id) b = true;
                    if (b == false) cont++;
                }
                detalleVentasList.RemoveAt(cont);
                Session.Add("articulosAgregados",detalleVentasList);
                string accion = "eliminado";
                Response.Redirect("Default.aspx?accion=" + accion);
            }
        }
    }
}