const express = require('express');
const router = express.Router();
let Libro = require('../model/libro');


router.get('/', (req, res) => {

    Libro.cargarLibros()
        .then(response => {
            res.send(response)
        })
        .catch(err => {
            res.send(err)
        })

})

router.post('/', (req, res) => {

    let body = req.body

    let cod = body.cod
    let ISBN = body.ISBN
    let titulo = body.titulo
    let precio = body.precio
    let url = body.imagen
    let imagen = body.imagen
    let cod_autor = body.cod_autor

    Libro.nuevoLibro(cod, ISBN, titulo, precio, url, imagen, cod_autor)
        .then(response => {
            res.send(response)
        })
        .catch(err => {
            res.send(err)
        })

})

router.get('/:id', (req, res) => {

    Libro.buscarLibroPorId(req.params.id)
        .then(response => {
            res.send(response)
        })
        .catch(err => {
            res.send(err)
        })

})

router.put('/:id', (req, res) => {

    let body = req.body

    let id = req.params.id
    let ISBN = body.ISBN
    let titulo = body.titulo
    let precio = body.precio
    let url = body.imagen
    let imagen = body.imagen
    let cod_autor = body.cod_autor

    Libro.actualizarLibro(id, ISBN, titulo, precio, url, imagen, cod_autor)
        .then(response => {
            res.send(response)
        })
        .catch(err => {
            res.send(err)
        })

})

router.delete('/:id', (req, res) => {

    Libro.borrarLibro(req.params.id)
        .then(response => {
            res.send(response)
        })
        .catch(err => {
            res.send(err)
        })

})


module.exports = router