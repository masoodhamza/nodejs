var config = require("../dbconfig");
const sql = require("mssql");

async function getAllRestaurants(req, res, next) {
  try {
    let pool = sql.connect(config, function (error) {
      if (error) console.log(error);

      let sqlRequest = new sql.Request();
      let sqlQuery = "EXEC GetAllRestaurantsInfo";
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) console.log(error);

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error);
  }
}

async function getRestaurantMenu(req, res, next) {
  const { restaurantid } = req.params;

  let pool = sql.connect(config, function (error) {
    if (error) console.log(error);

    let sqlRequest = new sql.Request();
    let sqlQuery = `EXEC GetRestaurantMenu ${restaurantid}`;
    sqlRequest.query(sqlQuery, function (error, data) {
      if (error) console.log(error);

      res.send(data.recordset);
    });
  });
}

async function createOrder(req, res, next) {
  const { menuid } = req.params;
  //TODO: add user id
  let pool = sql.connect(config, function (error) {
    if (error) console.log(error);

    let sqlRequest = new sql.Request();
    let sqlQuery = `EXEC CreateOrder ${menuid}`;
    sqlRequest.query(sqlQuery, function (error, data) {
      if (error) console.log(error);

      res.send(data.recordset);
    });
  });
}

module.exports = {
  getAllRestaurants: getAllRestaurants,
  getRestaurantMenu: getRestaurantMenu,
  createOrder: createOrder,
};
