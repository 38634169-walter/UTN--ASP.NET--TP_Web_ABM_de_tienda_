using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace modelo
{
    public class Venta
    {
        public int id { get; set; }
        public EstadoVenta estado { get; set; }
        public DatosPersonales cliente { get; set; }
        public tipoPago tipoPago { get; set; }
        public DateTime fecha { get; set; }
        public decimal monto { get; set; }
        public string localidad { get; set; }
        public string calleEntrega { get; set; }
        public int numeroCalleEntrega {get;set;}
        public string telefonoEntrega { get; set; }
        public string comentario { get; set; }

    }
}
