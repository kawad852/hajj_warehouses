enum TaskStatusEnum {
  notStarted('NOT-STARTED'),
  inProgress('IN-PROGRESS'),
  completed('COMPLETED');

  final String value;

  const TaskStatusEnum(this.value);
}
