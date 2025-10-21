# Components Directory

Αυτός ο φάκελος περιέχει επαναχρησιμοποιήσιμα EJS components για την εφαρμογή.

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
  description: 'Προβολή και επεξεργασία δεδομένων',
  href: '/show-data',
  buttonText: 'Προβολή',
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