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
        public static List<Articulo> articulosList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                ArticuloNegocio artNego = new ArticuloNegocio();
                int artID = Convert.ToInt32(Request.QueryString["id"]);
                articulo = artNego.buscar_por_id(artID);
            }
            if (!IsPostBack)
            {
                LabelCantidad.Text = "1";
            }
        }

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            articulosList = new List<Articulo>();
            if (validar_producto_existente())
            {
                articulo.cantidad = Convert.ToInt32(LabelCantidad.Text);
                if (Session["articulosAgregados"] != null)
                {
                    articulosList = (List<Articulo>)Session["articulosAgregados"];
                }
                articulosList.Add(articulo);
                Session.Add("articulosAgregados", articulosList);
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
            if (Session["articulosAgregados"] != null)
            {
                articulosList = (List<Articulo>)Session["articulosAgregados"];
                bool encontrado = false;
                foreach (var art in articulosList)
                {
                    if (art.id == Convert.ToInt32(Request.QueryString["id"]))
                    {
                        encontrado = true;
                    }
                }
                if (encontrado == true)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "confirmar", "confirmarDesicion('" + "abrir" + "');", true);
                    return false;
                }
            }
            return true;
        }

        protected void buttonConfrmarAgregar_Click(object sender, EventArgs e)
        {
            foreach (var art in articulosList)
            {
                if (art.id == Convert.ToInt32(Request.QueryString["id"]))
                {
                    art.cantidad += Convert.ToInt32(LabelCantidad.Text);
                }
            }
            Session.Add("articulosAgregados", articulosList);
            string agregado = "agregado";
            Response.Redirect("Default.aspx?accion=" + agregado);
        }

        protected void buttonCerrar_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "confirmar", "confirmarDesicion('" + "cerrar" + "');", true);
        }
    }
}