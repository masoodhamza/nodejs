var express = require("express");
const UserController = require("../controllers/UserController");
var router = express.Router();
var ClientController = require("../controllers/ClientController");
var RestaurantController = require("../controllers/RestaurantController");

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

// user routes
router.get("/getallusers", UserController.getAllUsers);
router.get("/signup/:username&:password&:usertype", UserController.SignUpUser);
router.get("/login/:username&:password", UserController.LoginUser);

// customers routes
router.get("/getallrestaurants", ClientController.getAllRestaurants);
router.get(
  "/getrestaurantmenu/:restaurantid",
  ClientController.getRestaurantMenu
);
router.get(
  "/createorder/:userid&:itemid&:addonid?",
  ClientController.createOrder
);
router.get("/getorderdetail/:orderid", ClientController.getOrderDetail);
router.get("/getuserorders/:userid", ClientController.getUserOrders);
router.get("/createreorder/:userid&:orderid", ClientController.createReOrder);

// restaurants routes
router.get(
  "/addrestaurant/:userid&:name&:phone&:address&:logo",
  RestaurantController.addRestaurant
);
router.get(
  "/addmenuitem/:userid&:restaurantid&:name&:price&:time",
  RestaurantController.addMenuItem
);
router.get(
  "/addaddonitem/:userid&:restaurantid&:itemid&:name&:price&:time",
  RestaurantController.addAddonItem
);

module.exports = router;
