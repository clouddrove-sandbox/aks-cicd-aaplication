const express = require("express");
const app = express();

const PORT = process.env.PORT || 80;

app.get("/", (req, res) => {
  res.send(`
    <h2>🎉 Hugin Test App Running Successfully!</h2>
    <p>Secret loaded at runtime:</p>
    <pre>${process.env.REFRESH_TOKEN || "❌ No secret found"}</pre>
    <pre>${process.env.ACCESS_TOKEN || "❌ No secret found"}</pre>
    <pre>${process.env.DB_URL || "❌ No secret found"}</pre>
  `);
});

app.listen(PORT, () => {
  console.log(`🚀 App running on port ${PORT}`);
  console.log(`🔐 REFRESH_TOKEN loaded from runtime:`, process.env.REFRESH_TOKEN);
  console.log(`🔐 ACCESS_TOKEN loaded from runtime:`, process.env.ACCESS_TOKEN);
  console.log(`🔐 DB_URL loaded from runtime:`, process.env.DB_URL);
});
