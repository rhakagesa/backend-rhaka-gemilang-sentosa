"use strict";

const merchantAuthorization = (req, res, next) => {
  try {
    if (req.session.role !== "merchant") throw Error("unathorized access");
    next();
  } catch (error) {
    next({ status: 401, message: error.message });
  }
};

const customerAuthorization = (req, res, next) => {
  try {
    if (req.session.role !== "customer") throw Error("unathorized access");
    next();
  } catch (error) {
    next({ status: 401, message: error.message });
  }
};

module.exports = { merchantAuthorization, customerAuthorization };
