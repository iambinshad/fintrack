// const upload = require('../middlewares/upload');
// const express = require('express');
// const router = express.Router();

// router.post("/upload",upload.single("file"),(req,res)=>{
//     if(req.file === undefined) return res.send("You must select a file.");

//     const imageUrl = `http://localhost:3000/file/${req.file.filename}`;
//     return res.send(imageUrl);
// })

// module.exports = router;