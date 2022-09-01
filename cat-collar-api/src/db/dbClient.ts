const { Pool } = require('pg')

const pool = new Pool({
    user: process.env.PGUSER,
    password: process.env.PGPASSWORD,
    host: process.env.localhost,
    database: process.env.PGDATABASE,
    port: process.env.PGPORT
})

pool
  .connect()
  .then(() => console.log('connected to db'))
  .catch((err: any) => console.error('Error connecting to Postgres db', err.stack))

export { pool }