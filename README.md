# 🎨 Reusable EJS Components

A professional component library for Express.js applications using EJS templating.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 📦 What's Included

13 production-ready EJS components organized by category:

### 🎴 Cards
- **dashboard-card** - Versatile dashboard cards with badges and actions
- **stats-card** - Statistics cards with icons and values
- **stats-cards** - Multiple stats cards in a grid layout

### 📝 Forms
- **filter-card** - Collapsible filter forms with search functionality
- **file-upload-form** - Complete file upload forms with validation

### 💬 Feedback
- **alert-box** - Alert messages with different severity levels
- **empty-state** - Placeholder for empty data states

### 📐 Layout
- **page-hero** - Page header with title, description, and actions

### 🎛️ UI Components
- **action-button** - Buttons with icons and various styles
- **modal-dialog** - Modal dialogs with customizable content
- **data-table** - Dynamic data tables with sticky headers

### ⚙️ Legacy Components (Bootstrap)
- **loading-button** - Buttons with automatic loading states
- **file-upload** - Basic file upload component

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
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.4.19/dist/full.min.css" rel="stylesheet">
</head>
<body>
    <!-- Dashboard Card -->
    <%- include('partials/components/cards/dashboard-card', {
        title: 'Statistics',
        description: 'View system statistics',
        icon: 'M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z',
        link: '/dashboard/stats',
        btnText: 'View Details',
        showBadge: true,
        badgeLabel: 'NEW'
    }) %>
    
    <!-- Stats Cards -->
    <%- include('partials/components/cards/stats-cards', {
        stats: [
            { icon: '👥', label: 'Total Users', value: '1,234', bgColor: 'bg-blue-50', iconColor: 'text-blue-600' },
            { icon: '📊', label: 'Revenue', value: '$12,345', bgColor: 'bg-green-50', iconColor: 'text-green-600' }
        ]
    }) %>
    
    <!-- Data Table -->
    <%- include('partials/components/ui/data-table', {
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

- ✅ **Modern Stack** - Built with Tailwind CSS + DaisyUI
- ✅ **Zero Dependencies** - Pure EJS, no JavaScript frameworks
- ✅ **Organized Structure** - Components categorized by function
- ✅ **Responsive Design** - Mobile-first approach
- ✅ **Dark Mode Ready** - Full DaisyUI theme support
- ✅ **Accessible** - ARIA labels and semantic HTML
- ✅ **Neutralized Defaults** - No hardcoded language strings
- ✅ **Production Ready** - Battle-tested in real applications
- ✅ **Well Documented** - Complete docs with examples
- ✅ **TypeScript Ready** - Works with Express + TypeScript

---

## 🛠️ Requirements

- Node.js >= 14
- Express.js >= 4.0
- EJS >= 3.0
- Tailwind CSS >= 3.0
- DaisyUI >= 4.0 (recommended)

---

## 📁 Structure

```
reusable-ejs-components/
├── components/              # EJS component files
│   ├── cards/              # Card components
│   │   ├── dashboard-card.ejs
│   │   ├── stats-card.ejs
│   │   └── stats-cards.ejs
│   ├── forms/              # Form components
│   │   ├── filter-card.ejs
│   │   └── file-upload-form.ejs
│   ├── feedback/           # Feedback components
│   │   ├── alert-box.ejs
│   │   └── empty-state.ejs
│   ├── layout/             # Layout components
│   │   └── page-hero.ejs
│   ├── ui/                 # UI components
│   │   ├── action-button.ejs
│   │   ├── modal-dialog.ejs
│   │   └── data-table.ejs
│   └── (legacy)            # Legacy Bootstrap components
│       ├── alert.ejs
│       ├── file-upload.ejs
│       ├── loading-button.ejs
│       ├── loading-spinner.ejs
│       └── page-header.ejs
├── docs/                   # Documentation
├── scripts/                # Helper scripts
└── package.json
```

---

## 🌟 Examples

### Dashboard Card
```ejs
<%- include('partials/components/cards/dashboard-card', {
    title: 'Tasks',
    description: 'Manage your tasks',
    icon: 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2',
    link: '/tasks',
    btnText: 'View Tasks',
    showBadge: true,
    badgeLabel: 'Updated'
}) %>
```

### Stats Card
```ejs
<%- include('partials/components/cards/stats-card', {
    icon: '💰',
    label: 'Revenue',
    value: '$12,345',
    bgColor: 'bg-green-50',
    iconColor: 'text-green-600'
}) %>
```

### Filter Card
```ejs
<%- include('partials/components/forms/filter-card', {
    title: 'Search Filters',
    action: '/search',
    method: 'GET',
    submitText: 'Apply Filters',
    isOpen: true
}) %>
<div slot="filters">
    <input type="text" name="q" placeholder="Search..." class="input input-bordered w-full">
</div>
<%- include('partials/components/forms/filter-card-end') %>
```

### Modal Dialog
```ejs
<%- include('partials/components/ui/modal-dialog', {
    id: 'confirmModal',
    title: 'Confirm Action',
    submitText: 'Confirm',
    cancelText: 'Cancel',
    onSubmit: 'handleConfirm()'
}) %>
<div slot="content">
    <p>Are you sure you want to proceed?</p>
</div>
<%- include('partials/components/ui/modal-dialog-end') %>
```

### Data Table
```ejs
<%- include('partials/components/ui/data-table', {
    data: products,
    title: 'Product Inventory',
    maxHeight: '400px',
    showRowNumbers: true
}) %>
```

### Action Button
```ejs
<%- include('partials/components/ui/action-button', {
    text: 'Add New',
    icon: 'M12 4v16m8-8H4',
    href: '/add',
    variant: 'primary',
    size: 'md'
}) %>
```

### Page Hero
```ejs
<%- include('partials/components/layout/page-hero', {
    title: 'Dashboard',
    description: 'Welcome to your dashboard',
    icon: 'M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6'
}) %>
```

### Alert Box
```ejs
<%- include('partials/components/feedback/alert-box', {
    type: 'success',
    message: 'Operation completed successfully!'
}) %>
```

### Empty State
```ejs
<%- include('partials/components/feedback/empty-state', {
    icon: '📋',
    title: 'No tasks found',
    message: 'Get started by creating your first task',
    actionText: 'Create Task',
    actionUrl: '/tasks/new'
}) %>
```

---

## 🔧 Customization

All components use Tailwind CSS and DaisyUI classes. You can customize them using:

### Tailwind Configuration
```js
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        primary: '#your-color',
      }
    }
  },
  plugins: [require('daisyui')],
  daisyui: {
    themes: ['light', 'dark', 'cupcake']
  }
}
```

### Custom CSS Overrides
```css
/* Custom styles */
.card {
    @apply shadow-xl;
}

.btn-primary {
    @apply bg-gradient-to-r from-blue-500 to-purple-600;
}
```

### Component Props
Most components accept customization props:
- `bgColor` - Background color classes (e.g., 'bg-blue-50')
- `textColor` - Text color classes (e.g., 'text-gray-700')
- `iconColor` - Icon color classes (e.g., 'text-blue-600')
- `variant` - Button/component variants ('primary', 'secondary', etc.)
- `size` - Size variants ('sm', 'md', 'lg')

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
