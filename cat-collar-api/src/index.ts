import { application as app } from './app'
import { ENV } from './environments'
import { database } from './db/dbClient'

const PORT = process.env.PORT

// server entry point
const start = async (): Promise<void> => {
    const DB = await database.connect()
    app(ENV, DB).listen(PORT, () => console.log(`Listening on port ${PORT}`))
}

start()