const conexion = require('./bdconfig');

module.exports = class Libro {
    constructor (libro) {
        this.cod = libro.cod,
        this.ISBN = libro.ISBN,
        this.titulo = libro.titulo,
        this.precio = libro.precio,
        this.url = libro.url,
        this.imagen = libro.imagen,
        this.cod_autor = libro.cod_autor
    }

    static cargarLibros() {

        return new Promise((resolve, reject) => {
            conexion.query('select * from libros', (error, resultado, campos) => {
                if (error) {
                    console.log('ERROR: ' + error)
                    reject(error)
                } else {
                    resolve(resultado.map(libro => new Libro(libro)))
                }
            })
        })

    };
    
    static buscarLibroPorId(id) {

        return new Promise((resolve, reject) => {
            conexion.query('select * from libros where cod = ?', id, (error, resultado, campos) => {
                if (error || resultado.length <= 0) {
                    reject('ERROR: ', error)
                } else {
                    resolve(resultado)
                }
            })
        })

    };
    
    static nuevoLibro(cod, ISBN, titulo, precio, url, imagen, cod_autor) {
        
        return new Promise((resolve, reject) => {
            let libro = {
                cod,
                ISBN,
                titulo,
                precio,
                url,
                imagen,
                cod_autor
            }
            conexion.query('insert into libros set ?', libro, (error, resultado, campos) => {
                if (error) {
                    reject('ERROR: ', error)
                } else {
                    resolve(resultado)
                }
            })
        })
    
    };
    
    static actualizarLibro(cod, ISBN, titulo, precio, url, imagen, cod_autor) {

        return new Promise((resolve, reject) => {
            conexion.query('update libros set cod = ?, ISBN = ?, titulo = ?, precio = ?, url = ?, imagen = ?, cod_autor = ? where cod = ?', [cod, ISBN, titulo, precio, url, imagen, cod_autor, cod], (error, resultado, campos) => {
                if (error) {
                    reject('ERROR: ', error)
                } else {
                    resolve(resultado)
                }
            })
        })

    };
    
    static async borrarLibro(id) {

        return new Promise((resolve, reject) => {
            conexion.query('delete from libros where cod = ?', id, (error, resultado, campos) => {
                if (error) {
                    reject('ERROR: ', error)
                } else {
                    resolve(resultado)
                }
            })
        })
        
    };
}