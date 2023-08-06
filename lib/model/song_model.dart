class Songs{
  final String title;
  final String artist;
  final String cover;

  Songs({
    required this.title,
    required this.artist,
    required this.cover
  });

  static List<Songs> songsList = [
    Songs(
        title: 'Spring Day',
        artist: 'BTS',
        cover: 'proof.jpg'),
    Songs(
        title: 'Summertime Sadness',
        artist: 'Lana Del Rey',
        cover: 'btd.jpg'),
    Songs(
        title: 'Life Goes On',
        artist: 'BTS',
        cover: 'be.jpg'),
    Songs(
        title: 'Louder Than Bombs',
        artist: 'BTS',
        cover: 'm.jpg'),
    Songs(
        title: 'Hurt',
        artist: 'NewJeans',
        cover: 'nwjns.jpg'),
    Songs(
        title: 'The Truth UnTold ',
        artist: 'BTS',
        cover: 'ly.jpg'),
    Songs(
        title: 'Life Goes On',
        artist: 'BTS',
        cover: 'be.jpg'),
    Songs(
        title: 'Young And Beautiful',
        artist: 'Lana Del Rey',
        cover: 'yab.jpg'),
  ];
}