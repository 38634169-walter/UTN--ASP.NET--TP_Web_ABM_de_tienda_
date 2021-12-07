using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.ComponentModel;

namespace modelo
{
    public class Articulo
    {
        public int id { get; set; }

        public Marca marca { get; set; }
        public SubCategoria subCategoria { get; set; }
        public Stock stock { get; set; }
        public string nombre { get; set; }
        public string detalle { get; set; }
        public decimal precio { get; set; }
        public string imagen1 { get; set; }
        public string imagen2 { get; set; }
        public string imagen3 { get; set; }
        public string precioEntero { get; set; }
        public string precioDecimal { get; set; }
        
        public string convertir_precio(string r,decimal precio)
        {
            string precioS = precio.ToString();
            string parteDecimal = "";
            string parteEntera = "";
            int cont = 0;
            bool b = false;
            foreach (var p in precioS)
            {
                if (p == ',' || b == true)
                {
                    cont++;
                    b = true;
                }
                if (cont > 1 && cont <=3 )
                {
                    parteDecimal += p;
                }
                if(cont == 0)
                {
                    parteEntera += p;
                }
            }
            if (r == "entero") return parteEntera;
            if (r == "decimal")
            {
                if (parteDecimal.Trim() == "") parteDecimal="00";
                return parteDecimal;
            }
            return "";
        }
    }

}
