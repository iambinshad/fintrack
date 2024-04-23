
const jwt = require('jsonwebtoken');

const auth = async (req , res , next)=>{
    try {
        console.log("entered here");

        const token = req.header('x-auth-token');
        console.log(token);
        if(!token) return res.status(401).json({msg:"No auth token, Access denied"})

        const verified = jwt.verify(token,"passwordKey");
        if(!verified) return res.status(401).json({msg:"Token verfication failed, authorization denied"});

        req.user = verified.id;
        req.token = token;
        next();
        
    } catch (error) {
        console.log(error);
        res.status(500).json({error:error.message});
    }
}

module.exports = auth;