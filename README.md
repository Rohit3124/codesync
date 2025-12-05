# Real-Time Collaborative Code Editing Platform

This solution is a comprehensive real-time collaborative code editing platform designed to enhance teamwork, productivity, and seamless communication among developers. It allows multiple users to work together on the same project with instant synchronization across all files and folders, ensuring that every change is reflected for all collaborators in real time. Users can create, open, edit, save, delete, and organize files and directories, with the option to download the entire codebase as a ZIP file for offline use or deployment.

The platform supports a wide range of programming languages with syntax highlighting, auto-language detection, and smart code suggestions to improve coding efficiency. A built-in code execution engine enables users to run their programs directly within the workspace. Collaboration features include unique room generation, real-time chat, user presence tracking, join/leave notifications, and visual indicators showing who is editing or selecting specific code sections at any moment.

To enhance personalization and user comfort, the platform offers multiple themes, customizable font styles and sizes, and an integrated collaborative drawing board for brainstorming. An advanced AI Copilot assists with intelligent code generation, providing options to insert, replace, or copy code effortlessly. Overall, it delivers a powerful, interactive, and user-friendly environment for modern collaborative development.


# Installation

### 1. Fork the Repository

Click the **Fork** button at the top-right on GitHub.

### 2. Clone Your Fork

```bash
git clone https://github.com/Rohit3124/codesync.git
```

### 3. Create .env file: Inside the client and server directories create .env and set:

#### Client (`client/.env`)

```bash
VITE_BACKEND_URL=http://localhost:3000
```

#### Server (`server/.env`)

```bash
PORT=3000
```

### 4. Install dependencies:

```bash
npm install     # Run in both client and server directories
```

### 5. Start the servers:

#### Frontend:

```bash
cd client
npm run dev
```

#### Backend:

```bash
cd server
npm run dev
```

### 6. Access the application:

```bash
http://localhost:5173/
```
