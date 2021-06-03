var config = require("../dbconfig");
const sql = require("mssql");

//Add new restaurant
async function addRestaurant(req, res, next) {
  try {
    const { userid, name, phone, address, logo } = req.params;
    let pool = sql.connect(config, function (error) {
      if (error) console.log(error.message);

      const sqlRequest = new sql.Request();
      const sqlQuery = `EXEC AddRestaurant ${userid}, '${name}', '${phone}', '${address}', '${logo}'`;
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) console.log(error.message);

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error.message);
  }
}

//Add new menu Item
async function addMenuItem(req, res, next) {
  try {
    const { userid, restaurantid, name, price, time } = req.params;
    let pool = sql.connect(config, function (error) {
      if (error) console.log(error.message);

      const sqlRequest = new sql.Request();
      const sqlQuery = `EXEC AddMenuItem ${userid}, ${restaurantid}, '${name}', ${price}, '${time}'`;
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) console.log(error.message);

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error.message);
  }
}

//Add new Addon Item
async function addAddonItem(req, res, next) {
  try {
    const { userid, restaurantid, itemid, name, price, time } = req.params;
    let pool = sql.connect(config, function (error) {
      if (error) console.log(error.message);

      const sqlRequest = new sql.Request();
      const sqlQuery = `EXEC AddAddonItem ${userid}, ${restaurantid}, ${itemid}, '${name}', ${price}, '${time}'`;
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) console.log(error.message);
        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error.message);
  }
}

module.exports = {
  addRestaurant: addRestaurant,
  addMenuItem: addMenuItem,
  addAddonItem: addAddonItem,
};
