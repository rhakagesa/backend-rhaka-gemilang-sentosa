"use strict";

const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");
const authentication = require("../middlewares/authentication");

router.post("/register", authController.register);
router.post("/login", authController.login);
router.get("/logout", authentication, authController.logout);

module.exports = router;
