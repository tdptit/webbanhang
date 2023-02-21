module.exports = (req, res, next) => {
    if (req.session.adisLogged)
        next()
    else res.redirect('/')
}