class ChmodModel {
  bool ownerRead = false;
  bool ownerWrite = false;
  bool ownerExecute = false;
  bool groupRead = false;
  bool groupWrite = false;
  bool groupExecute = false;
  bool othersRead = false;
  bool othersWrite = false;
  bool othersExecute = false;

  ChmodModel({
    this.ownerRead = false,
    this.ownerWrite = false,
    this.ownerExecute = false,
    this.groupRead = false,
    this.groupWrite = false,
    this.groupExecute = false,
    this.othersRead = false,
    this.othersWrite = false,
    this.othersExecute = false,
  });

  fromString(String chmod) {
    ownerRead = chmod[0] == 'r';
    ownerWrite = chmod[1] == 'w';
    ownerExecute = chmod[2] == 'x';
    groupRead = chmod[3] == 'r';
    groupWrite = chmod[4] == 'w';
    groupExecute = chmod[5] == 'x';
    othersRead = chmod[6] == 'r';
    othersWrite = chmod[7] == 'w';
    othersExecute = chmod[8] == 'x';
  }

  int toNumber() {
    int result = 0;
    if (ownerRead) result += 400;
    if (ownerWrite) result += 200;
    if (ownerExecute) result += 100;
    if (groupRead) result += 40;
    if (groupWrite) result += 20;
    if (groupExecute) result += 10;
    if (othersRead) result += 4;
    if (othersWrite) result += 2;
    if (othersExecute) result += 1;
    return result;
  }

  @override
  String toString() {
    return (ownerRead ? 'r' : '-') +
        (ownerWrite ? 'w' : '-') +
        (ownerExecute ? 'x' : '-') +
        (groupRead ? 'r' : '-') +
        (groupWrite ? 'w' : '-') +
        (groupExecute ? 'x' : '-') +
        (othersRead ? 'r' : '-') +
        (othersWrite ? 'w' : '-') +
        (othersExecute ? 'x' : '-');
  }
}
