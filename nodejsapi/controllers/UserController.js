var config = require("../dbconfig");
const sql = require("mssql");

//function to get all users
async function getAllUsers(req, res, next) {
  try {
    let pool = sql.connect(config, function (error) {
      if (error) {
        console.log(error.message);
      }

      let sqlRequest = new sql.Request();
      let sqlQuery = "EXEC GetAllUsers";
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) {
          console.log(error.message);
        }

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error.message);
  }
}

//signup function
async function SignUpUser(req, res, next) {
  try {
    let { username, password, usertype } = req.params;

    let pool = sql.connect(config, function (error) {
      if (error) {
        console.log(error.message);
      }

      let sqlRequest = new sql.Request();
      let sqlQuery = `EXEC SignUpUser '${username}', '${password}', ${usertype}`;
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) {
          console.log(error.message);
        }

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error.message);
  }
}

// login function
async function LoginUser(req, res, next) {
  try {
    let { username, password } = req.params;

    let pool = sql.connect(config, function (error) {
      if (error) {
        console.log(error.message);
      }

      let sqlRequest = new sql.Request();
      let sqlQuery = `EXEC LoginUser '${username}', '${password}'`;
      sqlRequest.query(sqlQuery, function (error, data) {
        if (error) {
          console.log(error.message);
        }

        res.send(data.recordset);
      });
    });
  } catch (error) {
    console.log(error.message);
  }
}

module.exports = {
  getAllUsers: getAllUsers,
  SignUpUser: SignUpUser,
  LoginUser: LoginUser,
};
