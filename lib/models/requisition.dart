class Requisition {
  final String title;
  final String doctype;
  final String location;
  final DateTime created;
  final String runningtime;
  final int pipelineStage;

  Requisition(this.title, this.doctype, this.location, this.created,
      this.runningtime, this.pipelineStage);
}
