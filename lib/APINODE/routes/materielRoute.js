const express = require("express");

const router = express.Router();

router.get("/", (req, res) => {
  req.getConnection((error, connection) => {
    if (error) {
      console.log(error);
    } else {
      let requete = "SELECT * FROM materiel";
      connection.query(requete, [], (err , result) => {
        res.json(result);
      });
    }
  });
});

router.delete("/deleteMateriel/:id", (req, res) => {
  let id = req.params.id;
  req.getConnection((error, connection) => {
    if (error) {
      console.log(error);
    } else {
      let requete = "DELETE FROM materiel where id = ? ";
      connection.query(requete, [id], (err , result) => {
        res.json(result);
      });
    }
  });
});

router.post("/insertMateriel", (req, res) => {
  console.log(req.body);
  req.getConnection((error, connection) => {
    if (error) {
      console.log(error);
    } else {
      let design = req.body.design;
      let quantite = req.body.quantite;
      let etat = req.body.etat;
      let requete =
        "insert into materiel (design , quantite , etat ) VALUES ( ? , ? , ? )";
      connection.query(requete, [design, quantite , etat ], (err, result) => {
        if (err) {
          res.status(404).json(result);
        } else {
          res.json(result);
        }
      });
    }
  });
});

router.patch("/updateMateriel/:id", (req, res) => {
  console.log(req.body);
  req.getConnection((error, connection) => {
    if (error) {
      console.log(error);
    } else {
      let design = req.body.design;
      let quantite = req.body.quantite;
      let etat = req.body.etat;
      let id = req.params.id;
      let requete =
        "update materiel set design = ? , quantite = ? , etat = ?  where id = ?";
      connection.query(requete, [design, quantite , etat , id], (err, result) => {
        if (err) {
          res.status(404).json(result);
        } else {
          res.json(result);
        }
      });
    }
  });
});

module.exports = router;
