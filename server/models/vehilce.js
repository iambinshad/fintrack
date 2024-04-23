const mongoose = require('mongoose');

const vehicleSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    images: {
        type: String,
        required: true,
        trim: true,
    },
    brand: {
        type: String,
        required: true,
        trim: true,
    },
    description: {
        type: String,
        required: true,
        trim: true,
    },
    price: {
        type: String,
        required: true,
        trim: true,
    },
})

const vehicle = mongoose.model("Vehicles",vehicleSchema);
module.exports = vehicle;