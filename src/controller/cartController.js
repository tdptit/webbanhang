import express from "express"
import db from "../config/connecDB"

let addtocart = async (req, res) => {

    //console.log("cart ban dau", req.session.cart)
    let products = req.session.cart
    let productId = req.params.id
    let product = products.filter(value => {
        return value.id == productId
    })
    //console.log(product.length)
    if (product.length > 0) {
        product[0].quantity++;
        product[0].price += product[0].price
        res.redirect('/')
    }
    else {
        await db.query(`select * from product where id = '${productId}'`, (err, data) => {
            if (err) console.log(err)
            else {

                let product = {
                    id: productId,
                    quantity: 1,
                    price: data[0].price,
                    name: data[0].title
                }
                products.push(product)
                req.session.cart = products

                res.redirect('/')
            }
        })
    }
}

let cartdetail = (req, res) => {
    let totalPrice = 0;
    let product = req.session.cart
    for (let i = 0; i < (product.length); i++) {
        totalPrice += product[i].price
    }
    res.render('user/cart_detail', {
        data: product,
        totalPrice,
        user: req.session.user

    })
}

module.exports = {
    addtocart, cartdetail
}