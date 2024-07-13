"use strict";

const productRepository = require("../models").Product;
const orderRepository = require("../models").Order;
const orderItemRepository = require("../models").OrderItem;

module.exports = class MerchantService {
  static async addProduct(data) {
    const { itemName, price } = data;
    if (!itemName || !price) throw new Error("item name and price required");

    const product = await productRepository.findOne({
      where: { itemName: itemName },
    });
    if (product) throw new Error("product already exists");

    const newProduct = await productRepository.create(data);
    return newProduct;
  }

  static async getAllProducts() {
    const products = await productRepository.findAll();
    if (!products || products.length === 0) throw new Error("product is empty");
    return products;
  }

  static async getProductById(id) {
    const product = await productRepository.findOne({
      where: { id: id },
    });
    if (!product) throw new Error("product not found");
    return product;
  }

  static async editProduct(data) {
    const { id, itemName, price } = data;
    if (!itemName || !price) throw new Error("item name and price required");

    const findProduct = await productRepository.findOne({
      where: { id: id },
    });
    if (!findProduct) throw new Error("product not found");

    const product = await productRepository.findOne({
      where: { itemName: itemName },
    });
    if (product) throw new Error("product already exists");

    const updateProduct = await productRepository.update(data, {
      where: { id: id },
    });
    return updateProduct;
  }

  static async deleteProduct(id) {
    const findProduct = await productRepository.findOne({
      where: { id: id },
    });
    if (!findProduct) throw new Error("product not found");
    const deleteProduct = await productRepository.destroy({
      where: { id: id },
    });
    return deleteProduct;
  }

  static async getOrders() {
    const orders = await orderRepository.findAll();
    if (!orders || orders.length === 0) throw new Error("order is empty");
    return orders;
  }

  static async getDetailsById(id) {
    const orderItem = await orderItemRepository.findAll({
      where: { orderId: id },
    });
    if (!orderItem || orderItem.length === 0)
      throw new Error("order items is empty");
    return orderItem;
  }
};
