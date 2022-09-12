import { ENV, ROOT } from '../environments'
require('dotenv').config({ path: `${ROOT}/../.env.${ENV}` })
import { database } from './dbClient'
import fs from 'fs'

function read(file: string): Promise<string> {
    return new Promise((resolve, reject) => {
        fs.readFile(file, { encoding: 'utf-8' }, (err, data) => {
            if (err) return reject(err)
            resolve(data)
        })
    })
}

(async function reset(db: any): Promise<void> {
    if (ENV === 'development' || ENV === 'test') {

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
            db.end()
            process.exit()
        }
    }
})(database)