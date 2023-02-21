import express from "express"
import db from "../config/connecDB"

//category
let category = async (req, res) => {
    await db.query("select * from category", (err, data) => {
        if (err) console.log(err)
        else res.render("admin/category/index", {
            data,
            user: req.session.user
        })

    })
}
let getadd = (req, res) => {
    res.render('admin/category/add', {
        mess: "",
        err: ""
    })
}
let postadd = async (req, res) => {
    let { id, name } = req.body
    await db.query(`insert into category values ('${id}','${name}')`, (err, data) => {
        if (err) console.log(err)
        else res.render('admin/category/add', {
            mess: "Thêm thành công",
            err: ""
        })
    })
}
let getedit = async (req, res) => {
    let { id } = req.params
    await db.query(`select * from category where id = ?`, [id], (err, data) => {
        if (err) console(err)
        else {

            res.render('admin/category/update', {
                data,
                mess: ""
            })
        }
    })
}
let postedit = async (req, res) => {

    let { id, name } = req.body
    console.log(req.body)
    await db.query(`update category set name = ? where id = ?`, [name, id], (err, data) => {
        if (err) console.log(err)
        else {
            console.log(id)
            console.log(data.affectedRows)
            res.redirect('/category')
        }
    })
}

let deletectg = async (req, res) => {
    let { id } = req.params
    await db.query('delete from category where id = ?', [id], (err, data) => {
        if (err) console.log(err)
        else res.redirect('/category')
    })
}
module.exports = {
    category, getadd, postadd, getedit, postedit, deletectg
}