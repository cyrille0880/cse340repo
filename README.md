# cse340repo

## Database setup

Set `DB_URL` in the root `.env` file to your PostgreSQL connection string. Then run
`src/setup.sql` against that database to create and seed the organization table.
Start the application with `node server.js` and open `/organizations` to view the
partner organizations.