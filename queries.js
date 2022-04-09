// LOADS THE DATA FROM .ENV AND STORES IT TO PROCESS.ENV
const dotenv = require('dotenv');
dotenv.config();

const Pool = require('pg').Pool;

//DESTRUCTURE KEYS FROM OUR LOCAL .ENV SO OUR PASSWORDS ARE NOT STORED ON GITHUB
const { PSQL_HOST, PSQL_USER, PSQL_PASS, PSQL_DB, PSQL_PORT } = process.env;

//CREATE A CONNECTION TO OUR DATABASE
const pool = new Pool({
    user: PSQL_USER,
    password: PSQL_PASS,
    database: PSQL_DB,
    host: PSQL_HOST,
    port: PSQL_PORT
});  

const getAllVehicles = (req, res) => {
    pool.query('SELECT * FROM Vehicles;')
        .then(results => {
            res.status(200).json(results.rows);
        })
        .catch(error =>{
            throw error;
        })
}

module.exports = {
    getAllVehicles
}

