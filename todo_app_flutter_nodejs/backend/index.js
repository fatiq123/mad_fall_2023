const app = require('./app');
const db = require('./config/db');
const UserModel = require('./models/user_model');

const PORT = 3000;


app.get('/api', (req, res) => {
    res.send('Hello World');
});


app.listen(PORT, () => {
    console.log(`server is running on port ${PORT}`);
});