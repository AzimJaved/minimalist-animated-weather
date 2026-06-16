# Minimalist Weather Animated 🌦️

A highly customizable, animated, and minimalist weather widget for KDE Plasma 6, focused on data clarity and modern design.

This project is an enhanced version of the original [Minimal Chaac Weather](https://github.com/zayronxio/Chaac.Minimal.Weather).

## 📸 Showcase

|                   Compact View                  |                  Animated Weather                 |              Interactive Charts              |
| :---------------------------------------------: | :-----------------------------------------------: | :------------------------------------------: |
| <img src="URL_IMAGE_COMPACT.png" width="100%"/> | <img src="URL_IMAGE_ANIMATION.gif" width="100%"/> | <img src="URL_GIF_CHARTS.gif" width="100%"/> |

---

## ✨ Features

* **Animated Visuals**: Dynamic weather backgrounds (rain, snow, sun, storm, etc.) that adapt to the current conditions and your Plasma theme (light/dark mode).
* **Interactive Charts**: Swipeable daily forecast with detailed hourly charts (Temperature, Humidity, Wind, UV Index). Features smooth gradients, precise hover data, and adaptive styling.
* **Minimalist UI**: Clean, airy design inspired by the Plasma 6 aesthetic.
* **Advanced Customization**:

  * **Visual Control**: Toggle between different visual styles.
  * **Unit System**: Easily switch between Metric (°C, km/h) and Imperial (°F, mph) units.
  * **Text Styling**: Fully configurable bold text for temperatures and weather conditions, font sizing, and more.
  * **Data Precision**: Toggle decimal display independently for the panel and the interactive charts.
  * **Timing**: Set your preferred weather update interval.
  * **...and much more!**
* **i18n Support**: Multilingual support available out of the box.

---

## 🛠️ Installation

### Option 1: KDE Interface (Recommended)

1. Right-click your desktop and select **Add Widgets**.
2. Click **Get New Widgets** → **Download New Plasma Widgets**.
3. Search for **Minimalist Weather Animated** and click **Install**.

### Option 2: Local Installation (Manual)

1. Download the `.plasmoid` file from the [Releases](https://github.com/samy879/minimalist-weather-animated/releases/latest) page.
2. Open a terminal and run:

```bash
kpackagetool6 --type Plasma/Applet --install modern-weather-enhanced.plasmoid
```

3. Alternatively, open the **Add Widgets** menu, click the menu button, and select **Install from Local File...**.

---

## 🌍 Localization & Translation

We are committed to making this widget accessible to everyone.
### Supported Languages
* 🇺🇸 English (Base Language)
* 🇪🇸 Spanish (`es`)
* 🇫🇷 French (`fr`)
* 🇯🇵 Japanese (`ja`)
* 🇳🇱 Dutch (`nl`)
* 🇵🇹 Portuguese (`pt`)
* 🇷🇺 Russian (`ru`) — Translated by [Lintech-1](https://github.com/Lintech-1)
* 🇹🇷 Turkish (`tr`)
* 🇻🇳 Vietnamese (`vi`)
* 🇨🇳 Chinese Simplified (`zh_CN`)

### Contribute

Contributions of all kinds are welcome and greatly appreciated! ❤️

Have an idea to improve the widget?

Whether it's:

* 🌍 New translations or localization improvements
* 🎨 UI/UX or aesthetic improvements
* ✨ New features and functionality
* ⚡ Performance optimizations
* 🐛 Bug fixes
* 🔧 Code refactoring and maintenance
* 📚 Documentation improvements

Feel free to open an Issue, submit a Pull Request, or suggest enhancements. Every contribution, big or small, helps make **Minimalist Weather Animated** even better for everyone.

For translations, check the `translate/` folder and create a new `.po` file based on `template.pot`.

---

## 🌟 Support the Project

Feedback and feature requests are always welcome!

If you find this widget useful, please consider:

* ⭐ Starring the repository on GitHub.
* 🛍️ Leaving a rating on the KDE Store: https://store.kde.org/p/2356087

Your support helps keep the project alive and motivates future improvements.

---

## 🤝 Credits

### Original Project

* **Original Creator**: [zayronxio](https://github.com/zayronxio) — Creator of Chaac Minimal Weather.

### Contributors

* [Nicolas-Gth](https://github.com/Nicolas-Gth) — Essential bug fixes and improvements.
* [Lintech-1](https://github.com/Lintech-1) — Russian localization.

### Current Maintainer

* [Samy879](https://github.com/Samy879) — Enhanced development, maintenance, new features, animations, charts, and customization options.

---

## 📄 License

This project is licensed under the GPL-3.0 License.
