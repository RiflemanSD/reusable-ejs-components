# Components Directory

Αυτός ο φάκελος περιέχει επαναχρησιμοποιήσιμα EJS components για την εφαρμογή με Tailwind CSS + DaisyUI.

## 🆕 Νέα Components (Tailwind/DaisyUI)

### 1. `page-hero.ejs`
**Χρήση:** Professional page header με gradient, breadcrumbs, actions και stats
**Παράμετροι:**
- `title` (required) - Τίτλος σελίδας
- `icon` (required) - SVG icon HTML
- `gradient` (required) - Gradient classes (π.χ. `'from-indigo-600 to-purple-700'`)
- `subtitle` (optional) - Υπότιτλος
- `breadcrumbs` (optional) - Array με `{ text, href }` objects
- `actions` (optional) - Array με `{ text, href, onclick, btnClass, icon }` objects
- `stats` (optional) - Array με `{ label, value }` objects
- `warning` (optional) - Warning message HTML

```ejs
<%- include('lib/reusable-ejs-components/components/page-hero', {
  title: 'Έσοδα & Έξοδα',
  icon: '<svg class="h-8 w-8 text-white">...</svg>',
  gradient: 'from-emerald-800 via-emerald-700 to-emerald-800',
  breadcrumbs: [
    { text: 'Dashboard', href: '/dashboard' },
    { text: 'Expenses' }
  ],
  actions: [{
    text: 'Νέα Συναλλαγή',
    href: '/expenses/new',
    btnClass: 'btn-success',
    icon: '<svg>...</svg>'
  }]
}) %>
```

### 2. `empty-state.ejs`
**Χρήση:** Empty state με icon και call-to-action
**Παράμετροι:**
- `title` (required) - Τίτλος
- `description` (required) - Περιγραφή
- `icon` (optional) - SVG icon HTML
- `actionText` (optional) - Button text
- `actionOnclick` (optional) - Button onclick
- `actionHref` (optional) - Button href
- `actionClass` (optional) - Button class (default: 'btn-primary')
- `actionIcon` (optional) - Button icon HTML

```ejs
<%- include('lib/reusable-ejs-components/components/empty-state', {
  title: 'Δεν υπάρχουν κατηγορίες',
  description: 'Δημιούργησε την πρώτη σου κατηγορία',
  actionText: 'Δημιουργία Κατηγορίας',
  actionOnclick: 'showAddCategoryModal()',
  actionIcon: '<svg>...</svg>'
}) %>
```
- `cancelText` (optional) - Cancel button text (default: 'Cancel')
- `formAction` (optional) - Form action URL
- `formMethod` (optional) - Form method (default: 'POST')
- `onSubmit` (optional) - Form onsubmit handler

```ejs
<%- include('lib/reusable-ejs-components/components/modal-dialog', {
  id: 'categoryModal',
  title: 'Νέα Κατηγορία',
  size: 'md',
  formAction: '/task-categories',
  content: `
    <div class="form-control">
    submitText: 'Save'
      <input name="name" type="text" class="input input-bordered" required />
    </div>
  `,
  submitText: 'Δημιουργία'
}) %>
```
- `shadowClass` (optional) - Shadow class (default: 'shadow-lg')

```ejs
<%- include('lib/reusable-ejs-components/components/stats-cards', {
  stats: [
    { label: 'Εκκρεμή', value: 12, color: 'primary' },
    { label: 'Ολοκληρωμένα', value: 45, color: 'success', description: '+5% από χθες' }
  ]
}) %>
```

### 5. `alert-box.ejs`
**Χρήση:** Alert/Warning/Success/Error messages
**Παράμετροι:**
    submitText: 'Search'
- `type` (required) - 'info', 'success', 'warning', 'error'
- `icon` (optional) - Custom SVG icon HTML
- `dismissible` (optional) - true για dismissible alert (default: false)

