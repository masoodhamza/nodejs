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
    console.log(error.message);
  }
}

async function getRestaurantMenu(req, res, next) {
  try {
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
  } catch (error) {
    console.log(error.message);
  }
}

async function createOrder(req, res, next) {
  try {
    let { userid, itemid, addonid } = req.params;

    if (!addonid) {
      addonid = 0;
    }

    let pool = sql.connect(config, function (error) {
      if (error) console.log(error);

      let sqlRequest = new sql.Request();
      let sqlQuery = `EXEC CreateOrder ${userid}, ${itemid}, ${addonid}`;
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) console.log(error);

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error.message);
  }
}

async function getOrderDetail(req, res, next) {
  try {
    const { orderid } = req.params;

    let pool = sql.connect(config, function (error) {
      if (error) console.log(error);

      const sqlRequest = new sql.Request();
      const sqlQuery = `EXEC GetOrderDetail ${orderid}`;
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) console.log(error);

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error.message);
  }
}

module.exports = {
  getAllRestaurants: getAllRestaurants,
  getRestaurantMenu: getRestaurantMenu,
  createOrder: createOrder,
  getOrderDetail: getOrderDetail,
};
