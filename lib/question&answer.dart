class Question {
  String questiontext;
  List<Answer> answerlist;

  Question(this.questiontext, this.answerlist);
}

class Answer {
  String answertext;
  bool iscorrect;

  Answer(this.answertext, this.iscorrect);
}

List<Question> getquestions() {
  List<Question> list = [];
  list.add(
    Question('What is the capital of France?', [
      Answer('Paris', true),
      Answer('London', false),
      Answer('Berlin', false),
      Answer('Madrid', false)
    ]),
  );
  list.add(
    Question('who is your best friend?', [
      Answer('khadiga', true),
      Answer('nour', false),
      Answer('salma', false),
      Answer('jana', false)
    ]),
  );
  list.add(
    Question('How old is Eyad?', [
      Answer('14', true),
      Answer('20', false),
      Answer('18', false),
      Answer('10', false)
    ]),
  );
  list.add(
    Question(
        'you are in the 4th place in a race, What place will you be in When you pass the person in the 3rd place ?',
        [
          Answer('3rd', true),
          Answer('2nd', false),
          Answer('1st', false),
          Answer('4th', false)
        ]),
  );
  return list;
}
