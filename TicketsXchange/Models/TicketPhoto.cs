//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TicketsXchange.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TicketPhoto
    {
        public int Id { get; set; }
        public Nullable<int> TicketId { get; set; }
        public string Url { get; set; }
        public Nullable<System.DateTime> CreatedAt { get; set; }
    
        public virtual Ticket Ticket { get; set; }
    }
}
