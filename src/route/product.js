import express from "express"
import { product, getadd, postadd, detail, deletepr, getupdate, postupdate } from "../controller/productController"
import checkAdmin from "../middleware/checkAdmin"
const route = express.Router()

route.get('/', checkAdmin, product)
route.get('/add', checkAdmin, getadd)
route.post('/add', checkAdmin, postadd)
route.get('/detail/:id', checkAdmin, detail)
route.get('/delete/:id', checkAdmin, deletepr)
route.get('/update/:id', checkAdmin, getupdate)
route.post('/update', checkAdmin, postupdate)
module.exports = route