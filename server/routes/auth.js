const express = require("express");
const User = require("../models/user");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");
// const auth = require("../middlewares/auth")

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, password, email } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ message: "User with this email already exist!" });
    }
    const hashedPassword = await bcrypt.hash(password, 8);

    let user = new User({
      email,
      password: hashedPassword,
      name,
    });

    const resUser = await user.save();
    return res.json({ resUser });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { password, email } = req.body;

    const userExist = await User.findOne({ email });
    if (!userExist) {
      return res
        .status(400)
        .json({ message: "This user doesn't exit, register user" });
    }

    const isMatch = await bcrypt.compare(password, userExist.password);
    if (!isMatch) {
      return res
        .status(400)
        .json({ message: "You are entered an incorrect password" });
    }

    const token = jwt.sign({ id: userExist._id },"passwordKey");
    return res.json({ token, ...userExist._doc });
  } catch (e) {
    console.log(e.message);
    return res.status(500).json({ error: e.message });
  }
});

authRouter.post("/isTokenValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    console.log(token);
    const varified = jwt.verify(token, "passwordKey");
    if (!varified) return res.json(false);

    const user = await User.findById(varified.id);
    if (!user) return res.json(false);

   return res.json(true);
  } catch (e) {
    res.status(500).json({error:e.message});
  }
});

authRouter.get('/',auth,async(req,res) =>{
console.log("her");
  const user = await User.findById(req.user);
  res.json({...user._doc, token:req.token});

})

module.exports = authRouter;
