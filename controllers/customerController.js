"use strict";

const customerService = require("../services/customerService");

module.exports = class customerController {
  static async getAllProducts(req, res) {
    try {
      const products = await customerService.getAllProducts();
      res.send(products);
    } catch (err) {
      next({ status: 500, message: err.message });
    }
  }

  static async addToCart(req, res, next) {
    const reqData = {
      id: req.query.id,
      qty: req.body.qty,
    };
    try {
      const result = await customerService.addToCart(reqData);
      res.status(201).json({
        message: "add to cart success",
        data: result,
      });
    } catch (err) {
      next({ status: 500, message: err.message });
    }
  }

  static async checkout(req, res, next) {
    try {
      const result = await customerService.checkout(req.session);
      res.status(200).json({
        message: "checkout success",
        data: result,
      });
    } catch (err) {
      next({ status: 500, message: err.message });
    }
  }
};
