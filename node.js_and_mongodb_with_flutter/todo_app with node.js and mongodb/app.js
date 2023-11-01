const express = require("express");
const bodyParser = require("body-parser")
const UserRoute = require("./routers/user_route");
const ToDoRoute = require('./routers/todo_route');
const app = express();

app.use(bodyParser.json())

app.use("/", UserRoute);
app.use("/", ToDoRoute);

module.exports = app;