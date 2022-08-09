const {application} = require(`express`);
const express = require('express');
const db = require('./config/db');
const app = express();


// SERVER START
app.listen(3000, function () {
    console.log(`Server Listening on Port 3000;`);
});


// GET Methods
app.get(`/userInfo/user`, (req, res) => {
    db.query(`SELECT * FROM user WHERE id=?;`, [req.query.id], (err, data) => {
        if (!err) {
            res.send( {name: data[0].name, public_key: data[0].public_key, user_avatar: data[0].user_avatar, friend_list: data[0].friend_list} );
        }
        else res.send(err);
    });
});


// POST Methods
app.post(`/AddNewUser/normal`, (req, res) => { // 회원가입 - 로그인 다시 만들기
    const hash = giveHash(req.body.name, req.body.created_at)
    db.query(`INSERT INTO user (hash, created_at, name, public_key, user_avatar, friend_list, password, repair_key) VALUES(?, NOW(), ?, ?, 10, ?, ?);`,
    [])
});




app.post(`/userInfo/edit`, (req, res) => { // User Avatar Change
    db.query(`UPDATE user SET user_avatar=? WHERE id=?;`, [req.body.user_avatar, req.body.id], (err, data) => {
        if (!err) {
            db.query(`SELECT * FROM user WHERE id=?;`, [req.body.id], (err, data) => {
                if (!err) {
                    res.send({ id: data[0].id, user_avatar: data[0].user_avatar});
                } else {
                    res.send(err);
                }
            });
        } else {
            res.send(err);
        }
    });
});