
namespace NLogApp.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Logging;

    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : Controller
    {
        private readonly ILogger logger;

        public ValuesController(ILogger<ValuesController> logger)
        {
            this.logger = logger;
        }

        [HttpGet]
        public string Get()
        {
            this.logger.LogInformation("ValuesController Get Api Invite");
            return "ValuesController Get Api Invite";
        }
    }
}
