//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace wa_ContableGaf
{
    using System;
    using System.Collections.Generic;
    
    public partial class catTipoOperadora
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public catTipoOperadora()
        {
            this.catOperadoras = new HashSet<catOperadoras>();
        }
    
        public int ClaveTipoOperadoraID { get; set; }
        public string ClaveTipoOperadora { get; set; }
        public Nullable<int> EstatusRegistroID { get; set; }
        public Nullable<System.Guid> UsuarioID { get; set; }
        public Nullable<System.DateTime> Fecha { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<catOperadoras> catOperadoras { get; set; }
    }
}
