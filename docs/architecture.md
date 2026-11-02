# Architecture

ScrollLess menggunakan struktur feature-first dengan dependency mengarah ke
kontrak bersama di `core/`.

```text
screens -> providers -> repository interfaces <- platform implementations
                          |
                      core models
```

## Batas modul

- `tracking` menghasilkan usage snapshot dan aturan limit.
- `reminder` membaca hasil evaluasi limit dan mengirim satu reminder idempotent.
- `punishment` mengonsumsi violation yang sudah terkonfirmasi, bukan membaca
  UsageStats secara langsung.
- `core` hanya berisi hal yang benar-benar digunakan lintas feature.
- `shared` berisi widget presentasional tanpa aturan bisnis.

## Kontrak awal

- `UsageSnapshot`: durasi foreground suatu package pada waktu pengambilan.
- `LimitRule`: limit harian per package yang disimpan di Hive.
- `Violation`: kejadian limit terlampaui dan poin penalty yang diberikan.
- `UsageRepository`: batas antara feature dan plugin Android `usage_stats`.
- `LimitRuleRepository`: batas antara feature dan penyimpanan Hive.

Semua waktu domain memakai `DateTime` dan `Duration`; konversi millisecond dari
plugin dilakukan hanya di implementation repository.

## Background processing

Callback WorkManager harus tetap top-level dan diberi `@pragma('vm:entry-point')`.
Pekerjaan background wajib aman bila dipanggil ulang. Gunakan ID violation yang
deterministik atau pencatatan status sebelum mengirim notification/penalty.

WorkManager bukan timer presisi. UI tidak boleh menjanjikan reminder real-time.

## Demo mode

Demo mode diaktifkan melalui `--dart-define=DEMO_MODE=true`. Implementasi demo
nantinya harus diberikan melalui provider override atau repository terpisah agar
jalur produksi tetap dapat diuji tanpa kondisi khusus tersebar.
