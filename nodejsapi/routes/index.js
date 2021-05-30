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

router.get("/getallrestaurants", ClientController.getAllRestaurants);
router.get(
  "/getrestaurantmenu/:restaurantid",
  ClientController.getRestaurantMenu
);
router.get(
  "/createorder/:userid/:itemid/:addonid?",
  ClientController.createOrder
);
router.get("/getorderdetail/:orderid", ClientController.getOrderDetail);
router.get("/getuserorders/:userid", ClientController.getUserOrders);
router.get("/createreorder/:userid/:orderid", ClientController.createReOrder);

module.exports = router;
