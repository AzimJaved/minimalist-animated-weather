import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.ScrollablePage {
    id: configRoot
    title: i18n("General")

    // --- ABSORPTION DES VALEURS PAR DÉFAUT (Pour nettoyer les logs) ---
    property var cfg_useCoordinatesIpDefault
    property var cfg_latitudeCDefault
    property var cfg_longitudeCDefault
    property var cfg_showConditionOnPanelDefault
    property var cfg_showConditionFullDefault
    property var cfg_reverseOrderDefault
    property var cfg_temperatureUnitDefault
    property var cfg_sizeFontTempDefault
    property var cfg_sizeFontCondDefault
    property var cfg_textweatherDefault
    property var cfg_preciseTempDefault
    property var cfg_preciseTempChartDefault
    property var cfg_updateIntervalDefault
    property var cfg_forecastStartDayDefault
    property var cfg_boldTempPanelDefault
    property var cfg_boldCondPanelDefault
    property var cfg_showApparentTempDefault
    property var cfg_showHumidityDefault
    property var cfg_showUVIndexDefault
    property var cfg_showWindDefault
    property var cfg_showAnimationsDefault
    property var cfg_refreshTriggerDefault
    property var cfg_borderRadiusDefault
    property var cfg_backgroundOpacityDefault
    property var cfg_enableYAxisReadingDefault
    property var cfg_showCursorDecimalsDefault

    // --- ALIAS DE CONFIGURATION ---
    property alias cfg_borderRadius: borderRadiusSpin.value
    property alias cfg_backgroundOpacity: backgroundOpacitySpin.realValue

    property alias cfg_showAnimations: showAnimationsCheck.checked
    property alias cfg_showConditionFull: conditionFullCheck.checked
    property alias cfg_useCoordinatesIp: autoCoorde.checked
    property alias cfg_latitudeC: latitudeField.text
    property alias cfg_longitudeC: longitudeField.text
    property alias cfg_temperatureUnit: temperatureCombo.currentIndex
    property alias cfg_updateInterval: intervalSpin.value
    property alias cfg_textweather: textWeatherCheck.checked
    property alias cfg_showConditionOnPanel: conditionOnPanelCheck.checked

    property alias cfg_preciseTemp: preciseTempCheck.checked
    property alias cfg_preciseTempChart: preciseTempChartCheck.checked

    property alias cfg_reverseOrder: reverseCheck.checked
    property alias cfg_sizeFontTemp: fontSizeTempSpin.realValue
    property alias cfg_boldTempPanel: boldTempCheck.checked
    property alias cfg_sizeFontCond: fontSizeCondSpin.realValue
    property alias cfg_boldCondPanel: boldCondCheck.checked
    property alias cfg_forecastStartDay: startDaySpin.value
    property alias cfg_showApparentTemp: apparentCheck.checked
    property alias cfg_showHumidity: humidityCheck.checked
    property alias cfg_showUVIndex: uvCheck.checked
    property alias cfg_showWind: windCheck.checked
    property alias cfg_enableYAxisReading: yAxisReadingCheck.checked
    property alias cfg_showCursorDecimals: showCursorDecimalsCheck.checked

    // Alias obligatoire pour le déclencheur de rafraîchissement
    property alias cfg_refreshTrigger: refreshTriggerHidden.value

    // --- RÉINITIALISATION AUX VALEURS PAR DÉFAUT ---
    // Les propriétés "cfg_xxxDefault" ci-dessus sont automatiquement
    // remplies par le framework KCM avec les valeurs par défaut définies
    // dans main.xml. Comme "cfg_xxx" est un alias vers le contrôle réel
    // (checked, value, realValue...), une simple affectation suffit à
    // restaurer chaque contrôle ET à marquer le formulaire comme modifié
    // (donc à dégriser le bouton Apply).
    function resetToDefaults() {
        cfg_useCoordinatesIp     = cfg_useCoordinatesIpDefault;
        cfg_latitudeC            = cfg_latitudeCDefault;
        cfg_longitudeC           = cfg_longitudeCDefault;
        cfg_showConditionOnPanel = cfg_showConditionOnPanelDefault;
        cfg_showConditionFull    = cfg_showConditionFullDefault;
        cfg_reverseOrder         = cfg_reverseOrderDefault;
        cfg_temperatureUnit      = cfg_temperatureUnitDefault;
        cfg_sizeFontTemp         = cfg_sizeFontTempDefault;
        cfg_sizeFontCond         = cfg_sizeFontCondDefault;
        cfg_textweather          = cfg_textweatherDefault;
        cfg_preciseTemp          = cfg_preciseTempDefault;
        cfg_preciseTempChart     = cfg_preciseTempChartDefault;
        cfg_updateInterval       = cfg_updateIntervalDefault;
        cfg_forecastStartDay     = cfg_forecastStartDayDefault;
        cfg_boldTempPanel        = cfg_boldTempPanelDefault;
        cfg_boldCondPanel        = cfg_boldCondPanelDefault;
        cfg_showApparentTemp     = cfg_showApparentTempDefault;
        cfg_showHumidity         = cfg_showHumidityDefault;
        cfg_showUVIndex          = cfg_showUVIndexDefault;
        cfg_showWind             = cfg_showWindDefault;
        cfg_showAnimations       = cfg_showAnimationsDefault;
        cfg_borderRadius         = cfg_borderRadiusDefault;
        cfg_backgroundOpacity    = cfg_backgroundOpacityDefault;
        cfg_enableYAxisReading   = cfg_enableYAxisReadingDefault;
        cfg_showCursorDecimals   = cfg_showCursorDecimalsDefault;
        // cfg_refreshTrigger n'est pas un vrai réglage (juste un
        // déclencheur de rafraîchissement) : on le laisse intact.
    }

    Dialog {
        id: confirmResetDialog
        title: i18n("Restore default settings?")
        modal: true
        standardButtons: Dialog.Yes | Dialog.Cancel
        anchors.centerIn: Overlay.overlay
        onAccepted: configRoot.resetToDefaults()

        Label {
            wrapMode: Text.WordWrap
            text: i18n("All settings on this page will be reset to their defaults. This cannot be undone.")
        }
    }

    Kirigami.FormLayout {

        SpinBox {
            id: refreshTriggerHidden
            visible: false
        }

        // ============================================================
        // LOCALISATION
        // ============================================================
        Label {
            Kirigami.FormData.isSection: true
            text: i18n("Location")
            font.bold: true
        }

        CheckBox {
            id: autoCoorde
            Kirigami.FormData.label: i18n("Automatic location (IP):")
        }
        RowLayout {
            Kirigami.FormData.label: i18n("Coordinates:")
            visible: !autoCoorde.checked
            spacing: Kirigami.Units.smallSpacing
            TextField {
                id: latitudeField
                placeholderText: i18n("Latitude")
                Layout.preferredWidth: Kirigami.Units.gridUnit * 6
            }
            TextField {
                id: longitudeField
                placeholderText: i18n("Longitude")
                Layout.preferredWidth: Kirigami.Units.gridUnit * 6
            }
        }

        // ============================================================
        // UNITÉS & MISE À JOUR
        // ============================================================
        Label {
            Kirigami.FormData.isSection: true
            text: i18n("Units & updates")
            font.bold: true
        }

        ComboBox {
            id: temperatureCombo
            Kirigami.FormData.label: i18n("Units:")
            model: [i18n("(°C) / (km/h)"), i18n("(°F) / (mph)")]
        }
        RowLayout {
            Kirigami.FormData.label: i18n("Update interval:")
            spacing: Kirigami.Units.smallSpacing
            SpinBox {
                id: intervalSpin
                from: 5; to: 360; stepSize: 5
                textFromValue: (value, locale) => value + " min"
                valueFromText: (text, locale) => parseInt(text)
            }
            Button {
                icon.name: "view-refresh"
                text: i18n("Refresh now")
                onClicked: refreshTriggerHidden.value++
            }
        }

        // ============================================================
        // STYLE (Anciennement Display)
        // ============================================================
        Label {
            Kirigami.FormData.isSection: true
            text: i18n("Style")
            font.bold: true
        }

        // --- Panel ---
        Label {
            Kirigami.FormData.isSection: true
            text: i18n("Panel")
            font.bold: true
            opacity: 0.7
        }

        Flow {
            Kirigami.FormData.label: i18n("Show:")
            Kirigami.FormData.labelAlignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.maximumWidth: Kirigami.Units.gridUnit * 20
            spacing: Kirigami.Units.smallSpacing
            CheckBox { id: textWeatherCheck; text: i18n("Temperature") }
            CheckBox { id: conditionOnPanelCheck; text: i18n("Condition") }
            CheckBox { id: reverseCheck; text: i18n("Reverse order") }
        }

        RowLayout {
            Kirigami.FormData.label: i18n("Temperature font:")
            spacing: Kirigami.Units.smallSpacing
            SpinBox {
                id: fontSizeTempSpin
                property real realValue: 11.0
                value: Math.round(realValue * 10)
                onValueModified: realValue = value / 10
                editable: true
                from: 80; to: 300; stepSize: 5
                textFromValue: (value, locale) => Number(value / 10).toLocaleString(locale, 'f', 1)
                valueFromText: (text, locale) => Math.round(Number.fromLocaleString(locale, text) * 10)
            }
            CheckBox { id: boldTempCheck; text: i18n("Bold") }
        }

        RowLayout {
            Kirigami.FormData.label: i18n("Condition font:")
            spacing: Kirigami.Units.smallSpacing
            SpinBox {
                id: fontSizeCondSpin
                property real realValue: 10.0
                value: Math.round(realValue * 10)
                onValueModified: realValue = value / 10
                editable: true
                from: 50; to: 250; stepSize: 5
                textFromValue: (value, locale) => Number(value / 10).toLocaleString(locale, 'f', 1)
                valueFromText: (text, locale) => Math.round(Number.fromLocaleString(locale, text) * 10)
            }
            CheckBox { id: boldCondCheck; text: i18n("Bold") }
        }

        CheckBox {
            id: preciseTempCheck
            Kirigami.FormData.label: i18n("Decimals:")
        }

        // --- Full view ---
        Label {
            Kirigami.FormData.isSection: true
            text: i18n("Full view")
            font.bold: true
            opacity: 0.7
        }

        CheckBox {
            id: conditionFullCheck
            Kirigami.FormData.label: i18n("Condition:")
        }
        CheckBox {
            id: preciseTempChartCheck
            Kirigami.FormData.label: i18n("Chart decimals:")
        }
        CheckBox {
            id: showCursorDecimalsCheck
            Kirigami.FormData.label: i18n("Cursor decimals:")
        }
        Label {
            Layout.fillWidth: true
            Layout.maximumWidth: Kirigami.Units.gridUnit * 20
            wrapMode: Text.WordWrap
            opacity: 0.6
            font.pointSize: Kirigami.Theme.smallFont.pointSize
            text: i18n("Shows one decimal while hovering the chart.\nWithout it, the value only updates at whole numbers and can appear stuck as you move along.")
        }
        CheckBox {
            id: yAxisReadingCheck
            Kirigami.FormData.label: i18n("Y-axis reading:")
        }
        Label {
            Layout.fillWidth: true
            Layout.maximumWidth: Kirigami.Units.gridUnit * 20
            wrapMode: Text.WordWrap
            opacity: 0.6
            font.pointSize: Kirigami.Theme.smallFont.pointSize
            text: i18n("Hover the left edge of the chart to read a value off the Y axis instead of following the curve.")
        }
        CheckBox {
            id: showAnimationsCheck
            Kirigami.FormData.label: i18n("Weather animations:")
        }
        Flow {
            Kirigami.FormData.label: i18n("Details:")
            Kirigami.FormData.labelAlignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.maximumWidth: Kirigami.Units.gridUnit * 20
            spacing: Kirigami.Units.smallSpacing
            CheckBox { id: apparentCheck; text: i18n("Apparent temp.") }
            CheckBox { id: humidityCheck; text: i18n("Humidity") }
            CheckBox { id: uvCheck; text: i18n("UV index") }
            CheckBox { id: windCheck; text: i18n("Wind speed") }
        }

        RowLayout {
            Kirigami.FormData.label: i18n("Desktop widget:")
            spacing: Kirigami.Units.smallSpacing
            Label { text: i18n("Radius") }
            SpinBox {
                id: borderRadiusSpin
                from: 0; to: 40; stepSize: 1
            }
            Label { text: i18n("Opacity"); Layout.leftMargin: Kirigami.Units.largeSpacing }
            SpinBox {
                id: backgroundOpacitySpin
                property real realValue: 1.0
                editable: true
                from: 0; to: 100; stepSize: 5
                textFromValue: (value, locale) => value + " %"
                valueFromText: (text, locale) => Math.round(Number.fromLocaleString(locale, text.replace(/%/g, "").trim()))

                // "value" suit normalement "realValue", SAUF pendant que le
                // champ a le focus : sinon, dès qu'on tape un caractère, le
                // recalcul de "value" reformaterait le texte (ex: "7" ->
                // "70 %") sous les doigts de l'utilisateur, en plein milieu
                // de la saisie.
                Binding {
                    target: backgroundOpacitySpin
                    property: "value"
                    value: Math.round(backgroundOpacitySpin.realValue * 100)
                    when: !backgroundOpacitySpin.activeFocus
                    restoreMode: Binding.RestoreNone
                }

                // Couvre les boutons fléchés et la molette : "value" change
                // directement dans ces cas, donc on répercute aussitôt sur
                // realValue (et donc cfg_backgroundOpacity / le bouton Apply).
                onValueChanged: realValue = value / 100

                // Couvre la saisie clavier : la SpinBox de Qt ne "committe"
                // le texte tapé (donc ne met à jour "value") qu'à la perte de
                // focus. Pour que le bouton Apply se dégrise IMMÉDIATEMENT
                // pendant la frappe (sans avoir à cliquer ailleurs), on
                // écoute directement le champ de texte interne.
                Component.onCompleted: {
                    if (contentItem && contentItem.textChanged) {
                        contentItem.textChanged.connect(function() {
                            if (!backgroundOpacitySpin.activeFocus) return;
                            let parsed = backgroundOpacitySpin.valueFromText(
                                contentItem.text, backgroundOpacitySpin.locale);
                            if (!isNaN(parsed)) {
                                realValue = Math.max(0, Math.min(100, parsed)) / 100;
                            }
                        });
                    }
                }
            }
        }
        Label {
            Layout.fillWidth: true
            Layout.maximumWidth: Kirigami.Units.gridUnit * 20
            wrapMode: Text.WordWrap
            opacity: 0.6
            font.pointSize: Kirigami.Theme.smallFont.pointSize
            text: i18n("Only applies when the widget sits directly on the desktop, not in a panel popup.")
        }

        // ============================================================
        // PRÉVISIONS
        // ============================================================
        Label {
            Kirigami.FormData.isSection: true
            text: i18n("Forecast")
            font.bold: true
        }

        SpinBox {
            id: startDaySpin
            Kirigami.FormData.label: i18n("Start day offset:")
            from: 0; to: 4; stepSize: 1
        }

        // ============================================================
        // DATA
        // ============================================================
        Label {
            Kirigami.FormData.isSection: true
            text: i18n("Data")
            font.bold: true
        }

        Button {
            Kirigami.FormData.label: i18n("Settings:")
            icon.name: "document-revert"
            text: i18n("Restore default settings")
            onClicked: confirmResetDialog.open()
        }
    }
}
