class Costume {
  final int costumeId;
  final String category;
  final String costumeName;
  final String gender;
  final String imageURL;
  List<String> images;
  final String decription;

  Costume(
      {required this.costumeId,
        required this.category,
        required this.gender,
        required this.costumeName,
        required this.imageURL,
        required this.images,
        required this.decription,});

  static List<Costume> costumeList = [
    Costume(
        costumeId: 0,
        category: 'Nguyễn',
        gender: 'Nam',
        costumeName: 'Áo Tấc',
        imageURL: 'assets/images/example-0.png',
        images: [
          "assets/images/example-0-1.png",
          "assets/images/example-0-2.png",
        ],
        decription: "Áo Tấc là một loại trang phục đặc thù của thời Nguyễn, có lịch sử hình thành khoảng trên dưới 300 năm, gắn liền với công cuộc cải cách và định chế trang phục ở Đàng Trong của Chúa Nguyễn Phúc Khoát. Áo Tấc là tên gọi phổ biến của loại áo ngũ thân tay rộng, và còn có các tên gọi khác như áo lễ, áo thụng, áo rộng...Cũng như loại áo ngũ thân tay chẽn, áo Tấc dành cho cả hai giới nam và nữ, và cho mọi tầng lớp trong xã hội, không phân biệt đẳng cấp, sang hèn.",
    ),
    Costume(
        costumeId: 1,
        category: 'Lý',
        gender: 'Nam',
        costumeName: 'Viên Lĩnh',
        imageURL: 'assets/images/example-1.png',
        images: [
          "assets/images/example-1-1.png",
          "assets/images/example-1-2.png",
        ],
        decription: "Tại Việt Nam, viên lĩnh thường được dùng làm bào phục, mặc ngoài áo giao lĩnh lót trong. Áo bào thiết triều của vua quan Việt từ triều Lý đến Nguyễn hầu hết đều là viên lĩnh. Áo quái khoác bởi nhạc công, vũ công cũng thế. Vào triều Nguyễn, một số áo viên lĩnh khoác ngoài được thay bằng thụ lĩnh (áo cổ đứng), song kết cấu vẫn không thay đổi nhiều.",
    ),
    Costume(
        costumeId: 2,
        category: 'Nguyễn',
        gender: 'Nữ',
        costumeName: 'Áo Nhật Bình',
        imageURL: 'assets/images/example-2.png',
        images: [
          "assets/images/example-2-1.png",
          "assets/images/example-2-2.png",
          "assets/images/example-2-3.png",
        ],
        decription:
        "Áo Nhật Bình là Triều phục dành cho cung tần nhất, nhị, tam, tứ giai và là Thường phục của hoàng hậu, công chúa. Áo Nhật Bình có nguyên mẫu là dạng áo Phi Phong thời Minh, là loại áo xẻ cổ, có dạng đối khâm, cổ áo to bản tạo thành hình chữ nhật ở trước ngực, dưới ức có dải vải buộc hai vạt áo. Thường phục Nhật Bình được đặt định vào năm 1807 thời vua Gia Long và được duy trì cho đến cuối thời Nguyễn… tư liệu tranh ảnh đầu thế kỉ XX cho thấy bất kể hoàng hậu, công chúa hay cung tần đều vấn khăn vành, mặc áo Nhật Bình."
      ,),
    Costume(
        costumeId: 3,
        category: 'Lý',
        costumeName: 'Tứ Diện',
        gender: 'Nữ',
        imageURL: 'assets/images/example-3.png',
        images: [
          'assets/images/example-3.png'
        ],
        decription:
        'Áo tứ diện là một loại áo có thể được mặc theo nhiều cách khác nhau, tạo ra 4 diện khác nhau cho người mặc. Đặc điểm chính của áo tứ diện là có thiết kế và cấu trúc cho phép các mặt trước, sau và hai bên của áo có thể được sắp xếp và kết hợp theo nhiều cách khác nhau.',),
    Costume(
        costumeId: 4,
        category: 'Lý',
        gender: 'Nữ',
        costumeName: 'Viên Lĩnh',
        images: [
          'assets/images/example-4.png'
        ],
        imageURL: 'assets/images/example-4.png',
        decription:
        'Áo tứ diện là một loại áo có thể được mặc theo nhiều cách khác nhau, tạo ra 4 diện khác nhau cho người mặc. Đặc điểm chính của áo tứ diện là có thiết kế và cấu trúc cho phép các mặt trước, sau và hai bên của áo có thể được sắp xếp và kết hợp theo nhiều cách khác nhau.',),
    Costume(
        costumeId: 5,
        category: 'Nguyễn',
      gender: 'Nữ',
        costumeName: 'Áo Tấc',
        imageURL: 'assets/images/example-5.png',
        images: [
          'assets/images/example-5.png'
        ],
        decription:
        'Áo tứ diện là một loại áo có thể được mặc theo nhiều cách khác nhau, tạo ra 4 diện khác nhau cho người mặc. Đặc điểm chính của áo tứ diện là có thiết kế và cấu trúc cho phép các mặt trước, sau và hai bên của áo có thể được sắp xếp và kết hợp theo nhiều cách khác nhau.',),
    Costume(
        costumeId: 6,
        category: 'Nguyễn',
      gender: 'Nữ',
        costumeName: 'Plumbago',

        imageURL: 'assets/images/example-6.png',
        images: [
          'assets/images/example-6.png'
        ],
        decription:
        'Áo tứ diện là một loại áo có thể được mặc theo nhiều cách khác nhau, tạo ra 4 diện khác nhau cho người mặc. Đặc điểm chính của áo tứ diện là có thiết kế và cấu trúc cho phép các mặt trước, sau và hai bên của áo có thể được sắp xếp và kết hợp theo nhiều cách khác nhau.',),
    Costume(
        costumeId: 7,
        category: 'Nguyễn',
      gender: 'Nữ',
        costumeName: 'Tritonia',
        imageURL: 'assets/images/example-7.png',
        images: [
          'assets/images/example-7.png'
        ],
        decription:
        'Áo tứ diện là một loại áo có thể được mặc theo nhiều cách khác nhau, tạo ra 4 diện khác nhau cho người mặc. Đặc điểm chính của áo tứ diện là có thiết kế và cấu trúc cho phép các mặt trước, sau và hai bên của áo có thể được sắp xếp và kết hợp theo nhiều cách khác nhau.',),
    Costume(
        costumeId: 8,
        category: 'Nguyễn',
      gender: 'Nữ',
        costumeName: 'Tritonia',
        imageURL: 'assets/images/example-8.png',
        images: [
          'assets/images/example-8.png'
        ],
        decription:
        'Áo tứ diện là một loại áo có thể được mặc theo nhiều cách khác nhau, tạo ra 4 diện khác nhau cho người mặc. Đặc điểm chính của áo tứ diện là có thiết kế và cấu trúc cho phép các mặt trước, sau và hai bên của áo có thể được sắp xếp và kết hợp theo nhiều cách khác nhau.',),
    Costume(
      costumeId: 9,
      category: 'Nguyễn',
      gender: 'Nữ',
      costumeName: 'Tritonia',
      imageURL: 'assets/images/example-9.png',
      images: [
        'assets/images/example-9.png'
      ],
      decription:
      'Áo tứ diện là một loại áo có thể được mặc theo nhiều cách khác nhau, tạo ra 4 diện khác nhau cho người mặc. Đặc điểm chính của áo tứ diện là có thiết kế và cấu trúc cho phép các mặt trước, sau và hai bên của áo có thể được sắp xếp và kết hợp theo nhiều cách khác nhau.',),
  ];
}
