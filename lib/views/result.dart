import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nationality/views/home.dart';
import 'package:sizer/sizer.dart';

class Result extends StatefulWidget {
  const Result({
    Key key,
    this.data,
  }) : super(key: key);
  final data;
  @override
  _ResultState createState() => _ResultState();
}

Map countryMap = {
  "BD": "Bangladesh",
  "BE": "Belgium",
  "BF": "Burkina Faso",
  "BG": "Bulgaria",
  "BA": "Bosnia and Herzegovina",
  "BB": "Barbados",
  "WF": "Wallis and Futuna",
  "BL": "Saint Barthelemy",
  "BM": "Bermuda",
  "BN": "Brunei",
  "BO": "Bolivia",
  "BH": "Bahrain",
  "BI": "Burundi",
  "BJ": "Benin",
  "BT": "Bhutan",
  "JM": "Jamaica",
  "BV": "Bouvet Island",
  "BW": "Botswana",
  "WS": "Samoa",
  "BQ": "Bonaire, Saint Eustatius and Saba ",
  "BR": "Brazil",
  "BS": "Bahamas",
  "JE": "Jersey",
  "BY": "Belarus",
  "BZ": "Belize",
  "RU": "Russia",
  "RW": "Rwanda",
  "RS": "Serbia",
  "TL": "East Timor",
  "RE": "Reunion",
  "TM": "Turkmenistan",
  "TJ": "Tajikistan",
  "RO": "Romania",
  "TK": "Tokelau",
  "GW": "Guinea-Bissau",
  "GU": "Guam",
  "GT": "Guatemala",
  "GS": "South Georgia and the South Sandwich Islands",
  "GR": "Greece",
  "GQ": "Equatorial Guinea",
  "GP": "Guadeloupe",
  "JP": "Japan",
  "GY": "Guyana",
  "GG": "Guernsey",
  "GF": "French Guiana",
  "GE": "Georgia",
  "GD": "Grenada",
  "GB": "United Kingdom",
  "GA": "Gabon",
  "SV": "El Salvador",
  "GN": "Guinea",
  "GM": "Gambia",
  "GL": "Greenland",
  "GI": "Gibraltar",
  "GH": "Ghana",
  "OM": "Oman",
  "TN": "Tunisia",
  "JO": "Jordan",
  "HR": "Croatia",
  "HT": "Haiti",
  "HU": "Hungary",
  "HK": "Hong Kong",
  "HN": "Honduras",
  "HM": "Heard Island and McDonald Islands",
  "VE": "Venezuela",
  "PR": "Puerto Rico",
  "PS": "Palestinian Territory",
  "PW": "Palau",
  "PT": "Portugal",
  "SJ": "Svalbard and Jan Mayen",
  "PY": "Paraguay",
  "IQ": "Iraq",
  "PA": "Panama",
  "PF": "French Polynesia",
  "PG": "Papua New Guinea",
  "PE": "Peru",
  "PK": "Pakistan",
  "PH": "Philippines",
  "PN": "Pitcairn",
  "PL": "Poland",
  "PM": "Saint Pierre and Miquelon",
  "ZM": "Zambia",
  "EH": "Western Sahara",
  "EE": "Estonia",
  "EG": "Egypt",
  "ZA": "South Africa",
  "EC": "Ecuador",
  "IT": "Italy",
  "VN": "Vietnam",
  "SB": "Solomon Islands",
  "ET": "Ethiopia",
  "SO": "Somalia",
  "ZW": "Zimbabwe",
  "SA": "Saudi Arabia",
  "ES": "Spain",
  "ER": "Eritrea",
  "ME": "Montenegro",
  "MD": "Moldova",
  "MG": "Madagascar",
  "MF": "Saint Martin",
  "MA": "Morocco",
  "MC": "Monaco",
  "UZ": "Uzbekistan",
  "MM": "Myanmar",
  "ML": "Mali",
  "MO": "Macao",
  "MN": "Mongolia",
  "MH": "Marshall Islands",
  "MK": "Macedonia",
  "MU": "Mauritius",
  "MT": "Malta",
  "MW": "Malawi",
  "MV": "Maldives",
  "MQ": "Martinique",
  "MP": "Northern Mariana Islands",
  "MS": "Montserrat",
  "MR": "Mauritania",
  "IM": "Isle of Man",
  "UG": "Uganda",
  "TZ": "Tanzania",
  "MY": "Malaysia",
  "MX": "Mexico",
  "IL": "Israel",
  "FR": "France",
  "IO": "British Indian Ocean Territory",
  "SH": "Saint Helena",
  "FI": "Finland",
  "FJ": "Fiji",
  "FK": "Falkland Islands",
  "FM": "Micronesia",
  "FO": "Faroe Islands",
  "NI": "Nicaragua",
  "NL": "Netherlands",
  "NO": "Norway",
  "NA": "Namibia",
  "VU": "Vanuatu",
  "NC": "New Caledonia",
  "NE": "Niger",
  "NF": "Norfolk Island",
  "NG": "Nigeria",
  "NZ": "New Zealand",
  "NP": "Nepal",
  "NR": "Nauru",
  "NU": "Niue",
  "CK": "Cook Islands",
  "XK": "Kosovo",
  "CI": "Ivory Coast",
  "CH": "Switzerland",
  "CO": "Colombia",
  "CN": "China",
  "CM": "Cameroon",
  "CL": "Chile",
  "CC": "Cocos Islands",
  "CA": "Canada",
  "CG": "Republic of the Congo",
  "CF": "Central African Republic",
  "CD": "Democratic Republic of the Congo",
  "CZ": "Czech Republic",
  "CY": "Cyprus",
  "CX": "Christmas Island",
  "CR": "Costa Rica",
  "CW": "Curacao",
  "CV": "Cape Verde",
  "CU": "Cuba",
  "SZ": "Swaziland",
  "SY": "Syria",
  "SX": "Sint Maarten",
  "KG": "Kyrgyzstan",
  "KE": "Kenya",
  "SS": "South Sudan",
  "SR": "Suriname",
  "KI": "Kiribati",
  "KH": "Cambodia",
  "KN": "Saint Kitts and Nevis",
  "KM": "Comoros",
  "ST": "Sao Tome and Principe",
  "SK": "Slovakia",
  "KR": "South Korea",
  "SI": "Slovenia",
  "KP": "North Korea",
  "KW": "Kuwait",
  "SN": "Senegal",
  "SM": "San Marino",
  "SL": "Sierra Leone",
  "SC": "Seychelles",
  "KZ": "Kazakhstan",
  "KY": "Cayman Islands",
  "SG": "Singapore",
  "SE": "Sweden",
  "SD": "Sudan",
  "DO": "Dominican Republic",
  "DM": "Dominica",
  "DJ": "Djibouti",
  "DK": "Denmark",
  "VG": "British Virgin Islands",
  "DE": "Germany",
  "YE": "Yemen",
  "DZ": "Algeria",
  "US": "United States",
  "UY": "Uruguay",
  "YT": "Mayotte",
  "UM": "United States Minor Outlying Islands",
  "LB": "Lebanon",
  "LC": "Saint Lucia",
  "LA": "Laos",
  "TV": "Tuvalu",
  "TW": "Taiwan",
  "TT": "Trinidad and Tobago",
  "TR": "Turkey",
  "LK": "Sri Lanka",
  "LI": "Liechtenstein",
  "LV": "Latvia",
  "TO": "Tonga",
  "LT": "Lithuania",
  "LU": "Luxembourg",
  "LR": "Liberia",
  "LS": "Lesotho",
  "TH": "Thailand",
  "TF": "French Southern Territories",
  "TG": "Togo",
  "TD": "Chad",
  "TC": "Turks and Caicos Islands",
  "LY": "Libya",
  "VA": "Vatican",
  "VC": "Saint Vincent and the Grenadines",
  "AE": "United Arab Emirates",
  "AD": "Andorra",
  "AG": "Antigua and Barbuda",
  "AF": "Afghanistan",
  "AI": "Anguilla",
  "VI": "U.S. Virgin Islands",
  "IS": "Iceland",
  "IR": "Iran",
  "AM": "Armenia",
  "AL": "Albania",
  "AO": "Angola",
  "AQ": "Antarctica",
  "AS": "American Samoa",
  "AR": "Argentina",
  "AU": "Australia",
  "AT": "Austria",
  "AW": "Aruba",
  "IN": "India",
  "AX": "Aland Islands",
  "AZ": "Azerbaijan",
  "IE": "Ireland",
  "ID": "Indonesia",
  "UA": "Ukraine",
  "QA": "Qatar",
  "MZ": "Mozambique"
};

