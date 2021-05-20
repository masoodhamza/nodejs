var express = require("express");
var router = express.Router();
var operations = require("../dboperations");

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

router.get("/testconnection", function (req, res, next) {
  operations.test();
  res.render("index", { title: "Express" });
});

module.exports = router;
