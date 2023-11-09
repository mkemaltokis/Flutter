class Question {
  final String questionText;
  final List<String> options;

  Question(this.questionText, this.options);
}

final List<Question> questions = [
  Question(
    'Flutter hangi programlama dilini kullanır?',
    ['Java', 'Python', 'Dart', 'C++'],
  ),
  Question(
    'Flutter, hangi platformlarda kullanılabilir?',
    ['Yalnızca iOS', 'Yalnızca Android', 'iOS ve Android', 'Windows'],
  ),
  Question(
    'Flutter\'da kullanılan widgetler nasıl hiyerarşik bir yapı oluşturur?',
    [
      'Ağaç yapısı kullanarak',
      'Daire şeklinde',
      'Liste şeklinde',
      'Halka açık yapıda'
    ],
  ),
  Question(
    'Flutter\'da "stateless widget" nedir?',
    [
      'Durumsuz bir widget türü',
      'Widget\'ın durumunu saklamak için kullanılan yapı',
      'Widget\'ın boyutunu belirlemek için kullanılan yapı',
      'Widget\'ın stilini tanımlayan yapı'
    ],
  ),
  Question(
    'Flutter\'da "hot reload" ne işe yarar?',
    [
      'Uygulamanın soğutulmasını hızlandırır',
      'Kodu derleme süresini uzatır',
      'Kod değişikliklerini hızlı bir şekilde görselleştirir',
      'Uygulamanın tüm verilerini sıfırlar'
    ],
  ),
  Question(
    'Flutter\'da "pubspec.yaml" dosyası ne işe yarar?',
    [
      'Uygulamanın ikonlarını tanımlar',
      'Kütüphaneleri ve bağımlılıkları yönetir',
      'Kullanıcı arayüzünü oluşturur',
      'Veritabanı işlemlerini yönetir'
    ],
  ),
  Question(
    'Flutter\'da "Container" widget\'i ne işe yarar?',
    [
      'Metin girişi sağlar',
      'Düzenleme yapmak için kullanılır',
      'Görsel elemanları gruplar',
      'Animasyonlar oluşturur'
    ],
  ),
  Question(
    'Flutter\'da "ListView.builder" kullanarak ne tür liste oluşturabilirsiniz?',
    [
      'Sabit uzunluklu liste',
      'Sonsuz liste',
      'Yatay liste',
      'İletişim kutuları'
    ],
  ),
  Question(
    'Flutter\'da "GestureDetector" widget\'i ne işe yarar?',
    [
      'Sesli komutları tanır',
      'Dokunma ve hareket etmeye duyarlı bir alan oluşturur',
      'GPS verilerini okur',
      'E-posta gönderme işlemlerini gerçekleştirir'
    ],
  ),
  Question(
    'Flutter\'da "Navigator" ne işe yarar?',
    [
      'Yol tarifleri sağlar',
      'Sayfalar arasında gezinmeyi yönetir',
      'Kullanıcıya öneriler sunar',
      'Sosyal medya entegrasyonu sağlar'
    ],
  ),
];
