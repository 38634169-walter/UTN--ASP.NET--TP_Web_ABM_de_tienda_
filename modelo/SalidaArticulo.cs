using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace modelo
{
    public class SalidaArticulo
    {
        public int id { get; set; }
        public Stock stock { get; set; }
        public DateTime fecha { get; set; }
        public int cantidad { get; set; }
    }
}
