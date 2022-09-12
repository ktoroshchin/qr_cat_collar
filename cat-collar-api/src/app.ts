import express from 'express'
const app = express()

function application(env: any, db: any): express.Application {
   
    app.get('/', async (req, res) => {
        const data = await db.query("SELECT * FROM owner_information WHERE id='6774657c-68d0-4b82-98bf-2985b25b7dd3' ")

        res.json({ user: data.rows })
        res.end()
    })

    return app
}

export { application }