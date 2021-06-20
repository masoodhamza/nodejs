const config = require("../dbconfig");
const sql = require("mssql");

const Signup = async (req, res) => {
  const { username, email, password, usertype } = req.body;

  try {
    sql
      .connect(config)
      .then(() => {
        const Request = new sql.Request();
        const Query = `EXEC Signup '${username}', '${email}', '${password}', ${usertype}`;
        Request.query(Query)
          .then((data) => {
            res.send(data.recordset);
          })
          .catch((error) => console.log(error.message));
      })
      .catch((error) => console.log(error.message));
  } catch (error) {
    console.log(error.message);
  }
};

const Signin = async (req, res) => {
  const { email, password } = req.body;
  try {
    sql
      .connect(config)
      .then(() => {
        const Request = new sql.Request();
        const Query = `EXEC Signin '${email}', '${password}'`;
        Request.query(Query)
          .then((data) => res.send(data.recordset))
          .catch((error) => console.log(error.message));
      })
      .catch((error) => console.log(error.message));
  } catch (error) {
    console.log(error.message);
  }
};

const AddUserDetails = async (req, res) => {
  const { userid, name, address, phone } = req.body;
  try {
    sql
      .connect(config)
      .then(() => {
        const Request = new sql.Request();
        const Query = `EXEC AddUserDetails '${userid}', '${name}', '${address}', '${phone}'`;
        Request.query(Query)
          .then((data) => res.send(data.recordset))
          .catch((error) => console.log(error.message));
      })
      .catch((error) => console.log(error.message));
  } catch (error) {
    console.log(error.message);
  }
};

module.exports = {
  Signup: Signup,
  Signin: Signin,
  AddUserDetails: AddUserDetails,
};
