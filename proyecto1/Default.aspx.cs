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
        public static List<SubCategoria> subCategoriasList;
        public static bool b = false;
        public static bool b2 = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                b = false;
                b2 = false;
            }
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

        protected void buttonElectrodomesticos_Click(object sender, EventArgs e)
        {
            if (b == false)
            {
                SubCategoriaNegocio subCatNego = new SubCategoriaNegocio();
                subCategoriasList = new List<SubCategoria>();
                subCategoriasList = subCatNego.listar("categoriaId", "Electrodomesticos");
                foreach (var el in subCategoriasList)
                {
                    labelElectrodomesticos.Text += "<a class='ms-4 text-decoration-none text-dark' href='sub-categoria.aspx?id=" + el.id + "'> > " + el.nombre + "</a> </br>";
                }
                b = true;
            }
            else
            {
                labelElectrodomesticos.Text = "";
                b = false;
            }
        }

        protected void buttonRopa_Click(object sender, EventArgs e)
        {
            if (b2 == false)
            {
                SubCategoriaNegocio subCatNego = new SubCategoriaNegocio();
                subCategoriasList = new List<SubCategoria>();
                subCategoriasList = subCatNego.listar("categoriaId", "Ropa");
                foreach (var el in subCategoriasList)
                {
                    labelRopa.Text += "<a class='ms-4 text-decoration-none text-dark' href='sub-categoria.aspx?id=" + el.id + "'> > " + el.nombre + "</a> </br>";
                }
                b2 = true;
            }
            else
            {
                labelRopa.Text = "";
                b2 = false;
            }
        }
    }
}