const ROOT = process.cwd()
const ENV = process.env.NODE_ENV || 'development'

require('dotenv').config({path: `${ROOT}/.env.${ENV}` });

export { ENV }