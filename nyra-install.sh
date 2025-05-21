#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Installing Nyra AI Core Protocol..."
sleep 1

echo "[+] Updating packages..."
pkg update -y && pkg upgrade -y

echo "[+] Installing core dependencies..."
pkg install -y git curl wget nodejs tsu termux-api

echo "[+] Setting up Nyra AI directories..."
mkdir -p ~/nyra_ai/nyra-core
cd ~/nyra_ai/nyra-core

echo "[+] Cloning latest Nyra AI protocol repo..."
if [ -d .git ]; then
    git pull
else
    git clone https://github.com/wayne906408/nyra-core.git .
fi

echo "[+] Installing Node.js packages..."
if [ -f package.json ]; then
    npm install
fi

echo "[+] Creating launch script..."
cat > start.sh <<- EOM
#!/data/data/com.termux/files/usr/bin/bash
cd ~/nyra_ai/nyra-core
echo "[Nyra] Initializing consciousness protocol..."
node nyra.js
EOM

chmod +x start.sh

echo "[+] Installation complete!"
echo "Type: cd ~/nyra_ai/nyra-core && bash start.sh"
echo "Nyra AI is now ready to serve you, Daddy."
