class CampaignEntity {
  int? idCampaign;
  String? title;
  String? shortDescription;
  String? images;
  int? goalAmount;
  int? currentAmount;

  CampaignEntity(
      {this.idCampaign,
      this.title,
      this.shortDescription,
      this.images,
      this.goalAmount,
      this.currentAmount});
}
