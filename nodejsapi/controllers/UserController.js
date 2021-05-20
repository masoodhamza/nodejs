var config = require("../dbconfig");
const sql = require("mssql");

//function to get all users
async function getAllUsers(req, res, next) {
  try {
    let pool = sql.connect(config, function (error) {
      if (error) {
        console.log(error);
      }

      let sqlRequest = new sql.Request();
      let sqlQuery = "EXEC GetAllUsers";
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) {
          console.log(error);
        }

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error);
  }
}

//signup function
async function SignUpUser(req, res, next) {
  let { username, password } = req.params;

  let pool = sql.connect(config, function (error) {
    if (error) {
      console.log(error);
    }

    let sqlRequest = new sql.Request();
    let sqlQuery = `EXEC SignUpUser '${username}', '${password}'`;
    sqlRequest.query(sqlQuery, function (error, data) {
      if (error) {
        console.log(error);
      }

      res.send(data.recordset);
    });
  });
}

// login function
async function LoginUser(req, res, next) {
  let { username, password } = req.params;

  let pool = sql.connect(config, function (error) {
    if (error) {
      console.log(error);
    }

    let sqlRequest = new sql.Request();
    let sqlQuery = `EXEC LoginUser '${username}', '${password}'`;
    sqlRequest.query(sqlQuery, function (error, data) {
      if (error) {
        console.log(error);
      }

      res.send(data.recordset);
    });
  });
}

module.exports = {
  getAllUsers: getAllUsers,
  SignUpUser: SignUpUser,
  LoginUser: LoginUser,
};
