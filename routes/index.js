"use strict";

const express = require("express");
const router = express.Router();
const authRoute = require("./authRoutes");
const merchantRoute = require("./merchantRoutes");

router.use("/auth", authRoute);
router.use("/merchant", merchantRoute);
module.exports = router;