class _ResultState extends State<Result> {
  var info;
  List country = [];
  List probability = [];
  List countryName = [];
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  getData() async{

    setState(() {
      info = widget.data;
      info['country'].forEach((element) {
        print(element['country_id']);
        country.add(element['country_id']);
        print(element['probability']);
        probability.add(element['probability']);
        countryName.add(countryMap[element['country_id']]);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ),
        body: countryName.isEmpty ? Container(
          child: ListView(
            children: [
              Lottie.asset('assets/home/l2.json', animate: true, repeat: true) ,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Please enter other names, AI can't predict your name",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.grey
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
                  child: Container(

                    width: MediaQuery.of(context).size.width/1.3,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          colors: [
                            Colors.red[300],
                            Colors.red[400],
                            Colors.red,
                            Colors.red[600],
                            Colors.red[700],
                          ]
                      ),

                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Check more names',
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Make sure your entered only first name",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
            ],
          ),
        ) : Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Results", style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: countryName.length,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: ListTile(
                          leading: Image.asset('icons/flags/png/${country[index].toString().toLowerCase()}.png', package: 'country_icons'),
                          title: Text("${countryName[index]}", style: GoogleFonts.poppins()),
                          trailing: Text('${(probability[index] * 100).toStringAsFixed(2)}%', style: GoogleFonts.poppins())
                      ),
                    );
                  }
              ),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
                child: Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                          colors: [
                            Colors.red[300],
                            Colors.red[400],
                            Colors.red,
                            Colors.red[600],
                            Colors.red[700],
                          ]
                      ),

                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Check more names',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
