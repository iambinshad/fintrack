
const Vehicle = require('../models/vehilce')
const express = require('express');
const authRouter = express.Router();

authRouter.post("/api/addVehicle", async (req, res) => {
    try {
        const { name, description, price, images, brand } = req.body;
        let vehicle = Vehicle({
            name, description, price, brand, images
        });
        const vehicleAddRes = await vehicle.save();
        console.log(...vehicle._doc);
        return res.json({ vehicle });
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }

})

module.exports =authRouter;