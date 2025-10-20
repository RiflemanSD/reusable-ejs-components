# 🎨 Reusable EJS Components

A professional component library for Express.js applications using EJS templating.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 📦 What's Included

4 production-ready EJS components:

- **📊 data-table** - Dynamic data tables with sticky headers
- **📈 stats-card** - Statistics cards with icons
- **⏳ loading-button** - Buttons with automatic loading states
- **📤 file-upload-form** - Complete file upload forms

---

## 🚀 Quick Start

### Installation

```bash
npm install @riflemansd/reusable-ejs-components
```

Or with Git Submodule:

```bash
git submodule add https://github.com/RiflemanSD/reusable-ejs-components.git lib/components
```

Or direct copy:

```bash
git clone https://github.com/RiflemanSD/reusable-ejs-components.git
cd reusable-ejs-components
./scripts/copy-to-project.sh /path/to/your/project
```

---

## 💡 Usage

```html
<!-- views/dashboard.ejs -->
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <!-- Stats Card -->
    <%- include('partials/components/stats-card', {
        icon: '📊',
        label: 'Total Users',
        value: '1,234',
        color: '#007bff'
    }) %>
    
    <!-- Data Table -->
    <%- include('partials/components/data-table', {
        data: [
            ['Name', 'Email', 'Role'],
            ['John Doe', 'john@example.com', 'Admin'],
            ['Jane Smith', 'jane@example.com', 'User']
        ],
        title: 'Users',
        showRowNumbers: true
    }) %>
</body>
</html>
```

---

## 📚 Documentation

- [Component Documentation](docs/README.md) - Props and usage for each component
- [Installation Guide](docs/INSTALLATION.md) - Multiple installation methods
- [Git Submodule Setup](docs/GIT_SUBMODULE.md) - Advanced setup for multiple projects
- [Quick Reference](docs/QUICK_REFERENCE.md) - Quick answers and workflows

---

## 🎯 Features

- ✅ **Zero Dependencies** - Pure EJS, no external libraries
- ✅ **Responsive Design** - Works on all screen sizes
- ✅ **Easy to Customize** - Simple CSS overrides
- ✅ **Production Ready** - Battle-tested in real applications
- ✅ **Well Documented** - Complete docs with examples
- ✅ **TypeScript Ready** - Works with Express + TypeScript

---

## 🛠️ Requirements

- Node.js >= 14
- Express.js >= 4.0
- EJS >= 3.0

---

## 📁 Structure

```
reusable-ejs-components/
├── components/          # EJS component files
│   ├── data-table.ejs
│   ├── stats-card.ejs
│   ├── loading-button.ejs
│   └── file-upload-form.ejs
├── docs/               # Documentation
├── scripts/            # Helper scripts
└── package.json
```

---

## 🌟 Examples

### Stats Card
```ejs
<%- include('partials/components/stats-card', {
    icon: '💰',
    label: 'Revenue',
    value: '$12,345',
    color: '#28a745',
    valueColor: '#155724'
}) %>
```

### Data Table
```ejs
<%- include('partials/components/data-table', {
    data: products,
    title: 'Product Inventory',
    maxHeight: '400px',
    showRowNumbers: true
}) %>
```

### Loading Button
```ejs
<%- include('partials/components/loading-button', {
    id: 'submitBtn',
    text: 'Submit',
    loadingText: 'Processing...',
    type: 'submit',
    cssClass: 'btn-primary'
}) %>
```

### File Upload Form
```ejs
<%- include('partials/components/file-upload-form', {
    action: '/upload',
    inputName: 'file',
    accept: '.csv,.xlsx',
    label: 'Upload Data File'
}) %>
```

---

## 🔧 Customization

All components use standard CSS classes that you can override:

```css
/* Custom styles */
.data-table {
    border: 2px solid #333;
}

.stat-card {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.btn {
    border-radius: 8px;
    font-weight: bold;
}
```

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

---

## 🔗 Links

- **GitHub**: https://github.com/RiflemanSD/reusable-ejs-components
- **Issues**: https://github.com/RiflemanSD/reusable-ejs-components/issues
- **npm**: https://www.npmjs.com/package/@riflemansd/reusable-ejs-components

---

## ⭐ Show Your Support

If you find this library useful, please give it a ⭐ on GitHub!

---

**Made with ❤️ by [RiflemanSD](https://github.com/RiflemanSD)**
