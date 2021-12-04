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
    public partial class verArticulo : System.Web.UI.Page
    {
        public static Articulo articulo;
        public DetalleVenta detalleVenta;
        public static List<DetalleVenta> detalleVentaList;
        public static string ventaId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                ArticuloNegocio artNego = new ArticuloNegocio();
                articulo = artNego.buscar("id",Request.QueryString["id"].ToString());
            }
            if (!IsPostBack)
            {
                LabelCantidad.Text = "1";
            }
        }

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            detalleVentaList = new List<DetalleVenta>();
            detalleVenta = new DetalleVenta();
            if (validar_producto_existente())
            {
                detalleVenta.cantidad = Convert.ToInt32(LabelCantidad.Text);
                detalleVenta.articulo = new Articulo();
                detalleVenta.articulo = articulo;
                if(Session["usuario"] != null) {
                    detalleVenta.venta = new Venta();
                    detalleVenta.venta.id =Convert.ToInt32(Session["ventaId"]);
                    DetalleVentaNegocio detNego = new DetalleVentaNegocio();
                    detNego.agregar(detalleVenta);
                }
                else
                {
                    if (Session["articulosAgregados"] != null)
                    {
                        detalleVentaList = (List<DetalleVenta>)Session["articulosAgregados"];
                    }
                    detalleVentaList.Add(detalleVenta);
                    Session.Add("articulosAgregados", detalleVentaList);
                }
                string agregado = "agregado";
                Response.Redirect("Default.aspx?accion=" + agregado);
            }
        }

        protected void buttonMenos_Click(object sender, EventArgs e)
        {
            int cant = Convert.ToInt32(LabelCantidad.Text);
            if (cant - 1 > 0) {
                cant = cant - 1;
                LabelCantidad.Text = cant.ToString();
            }
        }

        protected void buttonMas_Click(object sender, EventArgs e)
        {
            int cant = Convert.ToInt32(LabelCantidad.Text);
            cant = cant + 1;
            LabelCantidad.Text = cant.ToString();
        }

        public bool validar_producto_existente()
        {
            if (Session["articulosAgregados"] != null) detalleVentaList = (List<DetalleVenta>)Session["articulosAgregados"];
            if(Session["usuario"] != null)
            {
                Usuario usuario = new Usuario();
                usuario = (Usuario)Session["usuario"];
                ventaId = Session["ventaId"].ToString();
                DetalleVentaNegocio detNego = new DetalleVentaNegocio();
                detalleVentaList = detNego.listar("ventaId_EnCarrito", ventaId);
            }

            bool encontrado = false;
            foreach (var det in detalleVentaList)
            {
                if (det.articulo.id == Convert.ToInt32(Request.QueryString["id"]))
                {
                    encontrado = true;
                }
            }
            if (encontrado == true)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "confirmar", "confirmarDesicion('" + "abrir" + "');", true);
                return false;
            }
            return true;
        }

        protected void buttonConfrmarAgregar_Click(object sender, EventArgs e)
        {
            foreach (var det in detalleVentaList)
            {
                if (det.articulo.id == Convert.ToInt32(Request.QueryString["id"]))
                {
                    det.cantidad += Convert.ToInt32(LabelCantidad.Text);
                }
            }
            Session.Add("articulosAgregados", detalleVentaList);
            string agregado = "agregado";
            Response.Redirect("Default.aspx?accion=" + agregado);
        }

        protected void buttonCerrar_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "confirmar", "confirmarDesicion('" + "cerrar" + "');", true);
        }
    }
}