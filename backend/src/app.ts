import express from "express";
import cors from "cors";

import claimsRoutes from "./routes/claims.routes";
import approveRoutes from "./routes/approve.routes";
import processRoutes from "./routes/process.routes";

const app = express();

const allowedOrigins = [
  "http://localhost:3000",
  "https://expense-tracker-system-six.vercel.app",
  "https://expense-tracker-system-f5iyltu3d-jaysoftys-projects.vercel.app",
];

app.use(
  cors({
    origin: (origin, callback) => {
      if (
        !origin ||
        allowedOrigins.includes(origin)
      ) {
        callback(null, true);
      } else {
        callback(
          new Error(
            `Not allowed by CORS: ${origin}`
          )
        );
      }
    },
    credentials: true,
  })
);

app.use(express.json());

app.get("/", (_req, res) => {
  res.status(200).json({
    success: true,
    message: "Expense Claim API is live!",
  });
});

app.get("/api/health", (_req, res) => {
  res.status(200).json({
    success: true,
    message: "Expense Claim API is running",
  });
});

app.use(
  "/api/claims",
  claimsRoutes
);

app.use(
  "/api/approve",
  approveRoutes
);

app.use(
  "/api/process",
  processRoutes
);

export default app;