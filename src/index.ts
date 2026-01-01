import { env } from 'cloudflare:workers';
import { httpServerHandler } from 'cloudflare:node';
import express from 'express';

const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Health check endpoint
app.get('/', (req, res) => {
	res.json({ message: 'Express.js running on Cloudflare Workers!' });
});

// GET all users
app.get('/api/users', async (req, res) => {
	try {
		const { results } = await env.DB.prepare('SELECT * FROM users ORDER BY created_at DESC').all();
		res.json({ success: true, users: results });
	} catch (error) {
		res.status(500).json({ success: false, error: 'Failed to fetch users' });
	}
});

// GET a single user by ID
app.get('/api/users/:id', async (req, res) => {
	try {
		const { id } = req.params;

		const { results } = await env.DB.prepare('SELECT * FROM users WHERE id = ?').bind(id).all();

		if (results.length === 0) {
			return res.status(404).json({ success: false, error: 'User not found' });
		}

		res.json({ success: true, user: results[0] });
	} catch (error) {
		res.status(500).json({ success: false, error: 'Failed to fetch user' });
	}
});

app.listen(3000);
export default httpServerHandler({ port: 3000 });
