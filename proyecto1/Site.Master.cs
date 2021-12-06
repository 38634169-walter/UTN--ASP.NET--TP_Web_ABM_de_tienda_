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
    public partial class SiteMaster : MasterPage
    {
        public List<DetalleVenta> detalleVentasList;
        public static List<SubCategoria> subCategoriasList;
        public List<Categoria> categoriasList;
        public Articulo art;
        public static Usuario usuario;
        public string ventaId;
        public static bool b=false;
        public static bool b2=false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                b = false;
                b2 = false;
            }
            detalleVentasList = new List<DetalleVenta>();
            categoriasList = new List<Categoria>();
            CategoriaNegocio catNego = new CategoriaNegocio();
            categoriasList=catNego.listar();

            if (Session["usuario"] != null)
            {
                usuario = new Usuario();
                usuario = (Usuario)Session["usuario"];
                labelUsuario.Text = usuario.usuario;

                if (Session["articulosAgregados"] != null)
                {
                    detalleVentasList = (List<DetalleVenta>)Session["articulosAgregados"];
                    VentaNegocio venNego = new VentaNegocio();
                    venNego.agregar(usuario.id.ToString());
                    Venta venta = new Venta();
                    venta = venNego.buscar("ultima venta", usuario.id.ToString());
                    if (Session["ventaId"] == null) Session.Add("ventaId", venta.id);
                    foreach (var det in detalleVentasList)
                    {
                        det.venta = new Venta();
                        det.venta.id = venta.id;
                        DetalleVentaNegocio detNego = new DetalleVentaNegocio();
                        detNego.agregar(det);
                    }
                    Session.Remove("articulosAgregados");
                }
                else
                {
                    if (Session["ventaId"] == null)
                    {
                        Venta venta = new Venta();
                        VentaNegocio venNego = new VentaNegocio();
                        venta = venNego.buscar("ultima venta", usuario.id.ToString());
                        if (venta.id != 0)
                        {
                            Session.Add("ventaId", venta.id);
                            DetalleVentaNegocio detNego = new DetalleVentaNegocio();
                            detalleVentasList = detNego.listar("ventaId_EnCarrito", Session["ventaId"].ToString());
                            if (detalleVentasList.Count > 0) ScriptManager.RegisterStartupScript(this, typeof(Page), "abrir", "confirmarDesicion('" + "abrir" + "');", true);
                        }
                    }
                    else
                    {
                        DetalleVentaNegocio detNego = new DetalleVentaNegocio();
                        detalleVentasList = detNego.listar("ventaId_EnCarrito", Session["ventaId"].ToString());
                    }
                }

            }
            if (Session["articulosAgregados"] != null) detalleVentasList = (List<DetalleVenta>)Session["articulosAgregados"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombreArticulo = TextBoxBuscador.Text;
            Response.Redirect("busqueda.aspx?buscar="+ nombreArticulo);
        }

        protected void buttonComprar_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] == null) Response.Redirect("registrarse.aspx?noRegistrado=" + "noRegistrado");
            Response.Redirect("carrito.aspx");
        }

        protected void buttonPerfilRegistrar_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Response.Redirect("perfil.aspx");
            }
            Response.Redirect("login.aspx");
        }

        protected void buttonElectrodomesticos_Click(object sender, EventArgs e)
        {
            if (b==false)
            {
                SubCategoriaNegocio subCatNego = new SubCategoriaNegocio();
                subCategoriasList = new List<SubCategoria>();
                subCategoriasList = subCatNego.listar("categoriaId", "Electrodomesticos");
                foreach (var el in subCategoriasList)
                {
                    labelElectrodomesticos.Text += "<a class='ms-4' href='sub-categoria.aspx?id=" + el.id + "'> > " + el.nombre + "</a> </br>";
                }
                b = true;
            }
            else
            {
                labelElectrodomesticos.Text="";
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
                    labelRopa.Text += "<a class='ms-4' href='sub-categoria.aspx?id=" + el.id + "'> > " + el.nombre + "</a> </br>";
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