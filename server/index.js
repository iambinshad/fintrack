// IMPORTS FROM PACKAGES
const mongoose = require("mongoose");
const express = require("express");
// require('dotenv').config();
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const brandRouter = require('./routes/brand');
const vehicleRouter = require("./routes/vehicle");
// const Grid = require("gridfs-stream");
// const upload = require('./routes/upload');
// const { once } = require("multer-gridfs-storage");
// INIT
const PORT = 3000;
const app = express();
const password = encodeURIComponent("binshad");
const DB = `mongodb+srv://iambinshad:${password}@cluster0.htuj346.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0`;

// middleware
app.use(express.json());
app.use(authRouter);
app.use(vehicleRouter);
app.use(brandRouter);
// app.use("/file", upload);

// let gfs;



// DB CONNECTION
mongoose
  .connect(DB)
  .then(() => {
    console.log("Data base connected");
  })
  .catch((e) => {
    console.log(e);
  });

  // const conn = mongoose.connection;
  // conn.once("open", function () {
  //     gfs = Grid(conn.db, mongoose.mongo);
  //     gfs.collection("photos");
  // });
  
app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}  `);
});

module.exports = DB;