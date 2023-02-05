using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication.Models;
using DAL.Models;

namespace WebApplication.Controllers
{
    public class AccountController : Controller
    {
        POC_MarketplaceEntities objPOC_MarketplaceEntities = new POC_MarketplaceEntities();
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        

        public ActionResult Register()
        {
            UserModel objUserModel= new UserModel();
            return View(objUserModel);
        }
        [HttpPost]
        public ActionResult Register([Bind] UserModel objUserModel, string user_name, string user_email, string user_password)
        {
            if (ModelState.IsValid)
            {
                if (!objPOC_MarketplaceEntities.tblUsers.Any(m => m.User_Email == objUserModel.User_Email))
                {
                    objPOC_MarketplaceEntities.AddUserInfo(user_name, user_email, user_password);
                    objPOC_MarketplaceEntities.SaveChanges();
                    objUserModel.SuccessMessage = "User is Successfully Added";
                    return RedirectToAction("Login", "Account");
                }
                else
                {
                    ModelState.AddModelError("Error", "Email already exists");
                    return View();
                }
                

            }
            return View();
        }

        public ActionResult Login() {
            LoginModel objLoginModel = new LoginModel();
            return View(objLoginModel);
        }
        [HttpPost]
        public ActionResult Login(LoginModel objLoginModel)
        {
            if (ModelState.IsValid) 
            {
                if(objPOC_MarketplaceEntities.tblUsers.Where(m=>m.User_Email == objLoginModel.User_Email && m.User_Password == objLoginModel.User_Password).FirstOrDefault() == null)
                {
                    ModelState.AddModelError("Error", "Invalid Email or Password");
                    return View();
                }
                else
                {
                    Session["Email"] = objLoginModel.User_Email;
                    return RedirectToAction("SearchProduct", "Home");
                }

            }
            return View();
        }
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Login", "Account");
        }
    }
}