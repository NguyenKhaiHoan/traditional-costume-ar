class Onboarding {
  final String title;
  final String description;

  Onboarding({required this.title, required this.description,});

  static List<Onboarding> onboardingList = [
    Onboarding(
        title: "Giới thiệu ứng dụng",
        description: "Là nơi có thể khám phá mọi thứ về trang phục đặc biệt kết hợp với AR"
    ),
    Onboarding(
        title: "Cloth Try On",
        description: "Mặc thử trang phục ảo mình yêu thích"
    ),
    Onboarding(
        title: "AR View",
        description: "Trình chiếu mô hình 3D sử dụng công nghệ ARCore"
    ),
  ];
}
