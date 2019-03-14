
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
            this.logger.LogTrace("Trace::ValuesController Get Api Invite");
            this.logger.LogInformation("Info::ValuesController Get Api Invite");
            this.logger.LogError("Error::ValuesController Get Api Invite");
            return "ValuesController Get Api Invite";
        }
    }
}
