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
        public static List<Categoria> categoriaList;
        public static List<SubCategoria> subCategoriasList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                agregar_acordion();
            }
            ArticuloNegocio artNego = new ArticuloNegocio();
            articuloList = artNego.listar("todo", "");
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
                detNego.eliminar(detalleVenta.articulo.id.ToString(), Session["ventaId"].ToString());
            }
            Response.Redirect("Default.aspx?accion=" + "eliminado");
        }

        public void agregar_acordion()
        {
            CategoriaNegocio catNego = new CategoriaNegocio();
            categoriaList = new List<Categoria>();
            categoriaList = catNego.listar();

            foreach (var categoria in categoriaList)
            {

                subCategoriasList = new List<SubCategoria>();
                SubCategoriaNegocio subCatNego = new SubCategoriaNegocio();
                subCategoriasList = subCatNego.listar("categoriaId", categoria.nombre.ToString());


                System.Web.UI.WebControls.Label item = new System.Web.UI.WebControls.Label();
                item.Text += "<div class='accordion-item fondo2'>" +
                                "<h6 class='accordion-header p-3 fondo3' id = 'headingOne' " +
                                    "<button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#collapse" + categoria.id + categoria.nombre + "' aria-expanded='false' aria-controls='flush-collapseOne'>" +
                                    categoria.icono +
                                    categoria.nombre +
                                    "</button>" +
                                "</h6> ";
                foreach (var subCate in subCategoriasList)
                {
                    item.Text += "<div id = 'collapse" + categoria.id + categoria.nombre + "' class='accordion-collapse collapse' aria-labelledby='headingOne'>" +
                                    "<div class='accordion-body fondo2'>" +
                                          "<a class='text-decoration-none text-dark' href='sub-categoria.aspx?id=" + subCate.id.ToString() + "' >> " + subCate.nombre.ToString() + "</a> " +

                                    "</div>" +
                                  "</div>";
                }
                item.Text += "</div>";
                labelAccordionItem.Text += item.Text;
            }
        }
    }
}