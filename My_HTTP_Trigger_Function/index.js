const mysql = require('mysql');
const moment = require('moment');

const connectionString = "Server=tcp:wix-mysql-server-name.mysql.database.azure.com,3306;Database=mysqltutorial;Uid=shuzhennong;Pwd=Fudan@0216$;Encrypt=false;TrustServerCertificate=false;Connection Timeout=30;";

const config = {
    connectionLimit: 10,
    host: connectionString.match(/Server=tcp:(.*?),/)[1],
    user: connectionString.match(/Uid=(.*?);/)[1],
    password: connectionString.match(/Pwd=(.*?);/)[1],
    database: connectionString.match(/Database=(.*?);/)[1],
};

const pool = mysql.createPool(config);

module.exports = async function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');

    const { school, grade, feedback, suggestion, submissionTime, responderEmail } = req.body || {};

    if (!school || !grade || !feedback || !suggestion || !submissionTime || !responderEmail) {
        context.res = {
            status: 400,
            body: "Please pass all required fields (school, grade, feedback, suggestion, submissionTime, responderEmail) in the request body"
        };
        return;
    }

    // Convert submissionTime to MySQL datetime format
    const formattedSubmissionTime = moment(submissionTime, 'MM/DD/YYYY hh:mm:ss A').format('YYYY-MM-DD HH:mm:ss');

    const responseMessage = await new Promise((resolve, reject) => {
        pool.query('INSERT INTO MicrosoftFormTable (School, Grade, Feedback, Suggestion, SubmissionTime, ResponderEmail) VALUES (?,?,?,?,?,?)', 
        [school, grade, feedback, suggestion, formattedSubmissionTime, responderEmail], (error, results, fields) => {
            if (error) {
                reject(error);
            } else {
                resolve(`Entry added successfully for responder: ${responderEmail}.`);
            }
        });
    }).catch(error => {
        context.log.error(error);
        return `Error: ${error.message}`;
    });

    context.res = {
        body: responseMessage
    };
};