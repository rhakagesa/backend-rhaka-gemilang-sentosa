"use strict";

const { hashPassword, comparePassword } = require("../utils/bcrypt");
const { generateToken } = require("../utils/jwt");
const UserRepository = require("../models").User;

module.exports = class AuthService {
  static async register(data) {
    const { username, password, role } = data;
    if (!username || !password || !role)
      throw new Error("username, password and role required");

    const user = await UserRepository.findOne({
      where: { username: username },
    });
    if (user) throw new Error("username already exists");

    const hash = hashPassword(password);
    const newUser = await UserRepository.create({
      username: username,
      password: hash,
      role: role,
    });
    return newUser;
  }

  static async login(data) {
    const { username, password } = data;
    if (!username || !password)
      throw new Error("username and password required");

    const user = await UserRepository.findOne({ where: { username } });
    if (!user) throw new Error("username not found");

    const passwordMatch = comparePassword(user.password, password);
    if (!passwordMatch) throw new Error("password not match");

    const payload = {
      id: user.id,
      username: user.username,
      role: user.role,
    };

    const token = generateToken(payload);
    return { payload, token };
  }
};
