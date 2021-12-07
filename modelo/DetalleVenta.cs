using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace modelo
{
    public class DetalleVenta
    {
        public int id { get; set; }
        public Venta venta { get; set; }
        public Articulo articulo {get;set;}
        public int cantidad { get; set; }
        public decimal precioALaFecha { get; set; }

    }
}
