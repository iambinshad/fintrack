
const auth = require('../middlewares/auth');
const Vehicle = require('../models/vehilce')
const express = require('express');
const vehicleRouter = express.Router();


vehicleRouter.post("/api/addVehicle", async (req, res) => {
    try {
        const { name, description, price, images, brand } = req.body;
        let vehicle = Vehicle({
            name, description, price, brand, images
        });
        const vehicleAddRes = await vehicle.save();
        console.log(vehicle);
        return res.json({ vehicle });
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }

});

vehicleRouter.get("/api/getVehicle",auth, async (req, res) => {
    try {
       

        const vehicles = await Vehicle.find();
        if (!vehicles) return res.json([]);
        return res.json({ vehicles });
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
})



module.exports = vehicleRouter;