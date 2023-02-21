import db from "../config/connecDB"

let home = async (req, res) => {

    await db.query(`select * from product where category_id = 'ctg2'  `, async (err, data1) => {
        if (err) console.log(err)
        else {
            await db.query(`select * from product where category_id = 'ctg1'  `, (err, data2) => {
                if (req.session.isLogged) {

                    return res.render("user/home", {
                        user: req.session.user,
                        data1,
                        data2,
                    })
                }
                if (req.session.adisLogged) {
                    res.redirect('/admin')
                }
                else return res.render("user/home", {
                    user: "",
                    data1,
                    data2,
                })
            })

        }
    })

}
let login = async (req, res) => {
    let { email, password } = req.body
    let sql = `select * from user where email = '${email}' and password = '${password}' `
    await db.query(sql, (err, data) => {
        if (data.length > 0) {
            if (data[0].roleid === "R1") {
                req.session.adisLogged = true;
                req.session.user = data[0];
                req.session.cart = [];
                res.redirect('/admin')
            }
            else {
                req.session.isLogged = true;
                req.session.user = data[0];
                req.session.cart = [];
                res.redirect('/')
            }
        }
        else {
            res.render('user/login', {
                err: "Sai thông tin đăng nhập, mời bạn nhập lại"
            })
        }
    })
}
let register = async (req, res) => {
    let { id, fullname, email, phone_number, address, password, re_password } = req.body
    await db.query(`select * from user where email = '${email}' and roleid = 'R2'`, (err, data) => {
        if (data.length > 0) {
            return res.render('user/register', {
                err: "Email đã sử dụng, mời nhập lại thông tin"
            })
        }
        if (password != re_password) {
            return res.render('user/register', {
                err: "Mật khẩu nhập lại không trùng khớp"
            })
        }
        let sql = `insert into user values ('${id}','${fullname}','${email}','${phone_number}','${address}','${password}','R2')`
        db.query(sql, (err, data) => {
            if (err) console.log(err)
            res.redirect('/login')
        })
    })
}
let detailproduct = async (req, res) => {
    let id = req.params.id
    db.query('select * from product where id = ?', [id], (err, data) => {
        if (err) console.log(err)
        else {
            console.log(req.params)
            res.render('user/detail-product', {
                data,
                user: req.session.user
            })
        }
    })

}
module.exports = {
    login, register, home, detailproduct,
}