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
    public partial class carrito : System.Web.UI.Page
    {
        public static Usuario usuario;
        public List<DetalleVenta> detalleVentaList;
        public decimal total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["usuario"]!= null) {
                usuario = (Usuario)Session["usuario"];
                DetalleVentaNegocio venNego = new DetalleVentaNegocio();
                detalleVentaList = new List<DetalleVenta>();
                detalleVentaList=venNego.listar("ventaId_EnCarrito", Session["ventaId"].ToString());
            }
            if (!IsPostBack)
            {
                total = 0;
            }
        }

        protected void buttonPagar_Click(object sender, EventArgs e)
        {

        }
    }
}