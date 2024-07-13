"use strict";

const express = require("express");
const router = express.Router();
const customerController = require("../controllers/customerController");
const authentication = require("../middlewares/authentication");
const { customerAuthorization } = require("../middlewares/authorization");

router.use(authentication, customerAuthorization);
router.get("/products", customerController.getAllProducts);
router.get("/addtocart/:id?", customerController.addToCart);
router.get("/checkout", customerController.checkout);

module.exports = router;
