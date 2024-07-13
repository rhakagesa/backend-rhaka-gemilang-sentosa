const express = require("express");
const cookieParser = require("cookie-parser");
const errorHandler = require("./middlewares/errorHandler");
const routes = require("./routes/index");
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(cookieParser());
app.use("/api", routes);
app.use(errorHandler);

app.listen(port, () => {
  console.log(`server is running on http://localhost:${port}`);
});
