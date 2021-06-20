var express = require("express");
const UserController = require("../controllers/UserController");
var router = express.Router();

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

router.post("/signup", UserController.Signup);
router.post("/signin", UserController.Signin);
router.post("/adduserdetails", UserController.AddUserDetails);

module.exports = router;
