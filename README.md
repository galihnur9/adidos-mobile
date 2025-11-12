# Adidos

# Tugas 7: Elemen Dasar Flutter

## 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

**Widget tree** adalah struktur hierarki yang menggambarkan bagaimana semua widget (komponen UI) tersusun dalam suatu aplikasi. Karena di Flutter **"semuanya adalah widget"**, mereka disusun dalam struktur hierarki bertingkat (*nested*), mirip seperti pohon silsilah keluarga. Flutter membaca pohon ini dari atas ke bawah untuk menentukan apa yang harus digambar di layar.

## 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

- **MaterialApp**: Pembungkus aplikasi Material, mengatur title, tema, dan navigasi.
- **Scaffold**: Kerangka halaman Material (app bar + body).
- **AppBar**: Bagian atas dengan judul "Adidos".
- **Text**: Menampilkan teks (judul dan nama item).
- **Padding**: Memberi jarak di sekitar konten dan sebagai spacer kecil.
- **Column**: Menyusun child secara vertikal.
- **Center**: Menempatkan widget child di tengah
- **GridView.count**: Menampilkan daftar ItemCard dalam grid 3 kolom.
- **Material**: Memberi efek dan gaya Material pada kartu (warna, sudut).
- **InkWell**: Efek ripple dan deteksi tap pada kartu.
- **SnackBar**: Menampilkan pesan singkat saat item ditekan.
- **Icon**: Menampilkan ikon untuk tiap item.
- **Container**: Pembungkus fleksibel untuk padding dan layout.

## 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Fungsi dari widget **MaterialApp** adalah menyediakan konfigurasi global dan fitur dasar aplikasi seperti:

1. **Tema** (warna, font, dll) lewat `theme`.
2. **Navigasi** antar halaman lewat `Navigator` dan `routes`.
3. **Judul aplikasi** (`title`).

Ia menjadi root widget karena menyediakan struktur, gaya, dan sistem navigasi untuk seluruh widget di bawahnya.

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

**StatelessWidget** itu *immutable* (permanen). Tampilannya tidak akan pernah berubah setelah dibuat. Ia hanya digambar satu kali berdasarkan data (konfigurasi) yang diterimanya dari parent-nya. Ia tidak peduli pada apa pun selain konfigurasi awalnya. 

Sedangkan **StatefulWidget** *mutable* (bisa berubah). Ia memiliki **State** (data internal) yang bisa diubah kapan saja selama widget itu hidup. Saat state internalnya berubah (dengan memanggil `setState()`), Flutter akan menggambar ulang widget tersebut dengan tampilan baru.

Saya akan memilih **StatelessWidget** saat ingin menampilkan teks, ikon, gambar statis, intinya hanya butuh tampilan tetap tanpa perubahan internal (misal halaman profil statis). 

Di lain sisi, saya akan memilih **StatefulWidget** saat ada interaksi pengguna (klik, input, animasi). Yang dimana tampilan berubah berdasarkan aksi atau waktu (misal counter, form, toggle, animasi).

## 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

Dalam Flutter, **BuildContext** adalah objek yang merepresentasikan posisi suatu widget di dalam widget tree. Ia digunakan oleh Flutter untuk mengetahui di mana widget itu berada, dan bagaimana ia berinteraksi dengan widget lain di atasnya (parent). Dalam metode `build()`, BuildContext berfungsi sebagai "identitas" atau "alamat" bagi widget tersebut di dalam struktur aplikasi Flutter.

Ketika Flutter memanggil `build()`, ia memberikan `context` agar widget tahu di mana posisinya berada dalam pohon widget dan bisa mengakses data dari widget lain yang menjadi induknya, seperti tema, navigator, atau ukuran layar. proyek ini dan jelaskan fungsinya.

## 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Dalam Flutter, **hot reload** adalah fitur yang memungkinkan developer memperbarui tampilan aplikasi secara langsung saat kode diubah, tanpa harus menghentikan atau memulai ulang aplikasi. Flutter hanya memuat ulang bagian kode yang berubah dan memperbarui tampilan UI yang terkait, tanpa menghapus state aplikasi yang sedang berjalan. Tujuannya adalah mempercepat proses pengembangan, misalnya ketika kita mengubah teks, warna, atau tata letak, hasilnya langsung terlihat di emulator atau perangkat.

**Perbedaannya dengan hot restart:**
- **Hot reload** hanya memperbarui kode yang berubah dan mempertahankan state aplikasi (misalnya nilai counter tetap sama)
- **Hot restart** memulai ulang seluruh aplikasi dari awal, sehingga semua state direset seperti saat aplikasi baru dijalankan lagi.

# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Element

## 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

**Navigator.push()** menambahkan halaman baru ke stack dan mempertahankan halaman sebelumnya, sehingga user bisa kembali dengan tombol back. **Navigator.pushReplacement()** mengganti halaman saat ini dan menghapusnya dari stack, sehingga user tidak bisa kembali.
Saya menggunakan `push()` untuk navigasi sementara seperti form tambah produk atau detail produk, dan menggunakan `pushReplacement()` untuk navigasi menu utama dari drawer atau setelah login berhasil.

## 2. Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

**Scaffold** sebagai struktur dasar semua halaman, yang menyediakan kerangka standar dengan AppBar dan body yang sama di setiap halaman.

**AppBar** dengan konfigurasi konsisten - judul "Adidos", warna biru, dan teks putih bold di semua halaman (`menu.dart` dan `adidos_form.dart`).

**Drawer** (LeftDrawer) yang sama dipasang di setiap Scaffold, memberikan navigasi konsisten dengan header biru dan menu yang seragam.

Struktur hierarki:
```
Scaffold
├── AppBar (konsisten: warna biru, judul putih)
├── Drawer (LeftDrawer - navigasi standar)
└── Body (konten berbeda per halaman)
```

Dengan begini, tampilan dan navigasi aplikasi menjadi seragam dan mudah digunakan di seluruh halaman.

## 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

**Padding** memberikan jarak konsisten antar elemen form, membuat tampilan lebih rapi dan mudah dibaca.
```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(labelText: "Nama Produk"),
  ),
),
```

**SingleChildScrollView** memungkinkan form dengan banyak field dapat di-scroll ketika keyboard muncul atau layar kecil.
```dart
body: Form(
  child: SingleChildScrollView(  // Form bisa di-scroll
    child: Column(
      children: [
        // Field nama, harga, deskripsi, kategori, dll
      ],
    ),
  ),
),
```

**ListView** berguna untuk menampilkan daftar item yang dinamis dan dapat di-scroll secara efisien.
```dart
ListView(
  children: [
    ListTile(title: Text("Home")),
    ListTile(title: Text("Add Product")),
  ],
)
```

## 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Saat ini saya masih mengikuti template tutorial dengan warna biru, namun untuk konsistensi brand Adidos, nantinya akan saya ubah ke tema **black and white** yang mirip dengan Adidas.

**Implementasi Saat Ini:**
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
    .copyWith(secondary: Colors.blueAccent[400]),
),
```

**Rencana Tema Adidos (Black & White):**
- **Primary Color**: Hitam untuk AppBar, header drawer, dan background utama
- **Secondary Color**: Putih untuk tombol dan elemen kontras
- **Background**: Hitam untuk konsistensi theme gelap
- **Text Color**: Putih di background hitam, Hitam di background putih
- **Button Color**: Putih dengan teks hitam untuk highlight