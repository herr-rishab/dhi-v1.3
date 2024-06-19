import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'gk1k58m2': {
      'en': 'स्वागतम्',
      'hi': '',
    },
    'ueypzecp': {
      'en': 'Ask',
      'hi': '',
    },
    'llveq4bf': {
      'en': 'knowledge snacks',
      'hi': '',
    },
    'vlwu8txm': {
      'en': 'scroll >>',
      'hi': '',
    },
    '3saf7tai': {
      'en': 'daily wisdom',
      'hi': '',
    },
    'vgqmz99t': {
      'en': 'recent updates',
      'hi': '',
    },
    'a41lxuti': {
      'en': 'view all',
      'hi': '',
    },
    'erm3na8n': {
      'en': 'PM-KISAN e-KYC deadline today!',
      'hi': '',
    },
    'vr646834': {
      'en':
          'The government has set a deadline for farmers and beneficiary of the PM-KISAN scheme to complete their e-KYC process.',
      'hi': '',
    },
    '2fiwfmfl': {
      'en': 'Mint',
      'hi': '',
    },
    'm1k64e8a': {
      'en': '2 hours ago',
      'hi': '',
    },
    '8v935e60': {
      'en': 'Infrastructure boost in healthcare',
      'hi': '',
    },
    'vjyhz6p4': {
      'en':
          'Healthcare sector advocates for innovation, infrastructure boost, and NCD Focus in Budget 2024-25',
      'hi': '',
    },
    'sueqkvdg': {
      'en': 'Business Today',
      'hi': '',
    },
    'wevrdaq7': {
      'en': '3 hours ago',
      'hi': '',
    },
    '5f4y3u40': {
      'en': 'Home',
      'hi': '',
    },
  },
  // news1
  {
    '4n0zzxdz': {
      'en': 'PM-KISAN e-KYC deadline today!',
      'hi': '',
    },
    'u2rmc56m': {
      'en': 'Mint',
      'hi': '',
    },
    'k55hzerv': {
      'en': '2 hours ago',
      'hi': '',
    },
    '1h13cxgf': {
      'en':
          'The Rajasthan government has set a deadline of January 31, 2024, for farmers and beneficiaries of the Pradhan Mantri Kisan Samman Nidhi (PM-KISAN) Yojana to complete their e-Know Your Customer (e-KYC) process. Failure to comply may result in the termination of eligibility and suspension of the 16th instalment payment under the scheme. This directive applies nationwide to all PM-KISAN beneficiaries, aiming to streamline the disbursement process and ensure efficient delivery of benefits.\n\nThe PM-KISAN scheme provides income support to all landholding farmers\' families across India, offering an annual financial benefit of ₹6,000 in three equal instalments of ₹2,000 each. By completing the e-KYC process, farmers and beneficiaries can verify their identity and eligibility, enabling accurate and targeted disbursement of financial benefits. There are three modes of e-KYC available, including OTP-based, biometric-based, and face authentication-based, ensuring accessibility for all beneficiaries.',
      'hi': '',
    },
    'tclgdz47': {
      'en': 'Home',
      'hi': '',
    },
  },
  // news2
  {
    '4zxryf2r': {
      'en': 'Infrastructure boost in healthcare',
      'hi': '',
    },
    'nzdwgr00': {
      'en': 'Business Today',
      'hi': '',
    },
    'hd32vykg': {
      'en': '3 hours ago',
      'hi': '',
    },
    'y8hgqsv7': {
      'en':
          'The healthcare sector in India is urging the government to prioritize research and development, infrastructure upgrades, and tackling non-communicable diseases (NCDs) in the Interim Budget 2024-25. With current healthcare spending at 1.8% of GDP, well below the global average, experts suggest increasing allocations to 2.5% of GDP to bridge the gap and ensure universal healthcare accessibility.\n\nRising NCDs pose a significant threat to India\'s healthcare system, contributing to over 70% of deaths in the country. Urgent measures are needed to address this challenge, including increased funding for public health programs, screening initiatives, and preventative care aligned with the National Health Mission\'s objectives.',
      'hi': '',
    },
    '64w4qfj6': {
      'en': 'Home',
      'hi': '',
    },
  },
  // news3
  {
    '5aw2eajb': {
      'en': 'Every farmer gets annual benefit of Rs 50,000',
      'hi': '',
    },
    'e4etg5oc': {
      'en': 'The Indian Express',
      'hi': '',
    },
    '49zfyi9o': {
      'en': '4 hours ago',
      'hi': '',
    },
    'ei8a4gb0': {
      'en':
          'Prime Minister Narendra Modi reassured the nation of the government\'s unwavering support for the agricultural sector, emphasizing an annual allocation of Rs 6.5 lakh crore. Through various initiatives, every farmer stands to benefit with Rs 50,000 annually, a commitment labeled as \"Modi\'s guarantee.\" These efforts, including fertilizer subsidies, MSP procurement, and the PM-KISAN scheme, underscore the government\'s resolve to transform the lives of farmers and enhance agricultural sustainability.\n\nModi\'s address also underscored the pivotal role of cooperatives in India\'s journey towards self-reliance. He called upon these entities to embrace transparency, shun politics, and leverage digital tools for efficient governance. The Prime Minister\'s vision includes cooperatives as key players in bolstering production of essential commodities, reducing import dependencies, and driving economic growth. With a separate ministry and enhanced support, the government aims to empower cooperatives, fostering a cooperative-driven model for a developed India by 2047.',
      'hi': '',
    },
    'bvbyk0n8': {
      'en': 'Home',
      'hi': '',
    },
  },
  // allNews
  {
    '2i01rx2b': {
      'en': 'Mint',
      'hi': '',
    },
    'c79828ru': {
      'en': 'PM-KISAN e-KYC deadline today!',
      'hi': '',
    },
    '7jb3ke9v': {
      'en': '2 hours ago',
      'hi': '',
    },
    'vmb5o864': {
      'en': 'Business Today',
      'hi': '',
    },
    'n32f6soi': {
      'en': 'Infrastructure boost in healthcare',
      'hi': '',
    },
    'i0xa2jqi': {
      'en': '3 hours ago',
      'hi': '',
    },
    'x2p6wwmt': {
      'en': 'The Indian Express',
      'hi': '',
    },
    'xg16wgx5': {
      'en': 'Every farmer gets annual benefit of Rs 50,000',
      'hi': '',
    },
    'bnoen9t7': {
      'en': '4 hours ago',
      'hi': '',
    },
    '7ry23qm6': {
      'en': 'recent news',
      'hi': '',
    },
    'prght0wi': {
      'en': 'Home',
      'hi': '',
    },
  },
  // LoginPage
  {
    '11c627p8': {
      'en': 'Language',
      'hi': '',
    },
    'myrdi1rf': {
      'en': 'Welcome Back',
      'hi': '',
    },
    'rq24efod': {
      'en': 'Sign in by filling out the details below.',
      'hi': '',
    },
    'mgaasjfr': {
      'en': 'Email ID',
      'hi': '',
    },
    'hxqvhfuq': {
      'en': 'Password',
      'hi': '',
    },
    '989yhgyd': {
      'en': 'Login',
      'hi': '',
    },
    'vkxgeb2y': {
      'en': 'Don\'t have an account? ',
      'hi': '',
    },
    'liyg3vp4': {
      'en': ' Sign up',
      'hi': '',
    },
    'e0twr5l6': {
      'en': 'Home',
      'hi': '',
    },
  },
  // CreateAccount
  {
    '6bdgsk70': {
      'en': 'Language',
      'hi': '',
    },
    'z7abu6me': {
      'en': 'Create an account',
      'hi': '',
    },
    '5sngzefg': {
      'en': 'Let\'s get started by filling out the details below.',
      'hi': '',
    },
    '5s9kw3fh': {
      'en': 'Email ID',
      'hi': '',
    },
    'te8tagev': {
      'en': 'Password',
      'hi': '',
    },
    'qc8g3oiv': {
      'en': 'Confirm Password',
      'hi': '',
    },
    'oqxjp7mf': {
      'en': 'Create Account',
      'hi': '',
    },
    '42vi4322': {
      'en': 'Already have an account? ',
      'hi': '',
    },
    '47xlw9t0': {
      'en': ' Sign in',
      'hi': '',
    },
    '63e1w5vr': {
      'en': 'Home',
      'hi': '',
    },
  },
  // CompleteProfile
  {
    'b2k6r9d0': {
      'en': 'Complete Profile',
      'hi': '',
    },
    'qcv4ptgt': {
      'en': 'Please fill up your profile details',
      'hi': '',
    },
    '4sks48bh': {
      'en': 'First Name',
      'hi': '',
    },
    '1tl5d27g': {
      'en': 'Age',
      'hi': '',
    },
    '9hulv5un': {
      'en': 'Phone Number',
      'hi': '',
    },
    '9qurxqu3': {
      'en': 'Occupation',
      'hi': '',
    },
    'r6uze9oc': {
      'en': 'City',
      'hi': '',
    },
    'x46zjt2y': {
      'en': 'Andhra Pradesh',
      'hi': '',
    },
    '71sjh881': {
      'en': 'Arunachal Pradesh',
      'hi': '',
    },
    'ntpfua55': {
      'en': 'Assam',
      'hi': '',
    },
    'hi23tc6h': {
      'en': 'Bihar',
      'hi': '',
    },
    'jivu60wj': {
      'en': 'Chhattisgarh',
      'hi': '',
    },
    'z2p0nm5c': {
      'en': 'Goa',
      'hi': '',
    },
    'pg6svc9v': {
      'en': 'Gujarat',
      'hi': '',
    },
    'tarmagxc': {
      'en': 'Haryana',
      'hi': '',
    },
    'q5ncwbd6': {
      'en': 'Himachal Pradesh',
      'hi': '',
    },
    '81d76oio': {
      'en': 'Jharkhand',
      'hi': '',
    },
    'qwhjzr6n': {
      'en': 'Karnataka',
      'hi': '',
    },
    'q1ecs8zw': {
      'en': 'Kerala',
      'hi': '',
    },
    'fki5r98s': {
      'en': 'Madhya Pradesh',
      'hi': '',
    },
    'kxzq5fh1': {
      'en': 'Maharashtra',
      'hi': '',
    },
    '6y2o4kgg': {
      'en': 'Manipur',
      'hi': '',
    },
    'ijptw3qv': {
      'en': 'Meghalaya',
      'hi': '',
    },
    '4ponb305': {
      'en': 'Mizoram',
      'hi': '',
    },
    'eh06etp0': {
      'en': 'Nagaland',
      'hi': '',
    },
    '6dj3okxg': {
      'en': 'Odisha',
      'hi': '',
    },
    'y5glaiq3': {
      'en': 'Punjab',
      'hi': '',
    },
    'e3xtmbug': {
      'en': 'Rajasthan',
      'hi': '',
    },
    '9lcw0rw9': {
      'en': 'Sikkim',
      'hi': '',
    },
    'z2tk33ej': {
      'en': 'Tamil Nadu',
      'hi': '',
    },
    'mk073czt': {
      'en': 'Telangana',
      'hi': '',
    },
    'ima4yftw': {
      'en': 'Tripura',
      'hi': '',
    },
    'n2gjceg9': {
      'en': 'Uttar Pradesh',
      'hi': '',
    },
    'qc092nnu': {
      'en': 'Uttarakhand',
      'hi': '',
    },
    'zs6mog6s': {
      'en': 'West Bengal',
      'hi': '',
    },
    '6vw6vn6u': {
      'en': 'Please select state',
      'hi': '',
    },
    '8i69psn6': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '7gdpcd7c': {
      'en': 'Complete Profile',
      'hi': '',
    },
    'jovbaap6': {
      'en': 'Home',
      'hi': '',
    },
  },
  // profile
  {
    'grlktiz5': {
      'en': 'Language',
      'hi': '',
    },
    't4pu2li2': {
      'en': 'Edit Profile',
      'hi': '',
    },
    'm266jn7a': {
      'en': 'Account Settings',
      'hi': '',
    },
    'i2youzr0': {
      'en': 'Log Out',
      'hi': '',
    },
    'qq2eb82l': {
      'en': '__',
      'hi': '',
    },
  },
  // shortVideo1
  {
    'i6qvanj3': {
      'en': 'short videos',
      'hi': '',
    },
    'qswx4szk': {
      'en': 'Sleep Tight India: Unlocking the Power of Restful Sleep',
      'hi': '',
    },
    'hwxlqqt0': {
      'en': '<< home',
      'hi': '',
    },
    'g2u4uuko': {
      'en': 'next >>',
      'hi': '',
    },
    'k6uq11yr': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Finance
  {
    'rgwvmwlm': {
      'en': 'Finance',
      'hi': '',
    },
    'llccam7b': {
      'en': 'Spends this Month',
      'hi': '',
    },
    'y9hhhvas': {
      'en': 'Monthly Budget',
      'hi': '',
    },
    'u4uv2a8s': {
      'en': '  out of  ',
      'hi': '',
    },
    'w1mjlhv6': {
      'en': 'Edit',
      'hi': '',
    },
    'z3ra092x': {
      'en': 'Food',
      'hi': '',
    },
    'u0yzajcy': {
      'en': 'Housing',
      'hi': '',
    },
    'ky6dfmdz': {
      'en': 'Utilities',
      'hi': '',
    },
    'imp1oza6': {
      'en': 'Others',
      'hi': '',
    },
    'o82zu4z9': {
      'en': 'manage spends >>',
      'hi': '',
    },
    'b1rvklpi': {
      'en': 'expert insights',
      'hi': '',
    },
    '5uvy8f08': {
      'en': 'Healthcare',
      'hi': '',
    },
  },
  // editBudget
  {
    'wdym018n': {
      'en': 'edit budget',
      'hi': '',
    },
    '39plt8x5': {
      'en': 'Please enter your new budget',
      'hi': '',
    },
    '7bg5ts0b': {
      'en': 'Amount',
      'hi': '',
    },
    '8uh9iwz9': {
      'en': 'Set Budget',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'dl4o7psg': {
      'en': '',
      'hi': '',
    },
    'b4dhf68i': {
      'en': '',
      'hi': '',
    },
    'g43ddqqe': {
      'en': '',
      'hi': '',
    },
    'c8n232lm': {
      'en': '',
      'hi': '',
    },
    '5d8v98pm': {
      'en': '',
      'hi': '',
    },
    'hb1ijo4e': {
      'en': '',
      'hi': '',
    },
    'cax72pck': {
      'en': '',
      'hi': '',
    },
    'wot2a8i7': {
      'en': '',
      'hi': '',
    },
    'mymi0aon': {
      'en': '',
      'hi': '',
    },
    '4btsc1s7': {
      'en': '',
      'hi': '',
    },
    '6112zfsp': {
      'en': '',
      'hi': '',
    },
    'rqr66a2n': {
      'en': '',
      'hi': '',
    },
    '36msdupi': {
      'en': '',
      'hi': '',
    },
    'xzdt9gnk': {
      'en': '',
      'hi': '',
    },
    'y024dl48': {
      'en': '',
      'hi': '',
    },
    'keaal1z2': {
      'en': '',
      'hi': '',
    },
    'of5aplmt': {
      'en': '',
      'hi': '',
    },
    'srmbz2k2': {
      'en': '',
      'hi': '',
    },
    'fi2io6t2': {
      'en': '',
      'hi': '',
    },
    '9qjfgv6d': {
      'en': '',
      'hi': '',
    },
    'ewl5lm7r': {
      'en': '',
      'hi': '',
    },
    'mlshit2h': {
      'en': '',
      'hi': '',
    },
    '58kicz74': {
      'en': '',
      'hi': '',
    },
    'zwn8byc6': {
      'en': '',
      'hi': '',
    },
    'kov3xhas': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
