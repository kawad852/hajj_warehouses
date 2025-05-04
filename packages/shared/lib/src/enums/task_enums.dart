enum TaskStatusEnum {
  notStarted('NOT-STARTED'),
  inProgress('IN-PROGRESS'),
  completed('COMPLETED'),
  late('LATE'),
  notCompleted('NOT-COMPLETED');

  final String value;

  const TaskStatusEnum(this.value);
}
