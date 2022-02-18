using System;
using System.Collections.Generic;

namespace Contact.Models
{
    public partial class Contact
    {
        public long ContactId { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string StreetAddress { get; set; } = null!;
        public string City { get; set; } = null!;
        public string StateCode { get; set; } = null!;
        public string ZipCode { get; set; } = null!;
        public string PhoneNumber { get; set; } = null!;
        public string? Note { get; set; }
    }
}
