class Onboarding {
  final String title;
  final String description;

  Onboarding({required this.title, required this.description,});

  //List of Plants data
  static List<Onboarding> onboardingList = [
    Onboarding(
        title: "Giới thiệu ứng dụng Trang phục truyền thống AR",
        description: "There are many traditional costume with designs that are suitable for you today"
    ),
    Onboarding(
        title: "Virtual Try On",
        description: "There are many traditional costume with designs that are suitable for you today"
    ),
    Onboarding(
        title: "AR View",
        description: "There are many traditional costume with designs that are suitable for you today"
    ),
  ];
}
