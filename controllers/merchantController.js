"use strict";

const merchantService = require("../services/merchantService");

module.exports = class MerchantController {
  static async addProduct(req, res, next) {
    const reqData = {
      itemName: req.body.itemName,
      price: req.body.price,
    };
    try {
      const result = await merchantService.addProduct(reqData);
      res.status(201).json({
        message: "add product success",
        data: result,
      });
    } catch (err) {
      next({ status: 400, message: err.message });
    }
  }

  static async getAllProducts(req, res, next) {
    try {
      const result = await merchantService.getAllProducts();
      res.status(200).json({
        message: "get all products success",
        data: result,
      });
    } catch (err) {
      next({ status: 500, message: err.message });
    }
  }

  static async getProductById(req, res, next) {
    try {
      const result = await merchantService.getProductById(req.query.id);
      res.status(200).json({
        message: "get product success",
        data: result,
      });
    } catch (err) {
      next({ status: 500, message: err.message });
    }
  }

  static async editProduct(req, res, next) {
    const reqData = {
      id: req.query.id,
      itemName: req.body.itemName,
      price: req.body.price,
    };
    try {
      const result = await merchantService.editProduct(reqData);
      res.status(201).json({
        message: "edit product success",
        data: result,
      });
    } catch (err) {
      next({ status: 400, message: err.message });
    }
  }

  static async deleteProduct(req, res, next) {
    try {
      const result = await merchantService.deleteProduct(req.query.id);
      res.status(200).json({
        message: "delete product success",
        data: result,
      });
    } catch (err) {
      next({ status: 500, message: err.message });
    }
  }

  static async getOrders(req, res, next) {
    try {
      const result = await merchantService.getOrders();
      res.status(200).json({
        message: "get orders success",
        data: result,
      });
    } catch (err) {
      next({ status: 500, message: err.message });
    }
  }

  static async getDetailsById(req, res, next) {
    try {
      const result = await merchantService.getDetailsById(req.query.id);
      res.status(200).json({
        message: "get details success",
        data: result,
      });
    } catch (err) {
      next({ status: 500, message: err.message });
    }
  }
};
