"use strict";

const express = require("express");
const router = express.Router();
const authRoute = require("./authRoutes");
const merchantRoute = require("./merchantRoutes");
const customerRoute = require("./customerRoutes");

router.use("/auth", authRoute);
router.use("/merchant", merchantRoute);
router.use("/customer", customerRoute);
module.exports = router;
