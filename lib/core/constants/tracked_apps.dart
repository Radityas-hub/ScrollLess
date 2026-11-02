class TrackedApp {
  const TrackedApp({required this.name, required this.packageName});

  final String name;
  final String packageName;
}

const supportedApps = <TrackedApp>[
  TrackedApp(name: 'Instagram', packageName: 'com.instagram.android'),
  TrackedApp(name: 'TikTok', packageName: 'com.zhiliaoapp.musically'),
];
