// const multer = require("multer");
// const DB = require("../index");
// const GridFsStorage = require("multer-gridfs-storage");

// const password = encodeURIComponent("binshad@2004");
// const Dbb = `mongodb+srv://iambinshad:${password}@cluster0.htuj346.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0`;

// const storage = new GridFsStorage({
//     url:Dbb,
//     options:{useNewUrlParser:true,useUnifiedTopology:true},
//     file:(req,file) =>{
//         const match =  ["image/png,image/jpeg"];

//         if(match.indexOf(file.mimetype)===-1){
//             const filename = `${Date.now()}-any-name-${file.originalname}}`;
//             return filename;
//         }

//         return {
//             bucketName: "photos",
//         filename:`${Date.now()}-any-name-${file.riginalname}}`,
//         }
//     }
// });
// module.exports = multer({ storage })
const multer = require("multer");
const GridFsStorage = require("multer-gridfs-storage");

const password = encodeURIComponent("binshad");
const DB = `mongodb+srv://iambinshad:${password}@cluster0.htuj346.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0`;

///acJY8wKjswyAYPaD
///binshadp999
const storage = new GridFsStorage({
    url: DB,
    options: { useNewUrlParser: true, useUnifiedTopology: true },
    file: (req, file) => {
        const match = ["image/png", "image/jpeg"];

        if (match.indexOf(file.mimetype) === -1) {
            const filename = `${Date.now()}-any-name-${file.originalname}`;
            return filename;
        }

        return {
            bucketName: "photos",
            filename: `${Date.now()}-any-name-${file.originalname}`,
        };
    }
});

module.exports = multer({ storage });
