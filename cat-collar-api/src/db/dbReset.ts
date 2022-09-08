// import { pool } from './dbClient'
import fs from 'fs'
// import ENV  from '../environments'

console.log('ENV=> ', process.env)


function read(file: fs.PathOrFileDescriptor) {
    return new Promise((resolve, reject) => {
        fs.readFile(file, { encoding: 'utf-8' } , (err, data) => {
            
        })
    })
}