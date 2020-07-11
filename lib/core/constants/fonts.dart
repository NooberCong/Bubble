const List<String> fonts = [
  "Bangers",
  "Cinzel",
  "Comfortaa",
  "DancingScript",
  "FredokaOne",
  "IndieFlower",
  "Orbitron",
  "Playfair",
  "Roboto",
  "Lobster",
  "Lemonada",
  "FiraMono",
  "PatrickHandSC"
];

double sizeForFont(String fontFamily) {
  switch (fontFamily) {
    case "Lemonada":
    case "Orbitron":
      return 15;
    case "DancingScript":
    case "IndieFlower":
      return 20;
    case "Lobster":
    case "PatrickHandSC":
      return 18;
    default:
      return 16;
  }
}
