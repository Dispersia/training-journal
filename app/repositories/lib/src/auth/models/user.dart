import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  const User({
    @required this.email,
    @required this.name,
    @required this.photo,
  })  : assert(email != null),
        assert(name != null);

  final String email;

  final String name;

  final String photo;

  static const empty = User(email: '', name: '', photo: null);

  @override
  List<Object> get props => [email, name, photo];
}
