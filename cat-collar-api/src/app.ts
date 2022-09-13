import express from 'express'
import pg from 'pg'

const app = express()

function application(env: string, db: pg.PoolClient): express.Application {
    app.get('/', async (req, res) => {
        const data: pg.QueryResult = await db.query("SELECT * FROM owner_information;")
        res.json({ user: data.rows })
        res.end()
    })

    return app
}

export { application }