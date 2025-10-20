# 🔄 Git Submodule Setup Guide

Use this library in other projects with **automatic sync**.

---

## 🎯 What is Git Submodule?

- 📚 Include this library as a **dependency** in other projects
- 🔄 **Pull updates** from GitHub with one command
- 🔐 **Version control** - lock to specific versions
- 🚀 **No duplication** - single source of truth

---

## 📥 Setup in New Project

### **1. Add Submodule**

```bash
cd /path/to/new-project

# Add this repo as submodule
git submodule add https://github.com/RiflemanSD/opproducts-js.git lib/opproducts

# Initialize submodule
git submodule init
git submodule update
```

### **2. Create Symlink to Components**

```bash
cd /path/to/new-project

# Create symlink to components
mkdir -p views/partials
ln -s ../../lib/opproducts/reusable-ejs-components/components views/partials/components

# Verify
ls -la views/partials/components
```

### **3. Commit Setup**

```bash
git add .gitmodules lib/opproducts views/partials/components
git commit -m "Add EJS components library as submodule"
git push
```

---

## 🔄 Update Components in Project

### **Get Latest Changes**

```bash
cd /path/to/project

# Pull latest from GitHub
git submodule update --remote lib/opproducts

# Restart your app
pm2 restart app-name

# Or if using npm
npm run dev
```

### **Update All Projects at Once**

Create `update-components.sh`:
```bash
#!/bin/bash
# Update components in all projects

PROJECTS=(
    "/www/wwwroot/project1"
    "/www/wwwroot/project2"
    "/www/wwwroot/project3"
)

for project in "${PROJECTS[@]}"; do
    echo "📦 Updating $project..."
    cd "$project"
    git submodule update --remote lib/opproducts
    pm2 restart $(basename "$project") || echo "⚠️  Manual restart needed"
done

echo "✅ All projects updated!"
```

---

## 🏷️ Version Locking

### **Lock to Specific Version**

```bash
cd /path/to/project/lib/opproducts

# List available versions
git tag

# Checkout specific version
git checkout tags/v1.0.0

# Commit the lock
cd ../..
git add lib/opproducts
git commit -m "Lock components to v1.0.0"
```

### **Return to Latest**

```bash
cd /path/to/project/lib/opproducts
git checkout main
git pull
```

---

## 📋 Example: Full Setup

### **New Project Setup**

```bash
# 1. Create new project
mkdir my-new-app
cd my-new-app
git init

# 2. Setup Express
npm init -y
npm install express ejs

# 3. Add components library
git submodule add https://github.com/RiflemanSD/opproducts-js.git lib/opproducts
git submodule update --init --recursive

# 4. Create views structure
mkdir -p views/partials
ln -s ../../lib/opproducts/reusable-ejs-components/components views/partials/components

# 5. Copy styles
cp lib/opproducts/public/style.css public/

# 6. Create basic app
cat > app.js << 'EOF'
const express = require('express');
const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.render('index', {
        data: [
            ['Product', 'Price'],
            ['Laptop', '$999'],
            ['Mouse', '$25']
        ]
    });
});

app.listen(3000, () => console.log('Running on port 3000'));
EOF

# 7. Create view
mkdir -p views
cat > views/index.ejs << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>My App</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <h1>My Dashboard</h1>
    <%- include('partials/components/data-table', {
        data: data,
        title: 'Products'
    }) %>
</body>
</html>
EOF

# 8. Commit everything
git add .
git commit -m "Initial setup with EJS components"

# 9. Run
node app.js
```

---

## 🔧 Troubleshooting

### ❌ **Submodule is empty**

```bash
git submodule init
git submodule update
```

### ❌ **Changes not showing**

```bash
cd lib/opproducts
git pull origin main
cd ../..
pm2 restart app-name
```

### ❌ **Symlink broken**

```bash
rm views/partials/components
ln -s ../../lib/opproducts/reusable-ejs-components/components views/partials/components
```

---

## 🎯 Best Practices

### **1. Update Regularly**

```bash
# Weekly update script
cat > scripts/update-deps.sh << 'EOF'
#!/bin/bash
git submodule update --remote
pm2 restart all
EOF
chmod +x scripts/update-deps.sh

# Add to crontab
crontab -e
# Add: 0 2 * * 0 /path/to/project/scripts/update-deps.sh
```

### **2. Test Before Deploy**

```bash
# Update in dev
git submodule update --remote
npm test

# If OK, commit
git add lib/opproducts
git commit -m "Update components to latest"

# Deploy
git push
```

### **3. Document Version Used**

```bash
# In README.md
echo "## Dependencies" >> README.md
echo "- EJS Components: v1.2.0" >> README.md
```

---

## 📚 Advanced Usage

### **Multiple Projects Sharing Components**

```
projects/
├── project1/
│   └── lib/opproducts/  ← Submodule
├── project2/
│   └── lib/opproducts/  ← Same submodule
└── project3/
    └── lib/opproducts/  ← Same submodule

# Update all at once
for project in projects/*/; do
    cd "$project"
    git submodule update --remote
done
```

### **Fork for Custom Changes**

```bash
# 1. Fork the repo on GitHub
# 2. Use your fork as submodule
git submodule add https://github.com/YOUR-USERNAME/opproducts-js.git lib/opproducts

# 3. Make custom changes
cd lib/opproducts/reusable-ejs-components/components
# Edit files...

# 4. Push to your fork
git add .
git commit -m "Custom changes"
git push
```

---

## 🔗 Links

- **Main Repo:** https://github.com/RiflemanSD/opproducts-js
- **Components:** `/reusable-ejs-components/`
- **Git Submodules Docs:** https://git-scm.com/book/en/v2/Git-Tools-Submodules

---

**Keep your components in sync across all projects!** 🚀
