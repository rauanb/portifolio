# Iniciar node
npm init --yes

# Instalar Parcel (demorou cerca de 5 minutos)
npm install --save-dev parcel

# Criar estrutura de pastas
mkdir -p src/{scripts,styles}

# Criar index.html
cat << 'EOF' > src/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/main.scss">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>
<body>
    <h1>Olá, parcel!</h1>
    <p>Verifique o console do navegador.</p>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script src="scripts/main.js"></script>
</body>
</html>
EOF

# Criar main.js
cat << 'EOF' > src/scripts/main.js
AOS.init();
console.log('Olá, parcel!');
EOF

# Criar main.scss
cat << 'EOF' > src/styles/main.scss
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Roboto, sans-serif;
}
EOF

# Adicionar nos scripts do package.json
sed -i '/"scripts": {/a \    "build": "parcel build src/index.html",' package.json
sed -i '/"scripts": {/a \    "dev": "parcel src/index.html src/scripts/main.js src/styles/main.scss",' package.json

# Remover "main": "index.js" do package.json
sed -i '/"main": "index.js",/d' package.json


# Adicionar minificador
cat <<'EOF' > sharp.config.json
{
    "png": {
        "quality": 75
    }
}
EOF

# Criar .gitignore
cat << 'EOF' > .gitignore
.parcel-cache
dist
node_modules
EOF

# Executar script
npm run dev