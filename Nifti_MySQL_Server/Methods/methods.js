const {application} = require(`express`);
const express = require('express');
const { default: BlockChain } = require('../modules/blockchain');
const db = require('./config/db');
const app = express();

const blockChain = new BlockChain()

// SERVER START
app.listen(3000, function () {
    console.log(`Server Listening on Port 3000;`);
});


// GET Methods
app.get(`/userInfo/user`, (req, res) => {
    db.query(`SELECT * FROM user WHERE id=?;`, [req.query.id], (err, data) => {
        if (!err) {
            res.send( {chained_hash: data[0].chained_hash, name: data[0].name, token: data[0].token, user_avatar: data[0].user_avatar, friend_list: data[0].friend_list} );
        }
        else res.send(err);
    });
});


// POST Methods
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


// Add New User
app.post(`add/user/newUser`, (req, res) => {
    db.query(`SELECT token FROM user;`, (err, userData) => {
        if (userData.find(req.body.token)) {
            res.send({ "error": "Same User"})
        } else {
            db.query(`SELECT name FROM user;`, (err, nameData) => {
                if (nameData.find(req.body.name)) {
                    res.send({"error" : "Same name"})
                } else {
                    const newHashBlock = blockChain.addBlock()
                    db.query(`INSERT INTO user (?, ?, ?, ?, ?, ?, ?, ?) VALUES(unchained_hash, chained_hash, token, created_at, name, friend_list, repair_key);`,
                    [newHashBlock.unChained_Hash, newHashBlock.Chained_Hash, req.body.token, newHashBlock.created_at, req.body.name, " ",encodeString(req.body.name)], (err) => {
                        if (!err) {
                            db.query(`SELECT * FROM user WHERE chained_hash = ?`, [newUserInfo.chained_hash], (err, data) => {
                                if (!err) {
                                    res.send(data)
                                } else {
                                    res.send(err)
                                }
                            })
                        } else {
                            res.send(err)
                        }
                    })
                }
            })
        }
    })
})


function giveNewUserInfo(name, created_at) {
    const newBlock = NewBlockMakeFunction(name, created_at)
    const repair_key = encodeString(newBlock.unchained_hash)
    const forReturn = [newBlock.unchained_hash, newBlock.chained_hash, created_at, name,10, undefined, repair_key]

    return forReturn
}


function encodeString(unencodedString) {
    let index = 0;
    let encodedString = "01";
    [...unencodedString].forEach(i => {
        encodeString += unencodedString.charCodeAt(index).toString(16);
    });

    return encodedString
}

/*
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| unchained_hash | text        | YES  |     | NULL    |                |
| chained_hash   | text        | YES  |     | NULL    |                |
| created_at     | datetime    | NO   |     | NULL    |                |
| name           | varchar(10) | NO   |     | NULL    |                |
| user_avatar    | int         | YES  |     | 10      |                |
| friend_list    | text        | YES  |     | NULL    |                |
| repair_key     | text        | NO   |     | NULL    |                |
| id             | int         | NO   | PRI | NULL    | auto_increment |
+----------------+-------------+------+-----+---------+----------------+
*/