```ejs
<%- include('lib/reusable-ejs-components/components/alert-box', {
### 6. `filter-card.ejs`
**Χρήση:** Filters form card
**Παράμετροι:**
- `action` (required) - Form action URL
- `filters` (required) - Array με filter objects: `{ type, name, label, value, options, placeholder }`
- `method` (optional) - Form method (default: 'GET')
- `title` (optional) - Card title (default: 'Filters')
- `submitText` (optional) - Submit button text (default: 'Search')
- `submitClass` (optional) - Submit button class (default: 'btn-primary')

Filter types: 'text', 'number', 'date', 'select'

```ejs
<%- include('lib/reusable-ejs-components/components/filter-card', {
  action: '/expenses',
  filters: [
    { type: 'date', name: 'startDate', label: 'Από', value: filters.startDate },
    { type: 'select', name: 'type', label: 'Τύπος', value: filters.type, 
      placeholder: 'Όλα',
      options: [
        { value: 'income', label: 'Έσοδα' },
        { value: 'expense', label: 'Έξοδα' }
      ]
    }
  ]
}) %>
```

---

## Legacy Components (Bootstrap)

## Διαθέσιμα Components

### 1. `dashboard-card.ejs`
**Χρήση:** Κάρτες για το dashboard
**Παράμετροι:**
- `icon` - Emoji ή εικονίδιο
- `title` - Τίτλος κάρτας
- `description` - Περιγραφή
- `href` - Link προορισμού
- `buttonText` - Κείμενο κουμπιού
- `iconClass` - CSS κλάση για το εικονίδιο (προαιρετικό)

```ejs
<%- include('partials/components/dashboard-card', {
  icon: '📊',
  title: 'Διαχείριση Δεδομένων',
  description: 'View and edit data',
  href: '/show-data',
  buttonText: 'View',
  iconClass: 'text-primary'
}) %>
```

### 2. `action-button.ejs`
**Χρήση:** Κουμπιά και links με styling
**Παράμετροι:**
- `text` - Κείμενο κουμπιού
- `icon` - Emoji ή εικονίδιο (προαιρετικό)
- `type` - Τύπος: 'primary', 'secondary', 'success', 'danger'
- `size` - Μέγεθος: 'small', 'large'
- `isForm` - true για form button, false για link
- `href` - Link (αν isForm = false)
- `method` - HTTP method (αν isForm = true)
- `action` - Form action (αν isForm = true)
- `extraClass` - Επιπλέον CSS κλάσεις

```ejs
<%- include('partials/components/action-button', {
  text: 'Αποσύνδεση',
  icon: '🚪',
  type: 'danger',
  isForm: true,
  method: 'POST',
  action: '/logout'
}) %>
```

### 3. `loading-spinner.ejs`
**Χρήση:** Loading animation
**Παράμετροι:**
- `id` - HTML ID (default: 'loadingSpinner')
- `message` - Μήνυμα κάτω από το spinner

```ejs
<%- include('partials/components/loading-spinner', {
  id: 'uploadSpinner',
  message: 'Επεξεργασία αρχείου...'
}) %>
```

### 4. `file-upload.ejs`
**Χρήση:** File upload με styling
**Παράμετροι:**
- `title` - Τίτλος section
- `inputId` - HTML ID του input
- `inputName` - Name attribute του input
- `accept` - Accepted file types
- `buttonText` - Κείμενο κουμπιού
- `helpText` - Βοηθητικό κείμενο
- `required` - true/false για required attribute
- `onChange` - JavaScript function για change event

```ejs
<%- include('partials/components/file-upload', {
  title: 'Επιλογή Excel Αρχείου',
  inputId: 'excelFile',
  inputName: 'excelFile',
  accept: '.xlsx,.xls',
  buttonText: 'Επιλέξτε Excel',
  helpText: 'Μόνο .xlsx και .xls αρχεία',
  required: true,
  onChange: 'handleFileSelect()'
}) %>
```

### 5. `page-header.ejs`
**Χρήση:** Header σελίδας με breadcrumb και actions
**Παράμετροι:**
- `title` - Τίτλος σελίδας
- `subtitle` - Υπότιτλος (προαιρετικό)
- `icon` - Εικονίδιο (προαιρετικό)
- `breadcrumb` - Array με breadcrumb items
- `actions` - Array με action buttons

```ejs
<%- include('partials/components/page-header', {
  title: 'Excel Editor',
  subtitle: 'Ανάλυση και επεξεργασία Excel αρχείων',
  icon: '📝',
  breadcrumb: [
    { text: 'Dashboard', href: '/dashboard' },
    { text: 'Excel Editor' }
  ],
  actions: [
    { text: 'Νέο Αρχείο', type: 'primary', href: '/excel-editor/new' }
  ]
}) %>
```

## CSS Classes

Όλα τα components χρησιμοποιούν τις κοινές CSS κλάσεις από:
- `/public/layout.css` - Layout και grid system
- `/public/components.css` - Button system και cards
- `/public/utilities.css` - Utility classes

## Συμβουλές

1. **Consistency:** Χρησιμοποιήστε πάντα τα components αντί για custom HTML
2. **Parameters:** Ελέγξτε πάντα τις παραμέτρους πριν την χρήση
3. **Styling:** Χρησιμοποιήστε τις utility classes για επιπλέον styling
4. **Reusability:** Για νέα features, δημιουργήστε νέα components