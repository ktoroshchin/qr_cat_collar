import { ENV } from './environments'
import { application as app } from './app'

app(ENV).listen(8080, () => console.log('Listening on port '))