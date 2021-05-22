var express = require("express");
const UserController = require("../controllers/UserController");
var router = express.Router();
var ClientController = require("../controllers/ClientController");

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

// user routes
router.get("/getallusers", UserController.getAllUsers);
router.get("/signup/:username&:password", UserController.SignUpUser);
router.get("/login/:username&:password", UserController.LoginUser);

router.get("/getallclients", ClientController.getAllClients);
router.get("/getclientservices/:clientid", ClientController.getClientService);
router.get("/createorder/:serviceid", ClientController.createOrder);

module.exports = router;
