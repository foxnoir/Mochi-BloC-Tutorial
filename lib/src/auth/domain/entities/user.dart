import 'package:equatable/equatable.dart';

// only used in domain layer
// what we get from server
class User extends Equatable {
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  // makes it easier to test
  const User.empty()
      : id = 1,
        createdAt = 'empty.createdAt',
        name = 'empty.name',
        avatar = 'empty.avatar';

  final int id;
  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => throw [id];
}
