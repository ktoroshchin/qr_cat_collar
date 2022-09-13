import path from 'path'
import dotenv from 'dotenv'

export const ENV = process.env.NODE_ENV || 'development'
export const ROOT = path.resolve('cat-collar-api')
dotenv.config({ path: `${ROOT}/../.env.${ENV}` })