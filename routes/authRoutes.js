"use strict";

const express = require("express");
const router = express.Router();
const AuthController = require("../controllers/authController");
const authentication = require("../middlewares/authentication");

router.post("/register", AuthController.register);
router.post("/login", AuthController.login);
router.get("/logout", authentication, AuthController.logout);

module.exports = router;
