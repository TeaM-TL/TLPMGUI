# TLPMGUI
## Graficzny program instalacyjny dla TeX Live 2007 pozwala na łatwe i sprawne zainstalowanie dystrybucji TeX Live naszego ulubionego systemu w różnych systemach operacyjnych.

![Instalacja](https://github.com/TeaM-TL/TLPMGUI/blob/master/tlpmgui_1.png)

![Zarządzanie instalacją](https://github.com/TeaM-TL/TLPMGUI/blob/master/tlpmgui_2.png)

![Pomoc](https://github.com/TeaM-TL/TLPMGUI/blob/master/tlpmgui_3.png)

## Repozytorium zawiera źródła TLPMGUI

## Wprowadzenie
Program instalacyjny dla TeX Live pozwala na łatwe i sprawne zainstalowanie naszego ulubionego systemu w różnych systemach operacyjnych. Od wiosny 2006 program instalacyjny jest wieloplatformowy. W przypadku pracy z interfejsem jesteśmy ograniczeni do systemów Windows (Win32), Linux (i386 i x86_64) i MacOS X/Darwin (i386 i powerpc).

## Krótka historia
TeX Live 2004 nie zawierał programu instalacyjnego dla systemu Windows. Kilka miesięcy po wydaniu TeX Live 2004 Paweł napisał instalator uruchamiany w wierszu poleceń – tlpm. Po kolejnych kilku miesiącach Tomek uzupełnił instalator o interfejs graficzny – tlpmgui. W efekcie, w miesiąc po BachoTeX-u'05 można było zainstalować TeX Live 2004 pod Windows z użyciem myszy. Sztuka nie na wszystkich komputerach się udawała, ale w większości wypadków instalacja przebiegała pomyślnie.
Dzięki Staszkowi, który koordynował nasze prace, wskazywał kierunki i wiele wyjaśniał co w TeX Live piszczy, instalator wraz ze znacznie poprawionym i uzupełnionym interfejsem został włączony do TeX Live 2005.
Instalator tlpmgui w TeX Live 2007 dostępny jest także dla Linuksa i MacOS X (Darwin).

## Instalator tlpm
tlpm (TeX Live Package Manager) to samodzielne konsolowe narzędzie, którego głównym przeznaczeniem jest przeszukiwanie pakietów dystrybucji TeX Live oraz znajdywanie zależności między nimi. tlpm potrafi także instalować pakiety, tj. kopiować/wypakowywać archiwa na dysk. Dlatego też, z braku bardziej przyjaznego użytkownikowi rozwiązania, stał się tymczasowym instalatorem dla TeX Live 2004. W TeX Live 2005 znalazł się już przyjazny interfejs instalacji i zarządzania pakietami – tlpmgui.

## Interfejs tlpmgui
Interfejs wykorzystuje właściwy instalator jako silnik instalujący TeX Live (program tlpm nie wykonuje żadnych czynności poinstalacyjnych, tym zajmuje się interfejs tlpmgui).
Przed instalacją w oknie programu należy wybrać jeden ze schematów instalacji (np. GUST, ConTeXt, Full i inne), można wybrać kolekcje pakietów i języków. Podczas instalacji są tworzone bazy ls-r, a w Windows także generowane formaty oraz tworzone i uzupełniane zmienne środowiska(TEXMFCNF, TEXMFTEMP, TLroot i PATH), tworzone skróty w menu Start, a także skojarzenie rozszerzenia dvi z programem dviout (w TL2004 i 2005 – windvi).
Przy uruchomieniu z DVD mamy możliwość zwykłej instalacji jak w przypadku płyty CD lub można dopisać tylko odpowiednie zmienne środowiskowe i korzystać z TeX Live z DVD bez instalacji.
Po zainstalowaniu TeX Live interfejs uruchamia się w trybie zarządzania instalacją TeX-a. Umożliwia dodawanie i usuwanie pakietów, odświeżanie baz ls-r, generowanie formatów czy edycję plików konfiguracyjnych, a także usunięcie TeX Live.

## Znane błędy
 * (r.1.76, Win98) nie są usuwane zmienne z AUTOEXEC.BAT przy odinstalowywaniu.
 * (r.1.76, Windows) istnienie GS nie jest sprawdzane w rejesterze.

Serdeczne podziękowania dla tłumaczy, pomysłodawców i licznych testerów.
