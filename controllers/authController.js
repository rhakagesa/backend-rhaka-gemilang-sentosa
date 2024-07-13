"use strict";

const AuthService = require("../services/authService");

module.exports = class AuthController {
  static async register(req, res, next) {
    const reqData = {
      username: req.body.username,
      password: req.body.password,
      role: req.body.role,
    };

    try {
      const result = await AuthService.register(reqData);
      res.status(201).json({
        message: "register success",
        data: result,
      });
    } catch (err) {
      next({ status: 400, message: err.message });
    }
  }

  static async login(req, res, next) {
    const reqData = {
      username: req.body.username,
      password: req.body.password,
    };

    try {
      const result = await AuthService.login(reqData);
      res.cookie("jwt", result.token).status(200).json({
        message: "login success",
        username: result.payload.username,
        role: result.payload.role,
      });
    } catch (err) {
      next({ status: 400, message: err.message });
    }
  }

  static async logout(req, res, next) {
    try {
      res.clearCookie("jwt").status(200).json({
        message: "logout success",
      });
    } catch (err) {
      next({ status: 401, message: err.message });
    }
  }
};
