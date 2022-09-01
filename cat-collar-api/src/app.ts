import express from 'express'
import { pool } from './db/dbClient'

const app = express()

function application(env: any): express.Application {

    app.get('/', async (req, res) => {
        const data = await pool.query("SELECT * FROM owner_information")

        res.json({user: data.rows})
        res.end()
    })

    return app
}

export { application }