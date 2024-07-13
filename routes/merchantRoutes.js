"use strict";

const express = require("express");
const router = express.Router();
const merchantController = require("../controllers/merchantController");
const authentication = require("../middlewares/authentication");
const { merchantAuthorization } = require("../middlewares/authorization");

router.use(authentication, merchantAuthorization);
router.post("/addproduct", merchantController.addProduct);
router.get("/products", merchantController.getAllProducts);
router.get("/product/:id?", merchantController.getProductById);
router.post("/product/:id?", merchantController.editProduct);
router.delete("/product/:id?", merchantController.deleteProduct);

router.get("/orders", merchantController.getOrders);
router.get("/order/:id?", merchantController.getDetailsById);

module.exports = router;
