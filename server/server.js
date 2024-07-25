const express = require("express")


const app = express()

app.get('/api',(req, res)=>{
    res.json({message:"api routes"})
})
app.get('*',(req, res)=>{
    res.json({message:"server work"})
})

app.listen(5000,()=>console.log('server running on port 5000'))