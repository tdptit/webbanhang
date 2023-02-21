import express from "express"
import db from "../config/connecDB"

let home = async (req, res) => {
    if (req.session.adisLogged) {
        await db.query("select * from category", async (err, data0) => {
            if (err) console.log(err)
            else {
                await db.query("select * from product where category_id = 'ctg1' ", async (err, data1) => {
                    if (err) console.log(err)
                    else {
                        await db.query("select * from product where category_id = 'ctg2'", async (err, data2) => {
                            if (err) console.log(err)
                            else {
                                await db.query("select * from orderr", (err, data3) => {
                                    if (err) console.log(err)
                                    else {
                                        return res.render("admin/home", {
                                            user: req.session.user,
                                            data0,
                                            data1,
                                            data2,
                                            data3
                                        })
                                    }
                                })
                            }
                        })
                    }
                })
            }
        })
    }
    else return res.render("home", {
        user: ""
    })
}

module.exports = {
    home
}

