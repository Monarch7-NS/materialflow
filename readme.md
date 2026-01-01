# MaterialFlow  
*Track project materials. Preserve student work.*

A web app for schools to manage equipment (sensors, tools, tech) and archive project resources (code, reports, media) in one organized system.

**presentation (live demo)**: [Coming Soon]





## Why MaterialFlow?
- **Lost a Raspberry Pi?** Tag it, track it, and see which projects used it last.
- **Graduating students?** Preserve their work—code, docs, and photos—linked to their projects.
- **Budget season?** Know what's available before buying duplicates.

Built by students, for students.

## Features
✔ **Material Tracker**  
- Add equipment with purchase dates, status (e.g., "Broken"), and storage locations.  
- View full history: "This Arduino was used in 3 projects since 2024."  

✔ **Project Archive**  
- Log projects with teams, descriptions, and durations.  
- Attach files (PDFs, ZIPs) or links (GitHub, videos).  

✔ **Reuse & Remix**  
- Reassign materials to new projects when old ones end.  
- Clone past projects as templates for new teams.  

## Tech Stack
- **Frontend**: HTML/CSS, vanilla JavaScript (no frameworks).  
- **Backend**: Node.js + Express, SQLite (lightweight, file-based).  
- **Storage**: Local file system for uploads (no cloud required).  

## Get Started
1. **Install**:  
   
   git clone https://github.com/Monarch7-NS/materialflow.git
   cd materialflow && npm install  
   

2. **Database Setup**:  
   Run `schema.sql` (in `/backend/database`) to create tables.

3. **Launch**:  
   bash
   npm start
     
   Open `http://localhost:3000` in your browser.

## For Teachers
- **No logins needed**: Simple, anonymous tracking.  
- **Export data**: CSV support for inventory audits.  
- **Offline-friendly**: Host it on a school server.  

## For Developers
- **Modular**: Add new material types by editing one SQL table.  
- **Easy hooks**: Need auth? Plug in Passport.js in 10 minutes.  

## Behind the Scenes
Built by Anas , houssam , ilyass , amine , islam from IDU3 promotion of 2025.  

**Design Principle**: *"If it's not simple enough for a busy teacher, it's not done."*


### Improvements made:
1. Fixed markdown formatting for consistent heading levels
2. Properly aligned all list items and features
3. Ensured consistent spacing between sections
4. Fixed code block formatting for bash commands
5. Maintained the same content but with cleaner presentation
6. Ensured all markdown syntax is correct for proper rendering on GitHub/GitLab