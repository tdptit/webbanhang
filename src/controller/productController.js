import express from "express"
import db from "../config/connecDB"

let product = async (req, res) => {
    await db.query("select * from product", (err, data) => {
        if (err) console.log(err)
        else res.render("admin/product/index", {
            data,
            user: req.session.user
        })

    })
}
let getadd = async (req, res) => {
    await db.query(`select * from category`, (err, data) => {
        if (err) console.log(err)
        else {
            res.render("admin/product/add", {
                mess: "",
                err: "",
                data,
            })
        }
    })

}
let postadd = async (req, res) => {
    let { id, category_id, title, image, price, description } = req.body
    await db.query(`select * from product where id = '${id}' `, async (err, data0) => {
        if (err) console(err)
        else {
            if (data0.length > 0) {
                await db.query('select * from category', (err, data) => {
                    if (err) console.log(err)
                    else {
                        res.render("admin/product/add", {
                            mess: "",
                            err: "ID_Sản phẩm đã tồn tại",
                            data
                        })
                    }
                })

            }
            else {
                await db.query(`insert into product values(?,?,?,?,?,?)`, [id, category_id, image, title, price, description], async (err, datapr) => {
                    if (err) console.log(err)
                    else {
                        await db.query('select * from category', (err, data) => {
                            if (err) console.log(err)
                            else {
                                res.render("admin/product/add", {
                                    mess: "Thêm thành công",
                                    data,
                                    err: ""
                                })
                            }
                        })
                    }
                })
            }
        }
    })
}
let detail = async (req, res) => {
    let id = req.params.id
    await db.query('select * from product where id = ?', [id], (err, data) => {
        if (err) console.log(err)
        else {
            console.log(data[0])
            res.render('admin/product/detail', {
                data
            })
        }
    })

}
let deletepr = async (req, res) => {
    let { id } = req.params
    await db.query('delete from product where id = ?', [id], (err, data) => {
        if (err) console.log(err)
        else res.redirect('/product')
    })
}
let getupdate = async (req, res) => {
    let { id } = req.params
    await db.query(`select * from product where id = ?`, [id], async (err, data) => {
        if (err) console(err)
        else {
            await db.query('select * from category', (err, data1) => {
                if (err) console.log(err)
                else res.render('admin/product/update', {
                    data,
                    mess: "",
                    data1
                })

            })
        }
    })
}
let postupdate = async (req, res) => {
    let { id, title, image, price, description } = req.body
    console.log(req.body)
    await db.query(`update product set title = ?,image =?, price=?, description=? where id = ?`, [title, image, price, description, id], (err, data) => {
        if (err) console.log(err)
        else {
            console.log(id)
            console.log(data.affectedRows)
            res.redirect('/product')
        }
    })
}
module.exports = {
    product, getadd, postadd, detail, deletepr, getupdate, postupdate
}