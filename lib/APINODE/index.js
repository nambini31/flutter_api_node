const express = require("express");
const bodyParser = require("body-parser");
const materielRouter = require("./routes/materielRoute");
const path = require("path");
const mysql = require("mysql");
const myConnextion = require("express-myconnection");
const app = express();

const lien = (param)=> path.join(__dirname , param) ;

const servInfo = {
    host : "localhost",
    port : 3306,
    user : "root",
    password : "",
    database : "materiel"
};

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.set("views" , lien("publics/vues"));
app.set("view engine" , "ejs");
app.use(myConnextion(mysql,servInfo,"pool"));

app.use("/materiel",materielRouter);

app.listen(3000, () => {
  console.log("app run on http://localhost:3000");
});
