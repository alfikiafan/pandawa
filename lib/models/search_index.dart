class SearchIndex {
  static final List<String> states = [
    'Abimanyu',
    'Anoman',
    'Antasena',
    'Arimbi',
    'Arjuna',
    'Baladewa',
    'Bagong',
    'Bima',
    'Bisma',
    'Drupadi',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}