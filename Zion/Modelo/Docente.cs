//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Zion.Modelo
{
    using System;
    using System.Collections.Generic;
    
    public partial class Docente : Personas
    {
        public Docente()
        {
            this.Curso = new HashSet<Curso>();
        }
    
        public System.DateTime FechaIngreso { get; set; }
    
        public virtual ICollection<Curso> Curso { get; set; }
    }
}