"use strict";

const { hashPassword, comparePassword } = require("../utils/bcrypt");
const { generateToken } = require("../utils/jwt");
const userRepository = require("../models").User;

module.exports = class authService {
  static async register(data) {
    const { name, username, password, role } = data;
    if (!name || !username || !password || !role)
      throw new Error("name, username, password and role required");

    const user = await userRepository.findOne({
      where: { username: username },
    });
    if (user) throw new Error("username already exists");

    const hash = hashPassword(password);
    const newUser = await userRepository.create({
      name: name,
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

    const user = await userRepository.findOne({ where: { username } });
    if (!user) throw new Error("username not found");

    const passwordMatch = comparePassword(user.password, password);
    if (!passwordMatch) throw new Error("password not match");

    const payload = {
      id: user.id,
      name: user.name,
      username: user.username,
      role: user.role,
    };

    const token = generateToken(payload);
    return { payload, token };
  }
};
