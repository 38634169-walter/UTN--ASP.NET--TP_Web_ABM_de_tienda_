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
    public partial class _Default : Page
    {
        public List<Articulo> articuloList;
        public List<DetalleVenta> detalleVentaList;
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio artNego = new ArticuloNegocio();
            articuloList = artNego.listar("todo","");
            if (Request.QueryString["accion"] != null && !IsPostBack)
            {
                if (Request.QueryString["accion"] == "agregado") ScriptManager.RegisterStartupScript(this, typeof(Page), "agregado", "agregado();", true);
                if (Request.QueryString["accion"] == "eliminado") ScriptManager.RegisterStartupScript(this, typeof(Page), "eliminado", "eliminado();", true);
            }
        }

        protected void buttonVaciarCarrito_Click(object sender, EventArgs e)
        {

            DetalleVentaNegocio detNego = new DetalleVentaNegocio();

            detalleVentaList = detNego.listar("ventaId", Session["ventaId"].ToString());

            foreach (var detalleVenta in detalleVentaList)
            {
                detNego.eliminar(detalleVenta.articulo.id.ToString(),Session["ventaId"].ToString());
            }
            Response.Redirect("Default.aspx?accion="+"eliminado");
        }
    }
}