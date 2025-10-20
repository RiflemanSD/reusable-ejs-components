# 📦 Reusable EJS Components - Installation Guide

Αυτή η βιβλιοθήκη περιέχει **4 έτοιμα EJS components** που μπορείς να χρησιμοποιήσεις σε **οποιαδήποτε Node.js/Express εφαρμογή** με EJS templating.

---

## 🎯 Components Included

1. **data-table.ejs** - Dynamic data table with sorting and styling
2. **stats-card.ejs** - Statistics card with icons
3. **loading-button.ejs** - Button with automatic loading state
4. **file-upload-form.ejs** - Complete file upload form with validation

---

## 📥 Installation Methods

### **Method 1: Copy-Paste (Απλό και γρήγορο)**

#### Βήμα 1: Copy τον φάκελο
```bash
# Από το παλιό project
cd /path/to/old-project/reusable-ejs-components

# Copy σε νέο project
cp -r * /path/to/new-project/views/partials/components/
```

#### Βήμα 2: Βεβαίωση structure
Το νέο project πρέπει να έχει:
```
new-project/
├── views/
│   ├── partials/
│   │   ├── components/         ← Copy τα components εδώ
│   │   │   ├── data-table.ejs
│   │   │   ├── stats-card.ejs
│   │   │   ├── loading-button.ejs
│   │   │   ├── file-upload-form.ejs
│   │   │   └── README.md
```

#### Βήμα 3: Χρήση στα templates
```html
<!-- Σε οποιοδήποτε .ejs file -->
<%- include('partials/components/data-table', {
    data: myData,
    title: 'My Table'
}) %>
```

---

### **Method 2: Git Submodule (Για advanced χρήση)**

#### Αν θέλεις να sync τα components σε πολλά projects:

```bash
cd /path/to/new-project

# Add ως submodule
git submodule add https://github.com/YourUsername/reusable-ejs-components.git views/partials/components

# Update όταν αλλάζουν
git submodule update --remote
```

---

### **Method 3: NPM Package (Best για production)**

#### Δημιουργία NPM Package:

1. **Στο reusable-ejs-components folder:**
```bash
npm init -y
```

2. **Edit το package.json:**
```json
{
  "name": "@yourusername/ejs-components",
  "version": "1.0.0",
  "description": "Reusable EJS components for Express apps",
  "main": "index.js",
  "files": [
    "*.ejs",
    "README.md"
  ],
  "keywords": ["ejs", "components", "express", "templates"],
  "author": "Your Name",
  "license": "MIT"
}
```

3. **Publish (αν θες):**
```bash
npm login
npm publish --access public
```

4. **Installation σε νέο project:**
```bash
npm install @yourusername/ejs-components

# Copy στο views folder
cp -r node_modules/@yourusername/ejs-components/*.ejs views/partials/components/
```

---

## 🚀 Quick Start - Νέο Project

### 1. **Setup νέου Express app:**
```bash
mkdir my-new-app && cd my-new-app
npm init -y
npm install express ejs
```

### 2. **Copy τα components:**
```bash
mkdir -p views/partials/components
cp /path/to/opproducts-js/reusable-ejs-components/*.ejs views/partials/components/
```

### 3. **Basic Express setup:**
```javascript
// app.js
const express = require('express');
const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.render('index', {
        users: [
            ['John', 'Doe', 'john@example.com'],
            ['Jane', 'Smith', 'jane@example.com']
        ]
    });
});

app.listen(3000, () => console.log('Server running on port 3000'));
```

### 4. **Create index.ejs:**
```html
<!-- views/index.ejs -->
<!DOCTYPE html>
<html>
<head>
    <title>My New App</title>
    <style>
        /* Copy styles από το opproducts-js/public/style.css */
    </style>
</head>
<body>
    <h1>Welcome to My App</h1>
    
    <%- include('partials/components/data-table', {
        data: users,
        title: 'Users List',
        showRowNumbers: true
    }) %>
    
    <%- include('partials/components/stats-card', {
        icon: '👥',
        label: 'Total Users',
        value: users.length,
        color: '#007bff'
    }) %>
</body>
</html>
```

