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
    public partial class detalles_de_venta : System.Web.UI.Page
    {
        public List<DetalleVenta> detalleVentasList;
        public Venta venta;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                venta = new Venta();
                VentaNegocio venNego = new VentaNegocio();
                venta=venNego.buscar("id",Request.QueryString["id"].ToString());
                DetalleVentaNegocio detNego = new DetalleVentaNegocio();
                detalleVentasList = new List<DetalleVenta>();
                detalleVentasList = detNego.listar("ventaId",Request.QueryString["id"].ToString());
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