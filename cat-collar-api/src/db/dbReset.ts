import { ENV, ROOT } from '../environments'
import dotenv from 'dotenv'
dotenv.config({ path: `${ROOT}/../.env.${ENV}` })
import { IDatabase, database } from './dbClient'
import fs from 'fs'

function read(file: string): Promise<string> {
    return new Promise((resolve, reject) => {
        fs.readFile(file, { encoding: 'utf-8' }, (err, data) => {
            if (err) return reject(err)
            resolve(data)
        })
    })
}

(async function reset(database: IDatabase): Promise<void> {
    if (ENV === 'development' || ENV === 'test') {
        const db = await database.connect()
        try {
            const [create, seed] = await Promise.all([
                read(__dirname + '/schema/create.sql'),
                read(__dirname + `/schema/${ENV}.sql`)
            ])

            await Promise.all([db.query(create), db.query(seed)])
            console.log("Database Reset");

        } catch (error) {
            console.error(error)
        } finally {
            db.release()
            process.exit()
        }
    }
})(database)