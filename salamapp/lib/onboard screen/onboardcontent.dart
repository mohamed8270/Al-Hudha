class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> content = [
  OnboardingContent(
    image: 'assets/images/quran.png',
    title: 'Quran Recitation',
    description:
        "The Messenger of Allah (blessings of Allah be upon him and his family) has said: “One who listens to the Qur’an (while it is being recited) will be kept away from the evils of this world; and one who recites the Qur’an will be kept away from the trials of the hereafter. And the person who listens to even one verse of the book of Allah",
  ),
  OnboardingContent(
    image: 'assets/images/tasbih.png',
    title: 'Take Tasbih',
    description:
        "The Messenger of Allah (ﷺ) said: 'Purity is half of iman (faith). ‘Al-hamdu lillah (all praise and gratitude belong to Allah)’ fills the scales, and ‘subhan-Allah (how far is Allah from every imperfection) and ‘Al-hamdulillah (all praise and gratitude belong to Allah)’ fill that which is between heaven and earth'",
  ),
  OnboardingContent(
    image: 'assets/images/qibla.png',
    title: 'Prayer time & Qibla',
    description:
        "Abdullah asked the Prophet Muhammad (SAW) 'Which deed is the dearest to Allah?' He replied, 'To offer the prayers at their early stated fixed times",
  ),
];
