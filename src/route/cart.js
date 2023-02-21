import express from "express";
import { addtocart, cartdetail } from "../controller/cartController"
import checkuser from "../middleware/checkuser"
const route = express.Router()

route.get('/add-to-cart/:id', checkuser, addtocart)
route.get('/cart/detail', checkuser, cartdetail)
module.exports = route
