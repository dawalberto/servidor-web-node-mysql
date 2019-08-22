const app = require('express')()
const bodyParser = require('body-parser')
const cors = require('cors')

const libros = require('./routes/libro')

app.use(bodyParser.json())
app.use(cors())
app.use('/libros', libros)

app.use((req, res, next) => {
    let method = req.method
    let uri = req.url
    let date = new Date()

    console.log(`${method} - ${uri} - ${date}`)

    next()
})

app.listen(8080, () => {
    console.log('Escuchando por el puerto 8080')
})
