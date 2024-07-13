const { hashPassword, comparePassword } = require("../utils/bcrypt");
const UserRepository = require("../models/user").User;

export default class AuthService {
  static async register(data) {
    const { username, password } = data;
    if (!username || !password)
      throw new Error("username and password required");

    const user = await UserRepository.findOne({ where: { username } });
    if (user) throw new Error("username already exists");

    const hash = hashPassword(password);
    const newUser = await UserRepository.create({ username, password: hash });
    return newUser;
  }
}
