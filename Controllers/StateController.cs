using Contact.Models;
using Microsoft.AspNetCore.Mvc;
using System.Web.Http.Cors;

namespace My.Web.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class StateController : Controller
    {
        
        private readonly ILogger<StateController> _logger;

        public StateController(ILogger<StateController> logger)
        {
            _logger = logger;
        }

        // GET: StateController
        [HttpGet(Name = "GetState")]
        public IEnumerable<State> GetState()
        {
            using (var ctx = new ContactDBContext())
            {
                //Loading students only
                IList<State> states = ctx.States.ToList<State>();

                return states;
            }
        }
    }
}
