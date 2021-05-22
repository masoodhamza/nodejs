var config = require("../dbconfig");
const sql = require("mssql");

async function getAllClients(req, res, next) {
  try {
    let pool = sql.connect(config, function (error) {
      if (error) console.log(error);

      let sqlRequest = new sql.Request();
      let sqlQuery = "EXEC GetAllClientsInfo";
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) console.log(error);

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error);
  }
}

async function getClientService(req, res, next) {
  const { clientid } = req.params;

  let pool = sql.connect(config, function (error) {
    if (error) console.log(error);

    let sqlRequest = new sql.Request();
    let sqlQuery = `EXEC GetClientServices ${clientid}`;
    sqlRequest.query(sqlQuery, function (error, data) {
      if (error) console.log(error);

      res.send(data.recordset);
    });
  });
}

async function createOrder(req, res, next) {
  const { serviceid } = req.params;

  let pool = sql.connect(config, function (error) {
    if (error) console.log(error);

    let sqlRequest = new sql.Request();
    let sqlQuery = `EXEC CreateOrder ${serviceid}`;
    sqlRequest.query(sqlQuery, function (error, data) {
      if (error) console.log(error);

      res.send(data.recordset);
    });
  });
}

module.exports = {
  getAllClients: getAllClients,
  getClientService: getClientService,
  createOrder: createOrder,
};
