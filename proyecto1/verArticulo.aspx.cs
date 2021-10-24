﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using modelo;
using negocio;

namespace proyecto1
{
    public partial class verArticulo : System.Web.UI.Page
    {
        public Articulo articulo = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) return;
            ArticuloNegocio artNego = new ArticuloNegocio();
            int artID = Convert.ToInt32(Request.QueryString["id"]);
            articulo = artNego.buscar_por_id(artID);
        }
    }
}