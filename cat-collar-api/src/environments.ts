import path from 'path'

export const ENV = process.env.NODE_ENV || 'development'
export const ROOT = path.resolve('cat-collar-api')
require('dotenv').config({path: `${ROOT}/../.env.${ENV}`})