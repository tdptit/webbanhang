import express from "express"
import connecDB from "./config/connecDB"
import path from "path"
import session from "express-session"
import userRoute from "./route/user"
import adminRoute from "./route/admin"
import categoryRoute from "./route/category"
import productRoute from "./route/product"
import cartRoute from "./route/cart"
import orderRoute from "./route/order"
import checkAdmin from "./middleware/checkAdmin"
import checkuser from "./middleware/checkuser"

const app = express()
const port = 3001
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));

app.set("view engine", "ejs")
app.set("views", path.join(__dirname, "view"))
app.use('/', express.static(path.join(__dirname, 'image')))

connecDB
app.use('/', userRoute)
app.use('/admin', checkAdmin, adminRoute)
app.use('/category', categoryRoute)
app.use('/product', productRoute)
app.use('/', cartRoute)
app.use('/', orderRoute)
app.get('/test1', (req, res) => {
    let arr = [
        {

            quantity: 0,
            price: 0,
        },
        {
            id: "r2",
            quantity: 2,
            price: 500
        },
        {

            quantity: 1,
            price: 100
        },
    ]
    let a = arr.filter(value => {
        return value.id == 'r2'
    })

    a[0].quantity++;
    a[0].price += 100
    console.log(a)
    console.log(arr[1])

})
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})