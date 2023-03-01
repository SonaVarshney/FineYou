import 'tile_model.dart';

int points = 0;
bool selected = false;
String selectedImageAssetPath = "";
int selectedTileIndex = 0;
//bool letsPlay = false;

List<TileModel> pairs = <TileModel>[];
List<TileModel> visiblePairs = <TileModel>[];
List<TileModel> getPairs() {
  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = new TileModel(imageAssetPath: '', isSelected: false);
  //1
  tileModel.setImageAssetPath("assets/1st.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //2
  tileModel.setImageAssetPath("assets/2nd.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //3
  tileModel.setImageAssetPath("assets/3rd.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);
  //4
  tileModel.setImageAssetPath("assets/4.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //5
  tileModel.setImageAssetPath("assets/5.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //6
  tileModel.setImageAssetPath("assets/6.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //7
  tileModel.setImageAssetPath("assets/happy.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //8
  tileModel.setImageAssetPath("assets/rewards.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  return pairs;
}

List<TileModel> getQuestions() {
  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = new TileModel(imageAssetPath: '', isSelected: false);
  //1
  tileModel.setImageAssetPath("assets/question_mark.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //2
  tileModel.setImageAssetPath("assets/question_mark.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //3
  tileModel.setImageAssetPath("assets/question_mark.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);
  //4
  tileModel.setImageAssetPath("assets/question_mark.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //5
  tileModel.setImageAssetPath("assets/question_mark.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //6
  tileModel.setImageAssetPath("assets/question_mark.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //7
  tileModel.setImageAssetPath("assets/question_mark.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //8
  tileModel.setImageAssetPath("assets/question_mark.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  return pairs;
}
