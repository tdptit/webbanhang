import express from "express";
import { home, checkout, detailorder, getupdate, postupdate, getorder, getorderdetail } from "../controller/orderController"
import checkuser from "../middleware/checkuser";
import checkAdmin from "../middleware/checkAdmin"
const route = express.Router()
//user
route.get('/listorder', checkuser, home)
route.post('/checkout', checkuser, checkout)
route.get('/listorder/detail/:id', checkuser, detailorder)
route.get('/listorder/update/:id', checkuser, getupdate)
route.post('/listorder/update', checkuser, postupdate)
//admin
route.get('/order', checkAdmin, getorder)
route.get('/order/detail/:id', checkAdmin, getorderdetail)
module.exports = route