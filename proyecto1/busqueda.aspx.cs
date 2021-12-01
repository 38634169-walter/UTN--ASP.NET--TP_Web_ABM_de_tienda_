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
    public partial class busqueda : System.Web.UI.Page
    {
        public List<Articulo> articuloList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["buscar"] != null)
            {
                ArticuloNegocio artNego = new ArticuloNegocio();
                articuloList = artNego.listar("nombre", Request.QueryString["buscar"].ToString());
            }
        }
    }
}