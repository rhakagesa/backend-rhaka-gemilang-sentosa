"use strict";

const orderItemRepository = require("../models").OrderItem;
const orderRepository = require("../models").Order;
const productRepository = require("../models").Product;

let cart = [];
const discount = 10;

module.exports = class customerService {
  static async getAllProducts() {
    const products = await productRepository.findAll();
    if (!products) throw new Error("products not found");
    return products;
  }

  static async addToCart(data) {
    const { id, qty = 1 } = data;
    const product = await productRepository.findOne({ where: { id: id } });
    if (!product) throw new Error("product not found");

    if (cart.length === 0) {
      cart.push({
        productName: product.itemName,
        totalItemPrice: product.price * qty,
        qty: Number(qty),
      });
    } else {
      const cartItem = cart.find(
        (item) => item.productName === product.itemName
      );
      if (cartItem) {
        cartItem.qty += Number(qty);
        cartItem.totalItemPrice = cartItem.qty * product.price;
      } else {
        cart.push({
          productName: product.itemName,
          totalItemPrice: product.price * Number(qty),
          qty: Number(qty),
        });
      }
    }

    return cart;
  }

  static async checkout(session) {
    if (cart.length === 0) throw new Error("cart is empty");
    const calcPrice = cart.reduce((total, item) => {
      return total + item.totalItemPrice;
    }, 0);

    const orderData = {
      customerName: session.username,
      totalPrice: calcPrice,
      discount: 0,
      freeongkir: false,
      userId: session.id,
    };

    if (calcPrice > 15000) orderData.freeongkir = true;
    if (calcPrice > 50000) {
      orderData.discount = calcPrice * (discount / 100);
      orderData.totalPrice = calcPrice - orderData.discount;
    }

    const order = await orderRepository.create(orderData);

    const getOrderId = await orderRepository.findOne({
      where: { userId: session.id },
    });

    cart.map(async (item) => {
      const orderItemData = {
        orderId: getOrderId.id,
        productName: item.productName,
        totalItemPrice: item.totalItemPrice,
        qty: item.qty,
      };
      await orderItemRepository.create(orderItemData);
    });

    return order;
  }

  cart = [];
};
