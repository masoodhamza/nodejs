var express = require("express");
const UserController = require("../controllers/UserController");
var router = express.Router();
var operations = require("../controllers/UserController");

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

// user routes
router.get("/getallusers", UserController.getAllUsers);
router.get("/signup/:username&:password", UserController.SignUpUser);
router.get("/login/:username&:password", UserController.LoginUser);

module.exports = router;
