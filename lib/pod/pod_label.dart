// Project imports:
import 'package:fuwa/entity/discord/id.dart';

class PodLabel<Id extends IdBase> {
  PodLabel(this.accountId, this.id);

  final UserId accountId;
  final Id id;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PodLabel) return false;
    return runtimeType == other.runtimeType &&
        accountId == other.accountId &&
        id == other.id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId, id);
}
