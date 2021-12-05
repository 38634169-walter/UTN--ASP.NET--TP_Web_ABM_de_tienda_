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
    public partial class sub_categoria : System.Web.UI.Page
    {
        public List<Articulo> articulosList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                ArticuloNegocio artNego = new ArticuloNegocio();
                articulosList = new List<Articulo>();
                articulosList = artNego.listar("subCategoraId",Request.QueryString["id"].ToString());
            }
        }
    }
}