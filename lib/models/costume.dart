class Costume {
  final int costumeId;
  final String category;
  final String costumeName;
  final String user;
  final String imageURL;
  List<String> images;
  final String decription;

  Costume(
      {required this.costumeId,
        required this.category,
        required this.costumeName,
        required this.user,
        required this.imageURL,
        required this.images,
        required this.decription,});

  //List of Plants data
  static List<Costume> costumeList = [
    Costume(
        costumeId: 0,
        category: 'Nguyễn',
        costumeName: 'Áo Tấc',
        imageURL: 'assets/images/example-0.png',
        user: '',
        images: [
          "assets/images/example-0-1.png",
          "assets/images/example-0-2.png",
        ],
        decription: "Áo Tấc là một loại trang phục đặc thù của thời Nguyễn, có lịch sử hình thành khoảng trên dưới 300 năm, gắn liền với công cuộc cải cách và định chế trang phục ở Đàng Trong của Chúa Nguyễn Phúc Khoát. Áo Tấc là tên gọi phổ biến của loại áo ngũ thân tay rộng, và còn có các tên gọi khác như áo lễ, áo thụng, áo rộng...Cũng như loại áo ngũ thân tay chẽn, áo Tấc dành cho cả hai giới nam và nữ, và cho mọi tầng lớp trong xã hội, không phân biệt đẳng cấp, sang hèn.",
    ),
    Costume(
        costumeId: 1,
        category: 'Lý',
        costumeName: 'Viên Lĩnh',
        user: '',
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
        costumeName: 'Áo Nhật Bình',
        user: '',
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
      user: '',
        imageURL: 'assets/images/example-3.png',
        images: [
          "https://scontent.fsgn2-3.fna.fbcdn.net/v/t39.30808-6/339455358_144265648347745_8817973244890924258_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=0debeb&_nc_ohc=K0h8JSUtCOEAX_vMwcd&_nc_ht=scontent.fsgn2-3.fna&oh=00_AfB_wsycmK_dk8J0fYiWtll80gh0OM15f3kKyL_SL8XXXg&oe=64331C56",
          "https://scontent.fsgn2-9.fna.fbcdn.net/v/t39.30808-6/339559100_885073832571366_4259654247665704584_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=8VeMFENm0usAX9EPc5F&_nc_ht=scontent.fsgn2-9.fna&oh=00_AfDJ6ZyyK51D7JLCJN7sYRqHvPazvC6WeOSB_z1l248dkQ&oe=643327BE",
          "https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-6/339449547_966350917858767_7569890909004587983_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=ambfFHlbg9YAX_PNX5I&_nc_ht=scontent.fsgn2-4.fna&oh=00_AfAzKwz3xcnJ3SUzar8aUdbcLCPAxXSRKcRqmaSdlMGSUw&oe=64326911",
          "https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-6/339438855_745586903974066_2235131637162818647_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=0debeb&_nc_ohc=peJXinLT3eAAX99rpTe&_nc_ht=scontent.fsgn2-7.fna&oh=00_AfBnh07Sd0Rojm6vM-Aye1UOa0tNMllJvK80_pReTjH2SQ&oe=643272F0"
        ],
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',),
    Costume(
        costumeId: 4,
        category: 'Lý',
      user: '',
        costumeName: 'Viên Lĩnh',
        images: [
          "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
          "https://images.unsplash.com/photo-1577791465485-b80039b4d69a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
          "https://images.unsplash.com/photo-1577404699057-04440b45986f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
          "https://images.unsplash.com/photo-1549973890-38d08b229439?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=642&q=80",
          "https://images.unsplash.com/photo-1622263096760-5c79f72884af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"
        ],
        imageURL: 'assets/images/example-4.png',
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',),
    Costume(
        costumeId: 5,
        category: 'Nguyễn',
        user: '',
        costumeName: 'Áo Tấc',
        imageURL: 'assets/images/example-5.png',
        images: [
          "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
          "https://images.unsplash.com/photo-1577791465485-b80039b4d69a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
          "https://images.unsplash.com/photo-1577404699057-04440b45986f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
          "https://images.unsplash.com/photo-1549973890-38d08b229439?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=642&q=80",
          "https://images.unsplash.com/photo-1622263096760-5c79f72884af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"
        ],
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',),
    Costume(
        costumeId: 6,
        category: 'Nguyễn',
      user: '',
        costumeName: 'Plumbago',

        imageURL: 'assets/images/example-6.png',
        images: [
          "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
          "https://images.unsplash.com/photo-1577791465485-b80039b4d69a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
          "https://images.unsplash.com/photo-1577404699057-04440b45986f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
          "https://images.unsplash.com/photo-1549973890-38d08b229439?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=642&q=80",
          "https://images.unsplash.com/photo-1622263096760-5c79f72884af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"
        ],
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',),
    Costume(
        costumeId: 7,
        category: 'Nguyễn',
      user: '',
        costumeName: 'Tritonia',
        imageURL: 'assets/images/example-7.png',
        images: [
          "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
          "https://images.unsplash.com/photo-1577791465485-b80039b4d69a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
          "https://images.unsplash.com/photo-1577404699057-04440b45986f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
          "https://images.unsplash.com/photo-1549973890-38d08b229439?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=642&q=80",
          "https://images.unsplash.com/photo-1622263096760-5c79f72884af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"
        ],
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',),
    Costume(
        costumeId: 8,
        category: 'Nguyễn',
      user: '',
        costumeName: 'Tritonia',
        imageURL: 'assets/images/example-8.png',
        images: [
          "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
          "https://images.unsplash.com/photo-1577791465485-b80039b4d69a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
          "https://images.unsplash.com/photo-1577404699057-04440b45986f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
          "https://images.unsplash.com/photo-1549973890-38d08b229439?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=642&q=80",
          "https://images.unsplash.com/photo-1622263096760-5c79f72884af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"
        ],
        decription:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',),
    Costume(
      costumeId: 9,
      category: 'Nguyễn',
      user: '',
      costumeName: 'Tritonia',
      imageURL: 'assets/images/example-9.png',
      images: [
        "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
        "https://images.unsplash.com/photo-1577791465485-b80039b4d69a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
        "https://images.unsplash.com/photo-1577404699057-04440b45986f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=752&q=80",
        "https://images.unsplash.com/photo-1549973890-38d08b229439?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=642&q=80",
        "https://images.unsplash.com/photo-1622263096760-5c79f72884af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"
      ],
      decription:
      'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',),
  ];
}
