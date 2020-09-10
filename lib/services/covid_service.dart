import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/country.dart';
import '../models/country_summary.dart';
import '../models/global_summary.dart';


class CovidService{

  Future<List<GlobalSummaryModel>> getGlobalSummary() async{
    final data = await http.Client().get("https://api.covid19api.com/total/dayone/country/peru");
    
    if(data.statusCode != 200)
      throw Exception();
      
  
    List<GlobalSummaryModel> summaryList = (json.decode(data.body) as List).map((item) => new GlobalSummaryModel.fromJson(item)).toList();
    
    return summaryList;
  }

  Future<List<CountrySummaryModel>> getCountrySummary(String slug) async{
    final data = await http.Client().get("https://api.covid19api.com/total/dayone/country/" + slug);
    
    if(data.statusCode != 200)
      throw Exception();

    List<CountrySummaryModel> summaryList = (json.decode(data.body) as List).map((item) => new CountrySummaryModel.fromJson(item)).toList();
    
    return summaryList;
  }

  Future<List<CountryModel>> getCountryList() async{
    final data = await http.Client().get("https://api.covid19api.com/countries");
    
    if(data.statusCode != 200)
      throw Exception();

    List<CountryModel> countries = (json.decode(data.body) as List).map((item) => new CountryModel.fromJson(item)).toList();
    
    return countries;
  }

}