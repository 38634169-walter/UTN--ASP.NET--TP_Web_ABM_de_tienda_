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
        public Articulo articulo;
        public List<Articulo> articulosList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["id"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                articulosList = new List<Articulo>();
                articulosList = (List<Articulo>)Session["articulosAgregados"];
                int cont = 0;
                bool b = false;
                foreach (var articulo in articulosList)
                {
                    if (articulo.id == id) b = true;
                    if (b == false) cont++;
                }
                articulosList.RemoveAt(cont);
                Session.Add("articulosAgregados",articulosList);
                string accion = "eliminado";
                Response.Redirect("Default.aspx?accion=" + accion);
            }
        }
    }
}