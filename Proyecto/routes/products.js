const express = require("express")
const path = require("path");
const multer = require('multer')
const router = express.Router()
const productsController = require("../controllers/productsController.js")
const mainControllers = require("../controllers/mainControllers.js")



var storage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null, 'public/images/products')
    },
    filename: function(req,file,cb){
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
})
var cargaArchivo = multer({storage: storage})


// VER TODOS LOS PRODUCTOS .get + controler.index "/"

router.get("/", productsController.list)

// CREAR UN PRODUCTO ** CREAR UN PRODUCTO 
router.get("/create", productsController.create)
router.post("/", cargaArchivo.any(), productsController.store)

// VER UN PRODUCTO ** VER UN PRODUCTO
router.get("/:id", productsController.productDetail)

// borrar detail y poner ":id"

// EDITAR UN PRODUCTO ** EDITAR UN PRODUCTO
router.get("/:id/edit", productsController.edit)
// router.put('/:id', productsController.confirm)

// router.delete('/delete/:id', productsController.destroy)
router.delete('/delete/:id', function(req,res){
    res.send("SOY DELETE")
})
// hacer otra ruta con put. methodOverride



// VER CARRITO ** VER CARRITO
router.get("/cart", mainControllers.cart)
// falta edit del carrito




module.exports = router