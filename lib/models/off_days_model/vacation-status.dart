enum VacationStatus {
  pending,
  Accepted,
  rejected,
}
extension VacationStatusExtension on VacationStatus {
  String get label {
    switch (this) {
      case VacationStatus.pending:
        return "Pending";
      case VacationStatus.Accepted:
        return "Accepted";
      case VacationStatus.rejected:
        return "Rejected";
    }
  }
}


