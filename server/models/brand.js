const mongoose = require('mongoose');

const brandSchema = mongoose.Schema({
    brandName: {
        type: String,
        required: true,
        trim: true,
    },
    brandImage: {
        type: String,
        required: true,
    }
})
const brand = mongoose.model('Brand',brandSchema);
module.exports = brand;