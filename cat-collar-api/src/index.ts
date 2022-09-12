import { application as app } from './app'
import { ENV } from './environments'
import { database } from './db/dbClient'

const PORT = process.env.PORT
const DB = database.connect()
app(ENV, DB).listen(PORT, () => console.log(`Listening on port ${PORT}`))