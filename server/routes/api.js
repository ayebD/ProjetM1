const express = require('express')
const router = express.Router()

const bcrypt = require('bcrypt')
const { Client } = require('pg')
const { Store } = require('express-session')

const client = new Client({
  user: 'postgres',
  host: 'localhost',
  password: 'ZAZA92izi...',
  database: 'tech'
 })

 client.connect()



/**
 * Dans ce fichier, vous trouverez des exemples de requêtes GET, POST, PUT et DELETE
 * Ces requêtes concernent l'ajout ou la suppression d'articles sur le site
 * Votre objectif est, en apprenant des exemples de ce fichier, de créer l'API pour le panier de l'utilisateur
 *
 * Notre site ne contient pas d'authentification, ce qui n'est pas DU TOUT recommandé.
 * De même, les informations sont réinitialisées à chaque redémarrage du serveur, car nous n'avons pas de système de base de données pour faire persister les données
 */

router.post("/register", async (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  check(email).then((resultat) => {

    if (resultat.rowCount === 0) {

      bcrypt.hash(password, 10).then(hashPassword => {

        client.query({

          text: "INSERT INTO users (email,password) VALUES($1,$2)",
          values: [email, hashPassword]

        });
      })

      res.json({ message: "Registed" });
      console.log("coucou")
    }
    else {
      res.json({ message: "Error" });
      console.log("écrit bien le sang")

      return;
    }
  });

});

async function check(email) {
  const sql = "SELECT * FROM users WHERE email=$1";
  return await client.query({
    text: sql,
    values: [email], // ici name et description ne sont pas concaténées à notre requête
  })
}

async function checkAdmin(id) {
  const sql = "SELECT perm FROM users WHERE id=$1";
  return await client.query({
    text: sql,
    values: [id],
  })
}

router.post("/login", async (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  check(email).then(async (resultat) => {
    if (resultat.rowCount >= 1) {
      let resu = resultat.rows[0]
      if (await bcrypt.compare(password,resu.password)){
        if (req.session.userId === resu.id) {
          res.json({message: "AlreadyConnected", userId: resu.id})
        } else {
          req.session.userId = resu.id
          res.json({message: "Connected", userId: resu.id})
        }
      } else {
        res.json({ message: "PasswordForget", userId: -1 })
      }
    }
  })
})

router.post("/disconnect", (req, res) => {

  req.session.userId = -1;
  res.json({ message: "disconnected" })

});

router.get("/me", async (req, res) => {
  if(CheckCo(req)){

    res.json({message: req.session.userId})

  }
  else{
    res.json({message: -1})
  }

})

router.get("/perm", async (req, res) => {

  const sql = "SELECT perm FROM users WHERE id=$1"
  return await client.query({
    text: sql,
    values: [req.session.userId]
  }).then( (result) => {

    res.json({message: result})

  })
})

router.get("/name", async (req, res) => {

  const sql = "SELECT email FROM users WHERE id=$1"
  return await client.query({
    text: sql,
    values: [req.session.userId]
  }).then( (result) => {

    res.json({message: result})

  })
})

/*
 * Cette route doit permettre de confirmer un panier, en recevant le nom et prénom de l'utilisateur
 * Le panier est ensuite supprimé grâce à req.session.destroy()
 */
function CheckCo(req){
  if(req.session.userId !== undefined && req.session.userId !== -1){
    return true
  } else {
    return false

  }
}



/**
 * Cette route envoie l'intégralité des articles du site
 */
router.get('/articles', async (req, res) => {

  const sql = "SELECT * FROM articles"
  return await client.query({

    text: sql

  }).then( async (result) =>{

    res.json({message : result})

  })


})

/**
 * Cette route crée un article.
 * WARNING: dans un vrai site, elle devrait être authentifiée et valider que l'utilisateur est bien autorisé
 * NOTE: lorsqu'on redémarre le serveur, l'article ajouté disparait
 *   Si on voulait persister l'information, on utiliserait une BDD (mysql, etc.)
 */

router.get('/article/:articleId', async (req, res) => {

  const articleId = req.params.articleId;
  client.query({
    text: "SELECT * FROM articles WHERE id=$1",
    values: [articleId]
  }).then( async (result) => {

    res.json({ message: result })

  })

});

router.post('/article', (req, res) => {
  const texte = req.body.text;
  const titre = req.body.title;
  const ima = req.body.image;
  const crea = req.body.price;

  client.query({

    text: "INSERT INTO articles (text,title,image,price) VALUES($1,$2,$3,$4)",
    values: [texte, titre, ima, crea]

  }).then( async (result) =>{

    client.query({

      text: "SELECT * FROM articles ORDER BY ID DESC LIMIT 1",

    }).then( async (result) =>{

      console.log(result.rows.id)
      res.json({ id: result.rows[0].id, text: texte, title: titre, image: ima, price: crea});

    })
  })

})

router.put('/article', (req, res) => {

  const article = {
    id: req.body.id,
    title: req.body.title,
    text: req.body.text,
    image: req.body.image,
    price: req.body.price
  };

  client.query({

    text: "UPDATE articles SET title=$1, text=$2, image=$3, price=$4 WHERE id=$5",
    values: [article.title, article.text, article.image, article.price, article.id]

  }).then( async (result) => {

    res.json({ message: `article ${article.id} successfully edited` });

  })

})

router.delete('/article/:articleId', (req, res) => {

  const articleId = req.params.articleId;
  client.query({

    text: "DELETE FROM articles WHERE id=$1",
    values: [articleId]

  }).then( async(result) => {

      res.json({ message: `article #${articleId} a bien été deleted` })

  })

})

module.exports = router
