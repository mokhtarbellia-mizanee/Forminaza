const { app, BrowserWindow, Menu } = require('electron');
const path = require('path');
function create() {
  Menu.setApplicationMenu(null);
  const w = new BrowserWindow({ width: 1200, height: 800, minWidth: 380, title: 'منصة إدارة الأعمال', autoHideMenuBar: true, icon: path.join(__dirname, 'www', 'icon-512.png') });
  w.loadFile(path.join(__dirname, 'www', 'index.html'));
}
app.whenReady().then(create);
app.on('window-all-closed', () => app.quit());
