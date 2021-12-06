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
        public static decimal total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["usuario"]!= null) {
                usuario = (Usuario)Session["usuario"];
                DetalleVentaNegocio venNego = new DetalleVentaNegocio();
                detalleVentaList = new List<DetalleVenta>();
                detalleVentaList=venNego.listar("ventaId_EnCarrito", Session["ventaId"].ToString());
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                total = 0;
            }
        }

        protected void buttonPagar_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                labelError.Text = "";
                if (validarRadio())
                {
                    Venta venta = new Venta();
                    venta.id = Convert.ToInt32(Session["ventaId"]);
                    venta.monto = Math.Truncate(total / 100) * 100;
                    venta.fecha = DateTime.Now;
                    venta.localidad = txbLocalidad.Text;
                    venta.calleEntrega = txbCalle.Text;
                    venta.numeroCalleEntrega = Convert.ToInt32(txbNumero.Text);
                    venta.telefonoEntrega = txbTelefono.Text;
                    venta.comentario = txbComentario.Text;
                    venta.tipoPago = new tipoPago();
                    if (radioDebito.Checked == true) venta.tipoPago.nombre = "Debito";
                    if (radioCredito.Checked == true) venta.tipoPago.nombre = "Credito";
                    if (radioCheque.Checked == true) venta.tipoPago.nombre = "Cheque";
                    if (radioEfectivo.Checked == true) venta.tipoPago.nombre = "Efectivo";

                    VentaNegocio venNego = new VentaNegocio();
                    venNego.actualizar(venta);
                    Session.Remove("ventaId");
                    Response.Redirect("perfil.aspx?comprado=" + "comprado");
                }
                else
                {
                    labelError.Text = "*Se debe ingresar un medio de pago";
                }
            }
        }
        public bool validarRadio()
        {
            bool validar = false;
            if (radioCheque.Checked == true || radioCredito.Checked == true || radioDebito.Checked == true || radioEfectivo.Checked  == true) validar = true;
            return validar;
        }
    }
}