# Contributing to ScrollLess

## Alur perubahan

1. Tarik perubahan terbaru dari `main`.
2. Buat branch pendek dengan prefix `feature/`, `fix/`, `test/`, atau `docs/`.
3. Buat commit kecil menggunakan Conventional Commits, misalnya
   `feat(tracking): add usage permission flow`.
4. Buka Pull Request memakai template yang tersedia.
5. Minta minimal satu review sebelum merge.

Jangan melakukan push langsung ke `main`. Aktifkan branch protection di GitHub
dengan kewajiban Pull Request dan status check `Flutter CI`.

## Definition of done

- Perilaku baru mempunyai test yang relevan.
- `dart format`, `flutter analyze`, dan `flutter test` lulus.
- Tidak ada secret, SDK path, keystore, atau file `.env` yang ter-commit.
- UI menangani loading, empty, dan error state.
- Perubahan kontrak di `core/` sudah dikoordinasikan dengan feature lain.

## Hive CE

Model persisten menggunakan `@HiveType` dan `@HiveField`. Setelah mengubahnya:

```sh
dart run build_runner build
```

Commit file `*.g.dart` hasil generator. Jangan pernah memakai ulang `typeId` atau
nomor field yang pernah dirilis. Tambahkan field baru; jangan mengubah arti field
lama karena dapat merusak data lokal pengguna.

## Pull Request

PR sebaiknya kecil dan fokus pada satu hasil. Sertakan screenshot untuk UI serta
langkah pengujian perangkat untuk permission, notification, atau background task.
