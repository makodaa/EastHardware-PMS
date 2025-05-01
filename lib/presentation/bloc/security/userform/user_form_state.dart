part of 'user_form_bloc.dart';

class UserFormState extends Equatable {
  final String firstName;
  final String lastName;
  final String username;
  final String accessLevel;
  final String password;
  final String confirmPassword;
  final List<FormQuestion> questions;
  final FormStatus status;

  // Hidden attributes
  final int? userId;
  final String? creationDate;
  final String? uid;
  final Uint8List? salt;
  final Uint8List? passwordHash;
  final int? archiveStatus;

  // Hidden attributes for the UI
  final String? accessLevelErrorMessage;

  const UserFormState({
    this.userId,
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.accessLevel = '',
    this.password = '',
    this.confirmPassword = '',
    this.questions = const [
      FormQuestion(question: "", answer: ""),
      FormQuestion(question: "", answer: ""),
      FormQuestion(question: "", answer: ""),
    ],
    this.status = FormStatus.initial,
    this.creationDate,
    this.archiveStatus,
    this.uid,
    this.salt,
    this.passwordHash,
    this.accessLevelErrorMessage,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        username,
        accessLevel,
        password,
        questions,
        status,
        creationDate ?? '',
        archiveStatus ?? 0,
        uid ?? '',
        salt ?? Uint8List(0),
        passwordHash ?? Uint8List(0),
        accessLevelErrorMessage ?? '',
        userId ?? 0,
      ];

  UserFormState copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    String? username,
    String? accessLevel,
    String? password,
    String? confirmPassword,
    List<FormQuestion>? questions,
    FormStatus? status,
    String? creationDate,
    int? archiveStatus,
    String? uid,
    Uint8List? salt,
    Uint8List? passwordHash,
    String? accessLevelErrorMessage,
  }) {
    return UserFormState(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      accessLevel: accessLevel ?? this.accessLevel,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      questions: questions ?? this.questions,
      status: status ?? this.status,
      creationDate: creationDate ?? this.creationDate,
      archiveStatus: archiveStatus ?? this.archiveStatus,
      uid: uid ?? this.uid,
      salt: salt ?? this.salt,
      passwordHash: passwordHash ?? this.passwordHash,
      accessLevelErrorMessage: accessLevelErrorMessage ?? this.accessLevelErrorMessage,
    );
  }

  User mapStateToUser() {
    return User(
      uid: uid!,
      firstName: firstName,
      lastName: lastName,
      username: username,
      accessLevel: AccessLevel.values.firstWhere((element) => element.name == accessLevel),
      passwordHash: passwordHash!,
      salt: salt!,
      status: archiveStatus!,
      creationDate: creationDate!,
    );
  }

  factory UserFormState.fromUser(User user) {
    return UserFormState(
      userId: user.id,
      creationDate: user.creationDate,
      firstName: user.firstName,
      lastName: user.lastName,
      username: user.username,
      accessLevel: user.accessLevel.name,
      passwordHash: user.passwordHash,
      salt: user.salt,
      archiveStatus: user.status,
      uid: user.uid,
    );
  }
}
