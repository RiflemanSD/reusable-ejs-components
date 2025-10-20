# 🔄 Migration Guide: Separate Repository Setup

Steps to move `reusable-ejs-components` to its own GitHub repository and use it in opproducts-js via Git Submodule.

---

## 📋 Plan Overview

**Before:**
```
opproducts-js/
└── reusable-ejs-components/  ← Part of opproducts-js repo
    └── components/
```

**After:**
```
# Separate repos:
1. github.com/RiflemanSD/reusable-ejs-components  ← New standalone repo
2. github.com/RiflemanSD/opproducts-js            ← Uses components as submodule

# In opproducts-js:
opproducts-js/
└── lib/
    └── reusable-ejs-components/  ← Git submodule pointing to separate repo
```

---

## 🚀 Step-by-Step Instructions

### **Step 1: Create New GitHub Repository**

1. Go to GitHub: https://github.com/new
2. Create new repository:
   - **Name:** `reusable-ejs-components`
   - **Description:** "Reusable EJS components for Express.js applications"
   - **Visibility:** Public (or Private if you prefer)
   - ✅ **Initialize with README:** NO (we already have one)
   - **License:** MIT

3. Copy the repository URL:
   ```
   https://github.com/RiflemanSD/reusable-ejs-components.git
   ```

---

### **Step 2: Prepare Components Directory**

```bash
cd /www/wwwroot/opproducts-js/reusable-ejs-components

# Initialize as Git repo
git init

# Copy the NEW_REPO_README.md to README.md
cp NEW_REPO_README.md README.md

# Create .gitignore
cat > .gitignore << 'EOF'
node_modules/
*.log
.DS_Store
.env
EOF

# Add all files
git add .
git commit -m "Initial commit: Reusable EJS Components Library

- 4 production-ready components
- Complete documentation
- Installation scripts
- Ready for distribution"

# Add remote and push
git remote add origin https://github.com/RiflemanSD/reusable-ejs-components.git
git branch -M main
git push -u origin main
```

---

### **Step 3: Setup Submodule in opproducts-js**

```bash
cd /www/wwwroot/opproducts-js

# Remove current reusable-ejs-components (we'll add it as submodule)
# First, make sure it's committed to the new repo!
rm -rf reusable-ejs-components/

# Remove the symlink
rm views/partials/components

# Add as Git submodule
git submodule add https://github.com/RiflemanSD/reusable-ejs-components.git lib/reusable-ejs-components

# Initialize submodule
git submodule init
git submodule update

# Recreate symlink to new location
ln -s ../../lib/reusable-ejs-components/components views/partials/components

# Verify symlink
ls -la views/partials/components
```

---

### **Step 4: Update opproducts-js .gitignore**

```bash
cd /www/wwwroot/opproducts-js

# Make sure .gitignore doesn't ignore submodules
echo "" >> .gitignore
echo "# Keep submodules" >> .gitignore
echo "!lib/" >> .gitignore
```

---

### **Step 5: Commit Changes**

```bash
cd /www/wwwroot/opproducts-js

git add .gitmodules lib/reusable-ejs-components views/partials/components
git commit -m "♻️ Refactor: Move components to separate repository

- Removed reusable-ejs-components from main repo
- Added as Git submodule in lib/
- Updated symlink to point to new location
- Components now in: github.com/RiflemanSD/reusable-ejs-components"

git push
```

---

### **Step 6: Test Everything Works**

```bash
# Verify symlink
ls -la /www/wwwroot/opproducts-js/views/partials/components
# Should show: components -> ../../lib/reusable-ejs-components/components

# Verify files exist
ls /www/wwwroot/opproducts-js/lib/reusable-ejs-components/components/

# Restart app
pm2 restart opproducts

# Test
curl http://localhost:4321/csv-converter
```

---

## 🔄 Future Workflow

### **Update Components in Separate Repo**

```bash
# Edit components
cd /www/wwwroot/opproducts-js/lib/reusable-ejs-components
cd components/
nano data-table.ejs  # Make changes

# Commit to components repo
git add .
git commit -m "Update: data-table component"
git push

# Now update in opproducts-js
cd /www/wwwroot/opproducts-js
git submodule update --remote lib/reusable-ejs-components
git add lib/reusable-ejs-components
git commit -m "Update components to latest version"
git push

# Restart app
pm2 restart opproducts
```

### **Use in Other Projects**

```bash
cd /path/to/new-project

# Add as submodule
git submodule add https://github.com/RiflemanSD/reusable-ejs-components.git lib/components

# Create symlink
ln -s ../../lib/components/components views/partials/components

# Copy CSS
cp lib/components/styles/style.css public/

# Use in views
# <%- include('partials/components/data-table', {...}) %>
```

---

## 📦 Alternative: Keep in Same Repo

If you prefer to keep them in the same repo but still organized:

```bash
cd /www/wwwroot/opproducts-js

# Keep current structure but clean up
git rm reusable-ejs-components/NEW_REPO_README.md

git commit -m "Clean up: remove migration files"
git push
```

---

## 🎯 Benefits of Separate Repo

### ✅ Pros:
- **Reusability**: Easy to use in ANY project
- **Versioning**: Tag releases (v1.0.0, v1.1.0, etc.)
- **NPM Publishing**: Can publish to npm
- **Focused Development**: Issues/PRs specific to components
- **Community**: Others can use and contribute
- **Portfolio**: Standalone project for your GitHub profile

### ⚠️ Cons:
- **Complexity**: Need to manage 2 repos
- **Submodule Management**: Git submodules can be tricky
- **Extra Steps**: Update in 2 places (components repo + main repo)

---

## 💡 Recommended Approach

### **For Your Use Case:**

I recommend **separate repository** because:

1. You plan to use in multiple projects
2. Components are well-defined and stable
3. Good for portfolio/resume
4. Professional structure
5. Can share with others

---

## 🔧 Quick Commands Reference

```bash
# Create new repo
cd /www/wwwroot/opproducts-js/reusable-ejs-components
git init
cp NEW_REPO_README.md README.md
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/RiflemanSD/reusable-ejs-components.git
git push -u origin main

# Setup in opproducts-js
cd /www/wwwroot/opproducts-js
rm -rf reusable-ejs-components/ views/partials/components
git submodule add https://github.com/RiflemanSD/reusable-ejs-components.git lib/reusable-ejs-components
ln -s ../../lib/reusable-ejs-components/components views/partials/components
git add .
git commit -m "Add components as submodule"
git push
pm2 restart opproducts

# Update components
cd lib/reusable-ejs-components
git pull
cd ../..
git add lib/reusable-ejs-components
git commit -m "Update components"
git push
```

---

## ❓ Need Help?

If you decide to do this and need help with any step, just ask! I can:
- Execute the commands for you
- Troubleshoot issues
- Test everything works

---

**Ready to make your components a standalone library!** 🚀
