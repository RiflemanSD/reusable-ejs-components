#!/bin/bash
# Quick copy script για νέο project

# Usage: ./copy-to-project.sh /path/to/new-project

if [ -z "$1" ]; then
    echo "❌ Error: Δώσε το path του νέου project"
    echo "Usage: ./copy-to-project.sh /path/to/new-project"
    exit 1
fi

PROJECT_PATH="$1"
COMPONENTS_PATH="$PROJECT_PATH/views/partials/components"

# Create directories
echo "📁 Creating directories..."
mkdir -p "$COMPONENTS_PATH"

# Copy components
echo "📦 Copying components..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

cp -v "$PARENT_DIR/components/"*.ejs "$COMPONENTS_PATH/"
cp -v "$PARENT_DIR/docs/README.md" "$COMPONENTS_PATH/"

# Create basic CSS file if doesn't exist
if [ ! -f "$PROJECT_PATH/public/style.css" ]; then
    echo "🎨 Creating basic CSS..."
    mkdir -p "$PROJECT_PATH/public"
    cat > "$PROJECT_PATH/public/style.css" << 'EOF'
/* Basic styles for EJS components */

.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    transition: all 0.3s;
}

.btn:disabled {
    opacity: 0.6;
    cursor: not-allowed;
}

.btn-primary {
    background: #007bff;
    color: white;
}

.btn-primary:hover:not(:disabled) {
    background: #0056b3;
}

.table-container {
    overflow-x: auto;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    margin: 20px 0;
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
    z-index: 10;
}

.table-header th {
    padding: 12px;
    text-align: left;
    font-weight: 600;
}

.data-table td {
    padding: 10px 12px;
    border-bottom: 1px solid #dee2e6;
}

.table-row-even {
    background-color: #f8f9fa;
}

.table-row-odd {
    background-color: white;
}

.data-table tr:hover {
    background-color: #e9ecef !important;
}

.stat-card {
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    background: white;
    margin: 10px;
}

.stat-icon {
    font-size: 2em;
    margin-bottom: 10px;
}

.stat-label {
    font-size: 0.9em;
    color: #6c757d;
}

.stat-value {
    font-size: 1.5em;
    font-weight: bold;
}

.upload-form {
    padding: 20px;
    border: 2px dashed #dee2e6;
    border-radius: 8px;
    background: #f8f9fa;
}

.form-group {
    margin-bottom: 15px;
}

.form-control {
    width: 100%;
    padding: 8px 12px;
    border: 1px solid #ced4da;
    border-radius: 4px;
}
EOF
fi

echo ""
echo "✅ Components copied successfully!"
echo ""
echo "📍 Components location: $COMPONENTS_PATH"
echo "🎨 CSS location: $PROJECT_PATH/public/style.css"
echo ""
echo "📖 Next steps:"
echo "   1. Include in your EJS files:"
echo "      <%- include('partials/components/data-table', { data: myData }) %>"
echo ""
echo "   2. Make sure your Express app has:"
echo "      app.set('view engine', 'ejs');"
echo "      app.use(express.static('public'));"
echo ""
echo "🚀 Happy coding!"
