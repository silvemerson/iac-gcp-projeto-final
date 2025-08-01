ZONE=$(curl http://metadata.google.internal/computeMetadata/v1/instance/zone -H "Metadata-Flavor: Google")

sudo apt update

sudo apt install nginx -y 

sudo cat <<EOF > /var/www/html/index.html
    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
    <meta charset="UTF-8">
    <title>Bem-vindo</title>
    <style>
        body {
        background-color: #282c34;
        color: #61dafb;
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        }
        h1 {
        font-size: 2.5rem;
        text-shadow: 2px 2px #000;
        }
    </style>
    </head>
    <body>
    <h1>Bem-vindo ao curso Terraform 4Linux 🚀</h1>
    <h3>Você está na região: ${ZONE}</h3>
    </body>
    </html>
EOF