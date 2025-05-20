import 'package:flutter/material.dart';

void main() {
  runApp(const YazarinSesiApp());
}

class YazarinSesiApp extends StatelessWidget {
  const YazarinSesiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yazarın Sesi',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.red,
      ),
      home: const YazarinSesiPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class YazarinSesiPage extends StatefulWidget {
  const YazarinSesiPage({super.key});

  @override
  State<YazarinSesiPage> createState() => _YazarinSesiPageState();
}

class _YazarinSesiPageState extends State<YazarinSesiPage> {
  int _selectedIndex = 2;

  final List<Map<String, dynamic>> authors = [
    {
      'name': 'George Orwell',
      'image': 'https://storage.googleapis.com/a1aa/image/cc2043a7-fd36-450e-64bc-b3266ec33bca.jpg',
      'rating': 4.8,
    },
    {
      'name': 'Fyodor Dostoyevski',
      'image': 'https://storage.googleapis.com/a1aa/image/2eb5dbbe-ed60-402d-c231-ed6ed418606a.jpg',
      'rating': 4.8,
    },
    {
      'name': 'Franz Kafka',
      'image': 'https://storage.googleapis.com/a1aa/image/ffbfd0e4-185e-4d89-cf32-b356346ea843.jpg',
      'rating': 4.8,
    },
    {
      'name': 'Mehmet Akif Ersoy',
      'image': 'https://storage.googleapis.com/a1aa/image/7ec151b2-e2b9-43e9-9846-707075d46135.jpg',
      'rating': 8.0,
    },
    {
      'name': 'Oğuz Atay',
      'image': 'https://storage.googleapis.com/a1aa/image/156508ce-4efe-4e67-ac80-868bd86a67b4.jpg',
      'rating': 4.8,
    },
  ];

  final List<Map<String, String>> discoverAuthors = [
    {
      'name': 'Nazım Hikmet',
      'image': 'https://storage.googleapis.com/a1aa/image/e4aa950e-ac08-40d5-6b35-84d33d6a14ca.jpg',
      'description':
      'Ben Nazım Hikmet, halkların özgürlüğü için yazdım, şiirlerimde açık, isyan ve inancın ateşli mücadelesini dile getirdim.',
    },
    {
      'name': 'Yaşar Kemal',
      'image': 'https://storage.googleapis.com/a1aa/image/8cd593f4-b139-4f55-c04b-728fe5334ba4.jpg',
      'description':
      'Ben Yaşar Kemal, Anadolu\'nun topraklarından halkların sesini duyurmaya geldim. Edebiyatım doğanın gücünü yansıtır.',
    },
  ];

  final List<Map<String, dynamic>> books = [
    {
      'title': 'Ahmed',
      'image': 'https://storage.googleapis.com/a1aa/image/ea871d75-daaf-4d1b-296f-62e5eb79b610.jpg',
      'rating': 4.8,
    },
    {
      'title': 'Suç ve Ceza',
      'image': 'https://storage.googleapis.com/a1aa/image/fae40db2-6206-46ac-6385-544eecaa47a0.jpg',
      'rating': 4.8,
    },
    {
      'title': 'Sefiller',
      'image': 'https://storage.googleapis.com/a1aa/image/af01f1af-afc7-474a-72cf-ef4793ad4476.jpg',
      'rating': 4.8,
    },
    {
      'title': 'Candide',
      'image': 'https://storage.googleapis.com/a1aa/image/4b0159d7-a1ac-4dd2-c448-14c3f3ef0240.jpg',
      'rating': 4.8,
    },
    {
      'title': 'Hayvan Çiftliği',
      'image': 'https://storage.googleapis.com/a1aa/image/2b336b44-60ea-4fc8-200b-4b2722de30bc.jpg',
      'rating': 4.8,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: const [
          Icon(Icons.menu, size: 28),
          SizedBox(width: 10),
          Text("Yazarın Sesi", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Yazar veya kitap ara',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Widget _buildAuthorCard(Map<String, dynamic> author) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(author['image'], height: 80, width: 80, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(author['name'], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text("⭐ ${author['rating']}"),
        ],
      ),
    );
  }

  Widget _buildDiscoverCard(Map<String, String> author) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(author['image']!, height: 90, width: 90, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(author['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(author['description']!, maxLines: 3, overflow: TextOverflow.ellipsis),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBookCard(Map<String, dynamic> book) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(book['image'], height: 100, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(book['title'], textAlign: TextAlign.center),
          Text("⭐ ${book['rating']}"),
        ],
      ),
    );
  }

  Widget _buildQuoteImage() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://storage.googleapis.com/a1aa/image/30e1bd69-8c5f-43c9-f7fb-7e2078b42fae.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 160,
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.red,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Kitaplar'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Yazarlar'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigation(),
      body: SafeArea(
        child: ListView(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildQuoteImage(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Popüler Yazarlar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: authors.map(_buildAuthorCard).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Keşfet", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Column(children: discoverAuthors.map(_buildDiscoverCard).toList()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Kitaplar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: books.map(_buildBookCard).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}