# ScrollLess

ScrollLess adalah aplikasi digital wellbeing berbasis Flutter untuk membantu
pengguna Android mengurangi scrolling berlebihan. MVP memantau penggunaan
Instagram/TikTok, mengirim reminder, lalu mencatat penalty dan progress.

## Status

- Target MVP: Android 6.0 (API 23) atau lebih baru
- Flutter: 3.47.9 stable
- Dart: 3.13.7
- Application ID: `com.scrollless.app`
- State management: Riverpod
- Penyimpanan lokal: Hive CE

Folder `web/` dan `windows/` berasal dari scaffold Flutter, tetapi bukan target
MVP. Semua integrasi native harus tetap dijaga di balik pemeriksaan platform.

## Persiapan lingkungan

1. Pasang Flutter 3.47.9 stable dan tambahkan `flutter/bin` ke PATH.
2. Pasang Android Studio beserta Android SDK dan command-line tools.
3. Jalankan `flutter doctor -v` sampai Android toolchain berstatus hijau.
4. Clone repository, lalu jalankan:

```sh
flutter pub get
dart run build_runner build
flutter analyze
flutter test
flutter run
```

Pengguna harus mengaktifkan **Usage Access** melalui Android Settings. Izin ini
bukan runtime permission biasa. Pada Android 13+, aplikasi juga meminta izin
notifikasi.

## Menjalankan demo mode

Demo mode dipakai untuk presentasi tanpa menunggu limit sebenarnya:

```sh
flutter run --dart-define=DEMO_MODE=true
```

Konstanta demo tersedia di `lib/core/config/app_config.dart`. Jangan mencampur
data demo ke repository produksi.

## Struktur proyek

```text
lib/
├── app.dart
├── main.dart
├── core/
│   ├── bootstrap/       # inisialisasi Hive, notification, WorkManager
│   ├── config/
│   ├── constants/
│   ├── models/          # kontrak data lintas feature
│   ├── repositories/    # interface lintas feature
│   ├── services/
│   └── theme/
├── features/
│   ├── home/
│   ├── tracking/        # Developer 1
│   ├── reminder/        # Developer 2
│   └── punishment/      # Developer 3
└── shared/widgets/
```

Lihat [dokumen arsitektur](docs/architecture.md) sebelum mengubah model atau
interface di `core/`.

## Pembagian kerja

| Area | Owner utama | Cakupan |
| --- | --- | --- |
| Tracking | Developer 1 | Usage Access, usage stats, dashboard, limit |
| Reminder | Developer 2 | notification, background check, history |
| Punishment | Developer 3 | penalty, focus challenge, streak, progress |

Owner utama bukan pemilik eksklusif. Perubahan pada `core/`, bootstrap, model,
atau kontrak repository harus direview minimal satu anggota lain.

## Workflow Git

Branch `main` harus selalu dapat dianalisis dan dites. Gunakan branch pendek,
bukan satu branch developer selama empat minggu:

```text
feature/tracking-permission
feature/background-limit-check
feature/penalty-history
fix/notification-permission
```

Sebelum membuat Pull Request:

```sh
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
```

Detail aturan commit, review, dan file generated ada di
[CONTRIBUTING.md](CONTRIBUTING.md).

## Batasan teknis MVP

- `usage_stats` hanya digunakan di Android.
- WorkManager Android memiliki interval periodik minimum 15 menit dan tidak
  menjamin eksekusi tepat pada detik limit terlampaui.
- Reminder background harus idempotent agar satu pelanggaran tidak membuat
  notifikasi atau penalty ganda.
- Package TikTok dapat berbeda menurut distribusi/region; daftar awal berada di
  `tracked_apps.dart` dan harus divalidasi pada perangkat demo.

## Pemeriksaan CI

Setiap push ke `main` dan Pull Request menjalankan formatting, analyzer, test,
dan build APK debug melalui GitHub Actions.
