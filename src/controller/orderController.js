import express from "express"
import db from "../config/connecDB"
import shortid from "shortid"

let home = async (req, res) => {
    let user_id = req.session.user.id
    await db.query("select * from orderr where user_id = ?", [user_id], (err, data) => {
        if (err) console.log(err)
        else {
            // console.log(data.length)
            res.render('user/order/order', {
                data,
                user: req.session.user
            })
        }
    })
}

let checkout = async (req, res) => {
    let orderr_id = shortid.generate()
    let { user_id, fullname, email, phone_number, address, order_date, total_money } = req.body
    total_money = parseInt(total_money)
    let sql = `insert into orderr values ('${orderr_id}','${user_id}','${fullname}','${email}','${phone_number}','${address}','${order_date}',${total_money})`
    await db.query(sql, async (err, data) => {
        if (err) console.log(err)
        else {
            let products = req.session.cart
            for (let i = 0; i < products.length; i++) {
                let { id, quantity, price, name } = products[i]
                await db.query(`insert into orderr_detail(orderr_id,product_id,name,quantity,price) values(?,?,?,?,?) `, [orderr_id, id, name, quantity, price], (err, datadetail) => {
                    if (err) console.log(err)
                })
                //console.log("check for >>>>>>", products[i])
            }
            req.session.cart = []
            res.redirect('/')
        }
    })
}

let detailorder = async (req, res) => {
    if (!req.session.isLogged) {
        res.redirect('/login')
    }
    else {
        let orderr_id = req.params.id
        await db.query("select * from orderr_detail where orderr_id = ?", [orderr_id], (err, data) => {
            if (err) console.log(err)
            else {
                res.render('user/order/order-detail', {
                    data,
                    user: req.session.user
                })
            }
        })
    }
}

let getupdate = async (req, res) => {
    await db.query("select * from orderr where id = ? ", [req.params.id], (err, data) => {
        if (err) console.log(err)
        else {
            // console.log(data.length)
            res.render('user/order/update-order', {
                data,
                user: req.session.user
            })
        }
    })
}

let postupdate = async (req, res) => {
    let { id, fullname, email, phone_number, address } = req.body
    await db.query("update orderr set fullname=?, email=?, phone_number=?, address=? where id=? ", [fullname, email, phone_number, address, id], (err, data) => {
        if (err) console.log(err)
        else res.redirect('/listorder')
    })
}
//admin
let getorder = async (req, res) => {
    await db.query("select * from orderr", (err, data) => {
        if (err) console.log(err)
        else {
            res.render('admin/orders/index', {
                data,
                user: req.session.user
            })
        }
    })
}

let getorderdetail = async (req, res) => {
    let orderr_id = req.params.id
    await db.query("select * from orderr_detail where orderr_id = ?", [orderr_id], (err, data) => {
        if (err) console.log(err)
        else {
            res.render('admin/orders/order-detail', {
                data,
                user: req.session.user
            })
        }
    })
}

module.exports = {
    home, checkout, detailorder, getupdate, postupdate, getorder, getorderdetail
}