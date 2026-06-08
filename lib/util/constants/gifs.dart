class AppProductCodeForGif {
  static const sb = 'sb';
  static const ssc = 'ssc';
  static const sbk = 'sbk';
  static const sbj = 'sbj';
  static const sbb = 'sbb';
  static const dt = 'dt';
}

class AppProductGifs {
  static const String band = 'assets/gifs/band.gif';
  static const String card = 'assets/gifs/card.gif';
  static const String children = 'assets/gifs/children.gif';
  static const String toddler = 'assets/gifs/toddler.gif';
  static const String dt = 'assets/gifs/dt.gif';
}


class AppProductCodeForImage {  
  static const p = 'p';
  static const ss33 = 'ss33';
  static const ss35 = 'ss35';
  static const s = 's';
  static const ss = 'ss';
  static const sc = 'sc';
  static const c = 'c';
  static const cc = 'cc';
  static const tc = 'tc';
  static const t = 't';
  static const k = 'k';
  static const kc = 'kc';
  static const pc = 'pc';
  static const mc = 'mc';
  static const bc = 'bc';
  static const wb = 'wb';
  static const sb = 'sb';
  static const sk = 'sk';
  static const ssc = 'ssc';
  static const sbk = 'sbk';
}

class AppProductUrlsForImage {
  static const _baseUrl = 'https://addmee.app/uploads/devices';  
  static const p = '$_baseUrl/p.jpg';
  static const ss33 = '$_baseUrl/ss33.jpg';
  static const ss35 = '$_baseUrl/ss35.jpg';
  static const s = '$_baseUrl/ss.jpg';
  static const ss = '$_baseUrl/ss.jpg';
  static const sc = '$_baseUrl/sc.jpg';
  static const c = '$_baseUrl/cc.jpg';
  static const cc = '$_baseUrl/cc.jpg';
  static const tc = '$_baseUrl/tc.jpg';
  static const t = '$_baseUrl/tc.jpg';
  static const k = '$_baseUrl/k.jpg';
  static const kc = '$_baseUrl/k.jpg';
  static const pc = '$_baseUrl/pc.jpg';
  static const mc = '$_baseUrl/mc.jpg';
  static const bc = '$_baseUrl/bc.jpg';
  static const wb = '$_baseUrl/wb.jpg';
  static const sb = '$_baseUrl/sb.jpg';
  static const sk = '$_baseUrl/sk.jpg';
  static const ssc = '$_baseUrl/ssc.jpg';
  static const sbk = '$_baseUrl/sbk.jpg';
  static const td = '$_baseUrl/td.jpg';
  static const sbj = '$_baseUrl/sbj.jpg';
  static const sbb = '$_baseUrl/sc.jpg';
}

  String getGif(String productType) {
    return switch (productType) {
      AppProductCodeForGif.sb => AppProductGifs.band,
      AppProductCodeForGif.ssc => AppProductGifs.card,
      AppProductCodeForGif.sbk => AppProductGifs.toddler,
      AppProductCodeForGif.sbj => AppProductGifs.children,
      AppProductCodeForGif.sbb => AppProductGifs.toddler,
      AppProductCodeForGif.dt => AppProductGifs.dt,
      _ => AppProductGifs.toddler,
    };
  }

  String getUrl(String productType) {
    return switch (productType) {
      AppProductCodeForImage.p => AppProductUrlsForImage.p,      
      AppProductCodeForImage.ssc => AppProductUrlsForImage.ssc,
      AppProductCodeForImage.sbk => AppProductUrlsForImage.sbk,
      AppProductCodeForImage.ss33 => AppProductUrlsForImage.ss33,
      AppProductCodeForImage.ss35 => AppProductUrlsForImage.ss35,
      AppProductCodeForImage.s => AppProductUrlsForImage.s,
      AppProductCodeForImage.ss => AppProductUrlsForImage.ss,
      AppProductCodeForImage.sc => AppProductUrlsForImage.sc,
      AppProductCodeForImage.c => AppProductUrlsForImage.c,
      AppProductCodeForImage.cc => AppProductUrlsForImage.cc,
      AppProductCodeForImage.tc => AppProductUrlsForImage.tc,
      AppProductCodeForImage.t => AppProductUrlsForImage.t,
      AppProductCodeForImage.k => AppProductUrlsForImage.k,
      AppProductCodeForImage.kc => AppProductUrlsForImage.kc,
      AppProductCodeForImage.pc => AppProductUrlsForImage.pc,
      AppProductCodeForImage.mc => AppProductUrlsForImage.mc,
      AppProductCodeForImage.bc => AppProductUrlsForImage.bc,
      AppProductCodeForImage.wb => AppProductUrlsForImage.wb,
      AppProductCodeForImage.sb => AppProductUrlsForImage.sb,
      AppProductCodeForImage.sk => AppProductUrlsForImage.sk,      
      _ => AppProductUrlsForImage.td,            
    };
  }
