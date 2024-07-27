import express, { Request, Response } from "express";

const app = express();

app.get("/api", (_req: Request, res: Response) => {
  res.json({ message: "api routes typescript" });
});
app.get("*", (_req: Request, res: Response) => {
  res.json({ message: "server work typescript" });
});

app.listen(5000, () => console.log("server running on port 5000"));
