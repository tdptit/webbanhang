import express from "express";
import { home } from "../controller/adminController"
const route = express.Router()
route.get('/', home)
route.get('/logout', (req, res) => {
    req.session.destroy()
    res.redirect('/login')
})



module.exports = route