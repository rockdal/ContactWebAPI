using Contact.Models;
using Microsoft.AspNetCore.Mvc;
using System.Web.Http.Cors;

namespace My.Web.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ContactController : Controller
    {

        private readonly ILogger<ContactController> _logger;

        public ContactController(ILogger<ContactController> logger)
        {
            _logger = logger;
        }

        // GET: StateController
        [HttpGet(Name = "GetContact")]
        public IEnumerable<Contact.Models.Contact> GetContact()
        {
            using (var ctx = new ContactDBContext())
            {
                //Loading students only
                IList<Contact.Models.Contact> contacts = ctx.Contacts.ToList<Contact.Models.Contact>();

                return contacts;
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(Contact.Models.Contact))]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult PostNewContact(Contact.Models.Contact contact)
        {
            if (!ModelState.IsValid)
                return NotFound();

            var newContact = new Contact.Models.Contact();

            using (var ctx = new ContactDBContext())
            {
                var cnt = new Contact.Models.Contact()
                {
                    FirstName = contact.FirstName,
                    LastName = contact.LastName,
                    StreetAddress = contact.StreetAddress,
                    City = contact.City,
                    StateCode = contact.StateCode,
                    ZipCode = contact.ZipCode,
                    PhoneNumber = contact.PhoneNumber,
                    Note = contact.Note
                };
                ctx.Contacts.Add(cnt);

                ctx.SaveChanges();

                newContact = cnt;
            }

            return Ok(newContact);
        }

        //Put action methods of the previous section
        [HttpPut]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(Contact.Models.Contact))]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult PutContact(Contact.Models.Contact contact)
        {
            if (!ModelState.IsValid)
                return NotFound();

            using (var ctx = new ContactDBContext())
            {
                var existingStudent = ctx.Contacts.Where(c => c.ContactId == contact.ContactId).FirstOrDefault<Contact.Models.Contact>();

                if (existingStudent != null)
                {
                    existingStudent.FirstName = contact.FirstName;
                    existingStudent.LastName = contact.LastName;
                    existingStudent.StreetAddress = contact.StreetAddress;
                    existingStudent.City = contact.City;
                    existingStudent.StateCode = contact.StateCode;
                    existingStudent.ZipCode = contact.ZipCode;
                    existingStudent.PhoneNumber = contact.PhoneNumber;
                    existingStudent.Note = contact.Note;

                    ctx.SaveChanges();
                    return Ok(existingStudent);
                }                
            }

            return NotFound();
        }

        //Put action methods of the previous section
        [HttpDelete]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(Contact.Models.Contact))]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult DeleteContact(Contact.Models.Contact contact)
        {
            if (!ModelState.IsValid)
                return NotFound();

            using (var ctx = new ContactDBContext())
            {
                var dContact = ctx.Contacts
                .Where(c => c.ContactId == contact.ContactId)
                .FirstOrDefault();

                ctx.Entry(dContact).State = Microsoft.EntityFrameworkCore.EntityState.Deleted;
                ctx.SaveChanges();
                return Ok(contact);
            }

            return NotFound();
        }
    }
}