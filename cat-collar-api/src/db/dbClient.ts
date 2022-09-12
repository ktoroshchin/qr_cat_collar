const { Pool } = require('pg')

class Database {
  private _pool: any

  constructor() {
    this._pool = new Pool({
      connectionString: process.env.DATABASE_URL || ''
    })
  }

  public connect(): void {
    this._pool.connect()
      .then(() => console.log('connected to db'))
      .catch((err: any) => console.error('Error connecting to Postgres db', err.stack))
  }
}

export const database = new Database()