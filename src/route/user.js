import express from "express";
import { login, register, home, detailproduct } from "../controller/userController.js"

const route = express.Router()
route.get("/", home)

route.get("/login", (req, res) => {
    if (req.session.isLogged || req.session.adisLogged) res.redirect('/')
    else return res.render("user/login", {
        err: ""
    })
})
route.post('/login', login)
route.get('/register', (req, res) => {
    if (req.session.isLogged || req.session.adisLogged) res.redirect('/')
    else return res.render('user/register', {
        err: ""
    })
})
route.post('/register', register)
route.get('/logout', (req, res) => {
    req.session.destroy()
    res.redirect('/')
})
route.get('/detail-product/:id', detailproduct)


// route.get('/test', (req, res) => {
//     let arr = [
//         {
//             id: 'r1',
//             name: 'tien',
//             price: 100,
//             count: 1,
//         },
//         {
//             id: 'r2',
//             name: 'dung'
//         },
//         {
//             id: 'r3',
//             name: 'hoang'
//         },
//     ]
//     let t = 3;
//     while (t--) {
//         let data = arr.filter(value => {
//             return value.id == "r1"
//         })
//         console.log("data", data)
//         data[0].price += 100
//     }
//     // if (data.length > 0) {
//     //     data.count++;
//     //     data.price = data.price * data.count
//     // }
//     // else {
//     //     arr.push({
//     //         id: "r4",
//     //         price: 120,
//     //         count: 1,
//     //     })
//     // }
//     console.log(arr)

// })
module.exports = route