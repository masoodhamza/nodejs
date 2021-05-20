const config = require("./dbconfig");
const sql = require("mssql");

async function test() {
  try {
    let pool = sql.connect(config);
    console.log("database connected successfully");
  } catch (error) {
    console.log(error);
  }
}

module.exports = {
  test: test,
};
