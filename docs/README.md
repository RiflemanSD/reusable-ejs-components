# 📦 Reusable EJS Components Library

Αυτή η βιβλιοθήκη περιέχει reusable components για την εφαρμογή σας.

## 📁 Δομή

```
views/partials/components/
├── data-table.ejs          # Πίνακας δεδομένων με scrolling
├── stats-card.ejs          # Card για εμφάνιση statistics
├── loading-button.ejs      # Button με loading state
└── file-upload-form.ejs    # Form για file upload
```

---

## 🎨 Components Documentation

### 1. 📊 Data Table (`data-table.ejs`)

Εμφανίζει δεδομένα σε πίνακα με sticky header, scrolling και alternating row colors.

**Props:**
- `data` (required): Array of arrays - Τα δεδομένα του πίνακα
- `title` (optional): String - Τίτλος πίνακα
- `maxHeight` (optional): String - Μέγιστο ύψος (default: "600px")
- `showRowNumbers` (optional): Boolean - Εμφάνιση αριθμών γραμμών (default: false)

**Χρήση:**
```ejs
<%- include('partials/components/data-table', { 
  data: myData, 
  title: 'My Table',
  maxHeight: '500px',
  showRowNumbers: true
}) %>
```

---

### 2. 📈 Stats Card (`stats-card.ejs`)

Card για εμφάνιση στατιστικών με icon και μεγάλη τιμή.

**Props:**
- `label` (required): String - Περιγραφή
- `value` (required): String/Number - Τιμή
- `icon` (optional): String - Emoji ή icon
- `color` (optional): String - Background color (default: "white")
- `valueColor` (optional): String - Χρώμα τιμής (default: "#2c3e50")

**Χρήση:**
```ejs
<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px;">
  <%- include('partials/components/stats-card', { 
    icon: '📊', 
    label: 'Total Records', 
    value: 1250,
    color: '#f0f9ff',
    valueColor: '#0284c7'
  }) %>
  
  <%- include('partials/components/stats-card', { 
    icon: '✅', 
    label: 'Completed', 
    value: 800
  }) %>
</div>
```

---

### 3. 🔘 Loading Button (`loading-button.ejs`)

Button με αυτόματο loading state όταν submit σε form.

**Props:**
- `id` (required): String - Unique ID για το button
- `text` (required): String - Κείμενο button
- `loadingText` (optional): String - Κείμενο κατά τη φόρτωση (default: "Φόρτωση...")
- `type` (optional): String - Button type (default: "submit")
- `cssClass` (optional): String - CSS classes (default: "btn btn-primary")
- `icon` (optional): String - Icon πριν το κείμενο
- `loadingIcon` (optional): String - Icon κατά τη φόρτωση (default: "⏳")

**Χρήση:**
```ejs
<form method="POST" action="/submit">
  <!-- form fields -->
  
  <%- include('partials/components/loading-button', { 
    id: 'submitBtn', 
    text: 'Submit Form',
    loadingText: 'Submitting...',
    icon: '📤',
    cssClass: 'btn btn-success'
  }) %>
</form>
```

**Manual Control:**
```javascript
// Ενεργοποίηση loading state
toggleLoadingButton('submitBtn', true);

// Απενεργοποίηση loading state
toggleLoadingButton('submitBtn', false);
```

---

### 4. 📤 File Upload Form (`file-upload-form.ejs`)

Ολοκληρωμένο form για file upload με loading button.

**Props:**
- `action` (required): String - Form action URL
- `inputName` (required): String - Name attribute για το file input
- `inputId` (optional): String - ID για το file input (default: inputName)
- `accept` (optional): String - Τύποι αρχείων (default: "*")
- `label` (optional): String - Label text (default: "Επιλέξτε αρχείο")
- `helpText` (optional): String - Help text κάτω από το input
- `buttonText` (optional): String - Κείμενο button (default: "Ανέβασμα")
- `buttonIcon` (optional): String - Icon για button
- `maxSize` (optional): String - Περιγραφή max size
- `formId` (optional): String - Form ID
- `method` (optional): String - Form method (default: "POST")

**Χρήση:**
```ejs
<%- include('partials/components/file-upload-form', { 
  formId: 'myForm',
  action: '/upload-csv',
  inputName: 'csvFile',
  accept: '.csv',
  label: 'Upload CSV File',
  buttonText: 'Preview CSV',
  buttonIcon: '👁️',
  maxSize: '10MB'
}) %>
```

---

## 💡 Best Practices

1. **Props Validation**: Πάντα check αν τα required props υπάρχουν
2. **Default Values**: Χρησιμοποίησε defaults για optional props
3. **Naming Convention**: Χρησιμοποίησε descriptive names για props
4. **Documentation**: Κράτα σχόλια στα components για documentation
5. **Reusability**: Κάνε τα components όσο πιο generic γίνεται

## 🔧 Πώς να δημιουργήσεις νέο Component

1. Δημιούργησε file στο `views/partials/components/`
2. Πρόσθεσε JSDoc-style σχόλια για documentation
3. Χρησιμοποίησε typeof checks για optional props
4. Test το component σε διαφορετικά contexts
5. Ενημέρωσε αυτό το README

## 📝 Παραδείγματα

Δες το `csv-converter.ejs` για παραδείγματα χρήσης όλων των components!

---

**Created:** 20 Οκτωβρίου 2025
**Maintainer:** Your Team
