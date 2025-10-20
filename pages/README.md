# 📄 CSV Converter Page

A complete page component for CSV to Excel conversion with advanced features.

## 🎯 Features

- **📊 CSV Preview** - Full-width data table preview
- **🔍 Auto-detection** - Automatic delimiter and column type detection
- **⚙️ Manual Override** - Customize delimiter and column types
- **📈 Statistics** - Show rows, columns, filename, and delimiter info
- **💾 Excel Export** - Convert CSV to Excel with proper formatting

## 📦 Usage

### In Express Route:

```javascript
app.get('/csv-converter', requireAuth, (req, res) => {
  res.render('csv-converter');
});

app.post('/csv-converter/upload', requireAuth, upload.single('csvFile'), async (req, res) => {
  const csvContent = fs.readFileSync(req.file.path, 'utf8');
  const detectedDelimiter = detectDelimiter(csvContent);
  
  const workbook = xlsx.read(csvContent, { 
    type: 'string', 
    codepage: 65001,
    FS: detectedDelimiter 
  });
  
  const sheet = workbook.Sheets[workbook.SheetNames[0]];
  const previewData = xlsx.utils.sheet_to_json(sheet, { header: 1, defval: '' });
  const columnTypes = detectColumnTypes(previewData);
  
  res.render('csv-converter', {
    previewData,
    fileName: req.file.originalname,
    detectedDelimiter,
    columnTypes
  });
});
```

### Helper Functions Required:

```javascript
// Detect CSV delimiter
function detectDelimiter(csvContent) {
  const delimiters = [',', ';', '\t', '|'];
  const firstLine = csvContent.split('\n')[0];
  
  let maxCount = 0;
  let detectedDelimiter = ',';
  
  for (const delimiter of delimiters) {
    const count = (firstLine.match(new RegExp(`\\${delimiter}`, 'g')) || []).length;
    if (count > maxCount) {
      maxCount = count;
      detectedDelimiter = delimiter;
    }
  }
  
  return detectedDelimiter;
}

// Detect column data types
function detectColumnTypes(data) {
  if (!data || data.length < 2) return [];
  
  const headers = data[0];
  const columnTypes = [];
  
  for (let colIndex = 0; colIndex < headers.length; colIndex++) {
    let hasString = false;
    let hasInt = false;
    let hasFloat = false;
    let hasDate = false;
    let hasEmpty = false;
    
    const sampleSize = Math.min(100, data.length - 1);
    for (let rowIndex = 1; rowIndex <= sampleSize; rowIndex++) {
      const value = data[rowIndex]?.[colIndex];
      
      if (value === '' || value === null || value === undefined) {
        hasEmpty = true;
        continue;
      }
      
      const strValue = String(value).trim();
      
      if (/^\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}$/.test(strValue) || 
          /^\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}$/.test(strValue)) {
        hasDate = true;
        continue;
      }
      
      if (!isNaN(strValue) && strValue !== '') {
        if (strValue.includes('.') || strValue.includes(',')) {
          hasFloat = true;
        } else {
          hasInt = true;
        }
      } else {
        hasString = true;
      }
    }
    
    let type = 'string';
    if (hasDate && !hasString) type = 'date';
    else if (hasFloat) type = 'float';
    else if (hasInt && !hasFloat && !hasString) type = 'integer';
    
    columnTypes.push({
      name: headers[colIndex] || `Column ${colIndex + 1}`,
      detectedType: type,
      hasEmpty: hasEmpty
    });
  }
  
  return columnTypes;
}
```

## 📋 Props

### Optional Props (EJS variables):

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `previewData` | Array | undefined | 2D array of CSV data (rows x columns) |
| `fileName` | String | undefined | Original filename |
| `detectedDelimiter` | String | ',' | Auto-detected delimiter character |
| `columnTypes` | Array | [] | Array of column type objects |

### Column Types Object:

```javascript
{
  name: 'Column Name',      // Column header
  detectedType: 'string',   // 'string', 'integer', 'float', 'date'
  hasEmpty: false           // true if column contains empty cells
}
```

## 🎨 Features Breakdown

### 1. Full-Width Preview
- 98% screen width for maximum visibility
- Responsive table with horizontal scroll
- Sticky headers for easy navigation

### 2. Auto-Detection
- **Delimiter**: Analyzes first line to find most common separator
- **Types**: Scans up to 100 rows per column
- **Smart Priority**: Date > Float > Integer > String

### 3. Manual Controls
- Dropdown to override delimiter
- Per-column type selection
- Visual feedback for auto-detected values

### 4. Statistics Cards
- Total rows count
- Number of columns
- Filename display
- Detected delimiter indicator

### 5. Visual Indicators
- Color-coded type badges
- Empty cell warnings
- Helpful tooltips and hints

## 📦 Dependencies

### Required Components:
- `partials/components/file-upload-form.ejs`
- `partials/components/stats-card.ejs`
- `partials/components/data-table.ejs`

### Required Packages:
```json
{
  "express": "^4.18.0",
  "ejs": "^3.1.0",
  "xlsx": "^0.18.0",
  "multer": "^1.4.0"
}
```

## 🔧 Customization

### Change Preview Width:

```html
<!-- In csv-converter.ejs, find: -->
<div style="width: 98%; max-width: none; ...">
  
<!-- Change to: -->
<div style="width: 95%; max-width: 2000px; ...">
```

### Add More Delimiter Options:

```html
<select id="delimiter" name="delimiter">
  <option value=",">Comma (,)</option>
  <option value=";">Semicolon (;)</option>
  <option value="	">Tab</option>
  <option value="|">Pipe (|)</option>
  <option value=" ">Space</option>  <!-- Add this -->
</select>
```

### Custom Type Detection:

Modify `detectColumnTypes()` function to add more types:

```javascript
// Add boolean detection
if (strValue === 'true' || strValue === 'false' || 
    strValue === '0' || strValue === '1') {
  hasBoolean = true;
}
```

## 🎯 Best Practices

1. **Always** provide `previewData` after successful upload
2. **Include** delimiter detection for better UX
3. **Show** column types to help users verify data
4. **Allow** manual override for edge cases
5. **Handle** errors gracefully with error messages

## ⚠️ Requirements

- User authentication (requireAuth middleware)
- File upload middleware (multer)
- Session management
- Header/Footer partials

## 📸 Preview

The page includes:
- Upload form with drag-drop support
- Full-width preview table
- 4 statistics cards
- Delimiter selector
- Column type configuration table
- Excel conversion form

## 🔗 Related Components

- [file-upload-form.ejs](../components/file-upload-form.ejs)
- [data-table.ejs](../components/data-table.ejs)
- [stats-card.ejs](../components/stats-card.ejs)
- [loading-button.ejs](../components/loading-button.ejs)

---

**Full-featured CSV converter ready for production!** 🚀
