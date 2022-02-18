using Contact.Models;
using Microsoft.AspNetCore.Mvc;
using System.Net;
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

        //Post action methods of the previous section
        [HttpPost(Name = "PostContact")]
        public HttpResponseMessage PostNewContact(Contact.Models.Contact contact)
        {
            if (!ModelState.IsValid)
                return new HttpResponseMessage(HttpStatusCode.NotAcceptable);
            var newContact = new Contact.Models.Contact();
            long contactId = 0;

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
                contactId = cnt.ContactId;
            }

            return new HttpResponseMessage(HttpStatusCode.OK);
        }

        //Put action methods of the previous section
        [HttpPut(Name = "PutContact")]
        public HttpResponseMessage PutContact(Contact.Models.Contact contact)
        {
            if (!ModelState.IsValid)
                return new HttpResponseMessage(HttpStatusCode.NotAcceptable);

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
                }
                else
                {
                    new HttpResponseMessage(HttpStatusCode.NotFound);
                }

                ctx.SaveChanges();
            }

            return new HttpResponseMessage(HttpStatusCode.OK);
        }

        //Put action methods of the previous section
        [HttpDelete(Name = "DeleteContact")]
        public HttpResponseMessage DeleteContact(Contact.Models.Contact contact)
        {
            if (!ModelState.IsValid)
                return new HttpResponseMessage(HttpStatusCode.NotAcceptable);

            using (var ctx = new ContactDBContext())
            {
                var dContact = ctx.Contacts
                .Where(c => c.ContactId == contact.ContactId)
                .FirstOrDefault();

                ctx.Entry(dContact).State = Microsoft.EntityFrameworkCore.EntityState.Deleted;
                ctx.SaveChanges();
            }

            return new HttpResponseMessage(HttpStatusCode.OK);
        }
    }
}