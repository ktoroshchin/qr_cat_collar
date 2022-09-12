import { application as app } from './app'
import { ENV } from './environments'
import { pool } from './db/dbClient'

const PORT = process.env.PORT

app(ENV, pool).listen(PORT, () => console.log(`Listening on port ${PORT}`))