using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace modelo
{
    public class Categoria
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public SubCategoria subCategoria { get; set; }
        public override string ToString()
        {
            return nombre;
        }
    }
}
