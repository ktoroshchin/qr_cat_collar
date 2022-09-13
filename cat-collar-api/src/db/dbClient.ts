import pg from "pg"

interface IDatabase {
  connect(): Promise<pg.PoolClient>,
}

class Database implements IDatabase {
  private _pool: pg.Pool

  constructor() {
    this._pool = new pg.Pool({
      connectionString: process.env.DATABASE_URL || ''
    })
  }

  public async connect(): Promise<pg.PoolClient> {
    try {
      const client = this._pool.connect()
      console.log('Connected to DB')
      return client
    } catch (err) {
      return Promise.reject(err)
    }
  }
}

const database = new Database()

export {
  database,
  IDatabase
}  