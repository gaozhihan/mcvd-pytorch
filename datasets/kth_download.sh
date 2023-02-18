# Not work since I'm forbidden to access the link. Use the following command instead:
# gdown --fuzzy https://drive.google.com/file/d/1d2UfHV6RhSrwdDAlCFY3GymtFPpmh_8X/view?usp=sharing
# See detailed discussion at https://github.com/voletiv/mcvd-pytorch/issues/2

TARGET_DIR=$1
if [ -z $TARGET_DIR ]
then
  echo "Must specify target directory"
else
  mkdir $TARGET_DIR/processed
  URL=http://www.cs.nyu.edu/~denton/datasets/kth.tar.gz
  wget $URL -P $TARGET_DIR/processed
  tar -zxvf $TARGET_DIR/processed/kth.tar.gz -C $TARGET_DIR/processed/
  rm $TARGET_DIR/processed/kth.tar.gz

  mkdir $TARGET_DIR/raw
  for c in walking jogging running handwaving handclapping boxing
  do  
    URL=http://www.nada.kth.se/cvap/actions/"$c".zip
    wget $URL -P $TARGET_DIR/raw
    mkdir $TARGET_DIR/raw/$c
    unzip $TARGET_DIR/raw/"$c".zip -d $TARGET_DIR/raw/$c
    rm $TARGET_DIR/raw/"$c".zip
  done

fi