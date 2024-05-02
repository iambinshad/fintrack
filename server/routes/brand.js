const express = require('express');
const brandRouter = express.Router();

const Brand = require('../models/brand');

brandRouter.post('/api/addBrand', async (req, res) => {
    try {
        const { brandName, brandImage } = req.body;
        let brand = Brand({ brandName, brandImage });

        const brandSaveRes = await brand.save();
        console.log(brandSaveRes);
        return res.json({ brandSaveRes });

    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

brandRouter.get('/api/brandList', async (req, res) => {
    try {

        const brandList = await Brand.find();
        if (!brandList) return ([]);
        return res.json({ brandList });
    } catch (error) {

        res.status(500).json({ error: error.message });

    }

})

module.exports = brandRouter;