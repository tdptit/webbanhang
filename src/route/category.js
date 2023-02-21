import express from "express";

import { category, getadd, postadd, getedit, postedit, deletectg } from "../controller/categoryController"
import checkAdmin from "../middleware/checkAdmin";
const route = express.Router()

route.get('/', checkAdmin, category)
route.get('/add', checkAdmin, getadd)
route.post('/add', checkAdmin, postadd)
route.get('/update/:id', checkAdmin, getedit)
route.post('/update', checkAdmin, postedit)
route.get('/delete/:id', checkAdmin, deletectg)

module.exports = route