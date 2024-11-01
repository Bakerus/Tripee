class OnboardModel {
  final String image, title, description, arguments;
  OnboardModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.arguments});
}

// *****************************************************************************
// OnboardModel
// 
// This class defines an `OnboardModel` object, which represents data for 
// onboarding screens. The model encapsulates the content (image, title, 
// description, and arguments) needed to display each step of an onboarding 
// process in a mobile application.
// 
// Key features:
// - `OnboardModel` class constructor is required to initialize all attributes 
//   of the class upon object creation.
// 
// Attributes:
// - `image`: String - The path or URL to the image used in the onboarding step.
// - `title`: String - The title text displayed on the onboarding screen.
// - `description`: String - A brief description or message displayed on the screen.
// - `arguments`: String - Additional arguments or metadata that may be needed 
//   for navigation or further configuration.
// 
// *****************************************************************************