---

## 📋 Dependencies

Τα components χρειάζονται **μόνο**:
- ✅ `express` (για το server)
- ✅ `ejs` (για το templating)

**Δεν χρειάζονται** extra libraries! Τα components είναι **zero-dependency**.

---

## 🎨 Styling

### Copy το CSS:
Τα components χρησιμοποιούν τις εξής classes που πρέπει να έχεις στο CSS:

```css
/* Copy από opproducts-js/public/style.css */

/* Button styles */
.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.btn:disabled {
    opacity: 0.6;
    cursor: not-allowed;
}

/* Table styles */
.table-container {
    overflow-x: auto;
    border-radius: 8px;
}

.data-table {
    width: 100%;
    border-collapse: collapse;
}

.table-header {
    background-color: #2c3e50;
    color: white;
    position: sticky;
    top: 0;
}

.table-row-even {
    background-color: #f8f9fa;
}

.table-row-odd {
    background-color: white;
}

/* Card styles */
.stat-card {
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
```

---

## 🔧 Customization

### Αλλαγή component paths:

Αν τα components βρίσκονται σε διαφορετικό path:

```javascript
// Αντί για: partials/components/data-table
// Χρησιμοποίησε: shared/ui/data-table

<%- include('shared/ui/data-table', { data: myData }) %>
```

### Προσθήκη custom styles:

```html
<style>
    /* Override default styles */
    .data-table {
        border: 2px solid #333;
    }
    
    .btn {
        background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
    }
</style>
```

---

## 📚 Full Documentation

Διάβασε το **README.md** για:
- Πλήρη λίστα props για κάθε component
- Usage examples
- Best practices
- Advanced patterns

---

## 🐛 Troubleshooting

### ❌ Error: "Cannot find module 'partials/components/...'"
**Solution:** Βεβαίωσε ότι το path είναι σωστό από το `views/` folder.

### ❌ Components δεν εμφανίζονται σωστά
**Solution:** Copy το CSS από το `public/style.css` του opproducts-js.

### ❌ Loading button δεν δουλεύει
**Solution:** Το component χρησιμοποιεί inline JavaScript - no external dependencies needed.

---

## 📦 Version History

- **v1.0** (Oct 2025) - Initial release
  - data-table component
  - stats-card component
  - loading-button component
  - file-upload-form component

---

## 🤝 Contributing

Αν βελτιώσεις κάποιο component:
1. Update το αρχείο `.ejs`
2. Update το README.md με τις αλλαγές
3. Commit & push στο Git repo
4. Copy στα άλλα projects σου

---

## 📄 License

MIT - Free to use in any project!

---

## 💡 Pro Tips

### 1. **Create a components registry:**
```javascript
// components-registry.js
module.exports = {
    dataTable: 'partials/components/data-table',
    statsCard: 'partials/components/stats-card',
    loadingButton: 'partials/components/loading-button',
    fileUploadForm: 'partials/components/file-upload-form'
};

// Usage in routes:
const components = require('./components-registry');
res.render('page', { components });

// In EJS:
<%- include(components.dataTable, { data: myData }) %>
```

### 2. **Environment-based components:**
```javascript
// Load different component versions based on env
const componentPath = process.env.NODE_ENV === 'production'
    ? 'partials/components-prod'
    : 'partials/components-dev';
```

### 3. **Component versioning:**
```
views/
├── partials/
│   ├── components-v1/
│   ├── components-v2/  ← Νέες εκδόσεις
│   └── components/     ← Symlink στην τρέχουσα έκδοση
```

---

## 🔗 Links

- Original Project: https://github.com/RiflemanSD/opproducts-js
- Documentation: See README.md in this folder
- Issues: [GitHub Issues](your-repo-url)

---

**Happy Coding!** 🚀
