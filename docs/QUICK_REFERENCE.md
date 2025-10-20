# 🚀 Quick Reference - Reusable EJS Components

---

## 📍 Current Project Structure

```
/www/wwwroot/opproducts-js/
├── views/partials/components/  → SYMLINK to reusable-ejs-components/components/
└── reusable-ejs-components/
    ├── components/             ← ACTUAL FILES HERE
    │   ├── data-table.ejs
    │   ├── stats-card.ejs
    │   ├── loading-button.ejs
    │   └── file-upload-form.ejs
    ├── docs/
    │   ├── README.md           ← Component docs
    │   ├── INSTALLATION.md     ← Installation guide
    │   └── GIT_SUBMODULE.md    ← Git submodule setup
    ├── scripts/
    │   └── copy-to-project.sh  ← Quick copy script
    └── package.json
```

---

## ✏️ Editing Components

### **Edit in ONE place:**
```bash
cd /www/wwwroot/opproducts-js/reusable-ejs-components/components/
nano data-table.ejs  # Or any editor
```

### **Test immediately:**
```bash
pm2 restart opproducts
# Visit: http://your-server:4321/csv-converter-debug
```

### **Commit changes:**
```bash
cd /www/wwwroot/opproducts-js
git add reusable-ejs-components/
git commit -m "Update: data-table component"
git push
```

---

## 🔄 Answers to Your Questions

### **1️⃣ GitHub as Library with Auto-Sync?**

✅ **YES!** Τρεις τρόποι:

#### **Method A: Git Submodule (Best για sync)**
```bash
# Σε νέο project:
git submodule add https://github.com/RiflemanSD/opproducts-js.git lib/opproducts
ln -s ../../lib/opproducts/reusable-ejs-components/components views/partials/components

# Update στα άλλα projects:
git submodule update --remote
pm2 restart app-name
```

#### **Method B: Git Pull**
```bash
# Clone σε shared location
git clone https://github.com/RiflemanSD/opproducts-js.git /opt/ejs-components

# Symlink από projects
ln -s /opt/ejs-components/reusable-ejs-components/components /www/wwwroot/project1/views/partials/components
ln -s /opt/ejs-components/reusable-ejs-components/components /www/wwwroot/project2/views/partials/components

# Update όλα μαζί
cd /opt/ejs-components && git pull && pm2 restart all
```

#### **Method C: Copy Script**
```bash
./reusable-ejs-components/scripts/copy-to-project.sh /path/to/new-project
```

---

### **2️⃣ Υποφάκελοι για οργάνωση?**

✅ **DONE!** Νέα structure:
- `components/` → .ejs files
- `docs/` → documentation
- `scripts/` → helper scripts

---

### **3️⃣ Χρήση από reusable-ejs-components αντί partials?**

✅ **DONE!** Με symlink:
```bash
views/partials/components → ../../reusable-ejs-components/components
```

**Benefits:**
- ✅ Μία μόνο πηγή αρχείων (single source of truth)
- ✅ Όχι duplication
- ✅ Edit σε ένα μέρος, δουλεύει παντού
- ✅ Εύκολο Git management

---

## 📦 Use in Other Projects

### **Option 1: Submodule (Recommended)**
```bash
cd /path/to/new-project
git submodule add https://github.com/RiflemanSD/opproducts-js.git lib/components
ln -s ../../lib/components/reusable-ejs-components/components views/partials/components
```

### **Option 2: Direct Copy**
```bash
cd /www/wwwroot/opproducts-js/reusable-ejs-components
./scripts/copy-to-project.sh /path/to/new-project
```

### **Option 3: Shared Location**
```bash
# One-time setup
git clone https://github.com/RiflemanSD/opproducts-js.git /opt/shared-components

# In each project
ln -s /opt/shared-components/reusable-ejs-components/components views/partials/components

# Update all projects at once
cd /opt/shared-components && git pull && pm2 restart all
```

---

## 🔧 Common Tasks

### **Add New Component**
```bash
cd /www/wwwroot/opproducts-js/reusable-ejs-components/components/
nano new-component.ejs

# Test
pm2 restart opproducts

# Commit
git add .
git commit -m "Add new-component"
git push
```

### **Update Component**
```bash
cd /www/wwwroot/opproducts-js/reusable-ejs-components/components/
nano data-table.ejs  # Make changes

# Test locally
pm2 restart opproducts
curl http://localhost:4321/csv-converter-debug

# Commit
git add .
git commit -m "Update: data-table - add new feature"
git push

# Update other projects (if using submodule)
cd /path/to/other-project
git submodule update --remote
pm2 restart app
```

### **Rollback Component**
```bash
cd /www/wwwroot/opproducts-js

# See history
git log --oneline reusable-ejs-components/

# Rollback to specific commit
git checkout <commit-hash> reusable-ejs-components/

# Or rollback last change
git checkout HEAD~1 reusable-ejs-components/

# Restart
pm2 restart opproducts
```

---

## 📚 Documentation Files

- **This file:** Quick reference
- **README.md:** Component usage & props
- **INSTALLATION.md:** Installation methods
- **GIT_SUBMODULE.md:** Git submodule setup guide

All in: `/www/wwwroot/opproducts-js/reusable-ejs-components/docs/`

---

## 🎯 Workflow Summary

### **Daily Development:**
1. Edit in `reusable-ejs-components/components/`
2. Test: `pm2 restart opproducts`
3. Commit: `git add . && git commit -m "..." && git push`

### **New Project:**
1. Choose method (submodule/copy/shared)
2. Setup symlink or copy files
3. Use components: `<%- include('partials/components/...') %>`

### **Sync Projects:**
```bash
# If using submodule
git submodule update --remote

# If using shared location
cd /opt/shared-components && git pull

# If using copy - run copy script again
./copy-to-project.sh /path/to/project
```

---

## 🔗 Links

- **GitHub:** https://github.com/RiflemanSD/opproducts-js
- **Components:** `/reusable-ejs-components/`
- **Test URL:** http://localhost:4321/csv-converter-debug

---

**Everything in one place, synced everywhere!** ✨
