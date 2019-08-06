const mysql = require('mysql');


let conexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'biblioteca'
});

//CONEXION
conexion.connect(error => {

    if (error) {
        console.log('Error al conectar con la base de datos')
    } else {
        console.log('Conexión satisfactoria')
    }

})


module.exports = conexion;