const { Pool } = require('pg')

const pool = new Pool({
  connectionString: process.env.DATABASE_URL || ''
})

pool.connect()
  .then(() => console.log('connected to db'))
  .catch((err: any) => console.error('Error connecting to Postgres db', err.stack))

export { pool }