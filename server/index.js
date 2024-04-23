// IMPORTS FROM PACKAGES
const mongoose = require("mongoose");
const express = require("express");

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const vehicleRouter = require("./routes/vehicle");

// INIT
const PORT = 3000;
const app = express();
const password = encodeURIComponent("binshad@2004");
const DB = `mongodb+srv://iambinshad:${password}@cluster0.htuj346.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0`;

// middleware
app.use(express.json());
app.use(authRouter);
app.use(vehicleRouter);

// DB CONNECTION
mongoose
  .connect(DB)
  .then(() => {
    console.log("Data base connected");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}  `);
});
