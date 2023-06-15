import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/test.dart';
import 'package:gsheets/gsheets.dart';
import 'ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_demo/firebase_options.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//create credentials
const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "team14fluttergsheets",
  "private_key_id": "87e9371f69b0749552b5b8443e00c9c79c1529ed",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCISVBbI9NZBOIb\nq1iRU0HDckgeruFGhuE2ENzqN73YYlMwY7enkz2hRX+21yVGbWgN6qONL7V9y9KL\neO4cp8IPXWeYx5t5NT4qEOBqpjfabny7YDtZ00IpxJ3BTkUBoDrXdco1n1Wm7dt3\n2j03tTjfnPLlbdY6HVFQ0QnXLWvSMTqOxR6eGExY3MWCPnS7yFczhehho9drL5dl\nCaw2FspUoEjR+gWujQuZ51gNBO/Ul0+I2ocdjvGqfAFn1wdVoT6oLzwjBXrsA85i\nXpeqrHEjoJjl1kaG0ZUgYBJoo4xdYRh+2CwqrU7pPAXZtYcu5WhFU6Rg9EHPrnpd\nGmGhDhntAgMBAAECggEAFPtAeT+LNp23V64p7Pml2rqZ2stumCaEvoebEx3wxsLg\nbsczS4OyDcV+033M2cpXJilU85QAO3UpHVrJQbUb/bSSEeXNDDyDrQM7IYAkgibX\nYht/F6Wb/oUsCkoL+qOZ23jhYB7/FztwOcPp/80RC/AEPwkJXZoM3kXIX425FztO\ndLS+JispeRczfj1Li6ZJO5qYv3rw+osXKe+eINli3i6GN4GmQmgeq0ti71r5neUB\nwKf/Ubli11b07ynxy9+Tzw+0hSlQmF6QMIFZ1ufSUyqTgeD70gbS95VSZcplksE8\nFx2CJ4BX88sZerdGPVSCrL+ChcDRaT0QrAUnxUaqCwKBgQC97Rc8TDpmNSWBShnT\n73WDg316biymgHeWgRzY7kSezhfdCjWNun2aLUAMm5LTP5saElcGj6BFDUgcoXjU\n8+nnRbNGtU5o0VvM3UXYViyQJoexAF75pCR86YYZFerUJTsy7wSY2pIHFP32ZFYy\nafofAJxGBqDPCtVLX00ONGbVIwKBgQC3swq9asmsVWeBLeKWf4Ylh983B4ff88mu\n4miEQeih2bICgeGTxfk252s+bvLkf5r54hnmlgIldaOHC1Wo6nd5HU37HZD3fvbM\nzlJmCUpF0if5EzAwDIMtvtsKQbbYcGeXVAheoDV6ssL074/YY3fTns+RRQRLGNIU\n16vDSFvtrwKBgEj2gVunyTOkrTDbH8r8jj+kzxquoragWdDW7xcjifccI6zGFEbL\nYx9MzPNK/P/sypAchZQ+rwp4DMD7A2mD/tLbQwEh++pmq4arZv6yNFJ4it5jzxjG\nh0H5kIuokNtJJlHt4u054qmX1ezHJRoe/njUijSYrUR82+4lwXt4hBzTAoGAEmse\nOY26eM/7V8VtAZ/5qEuuQss7gWXlI+bJifE9zPSR15SENJfV+/5KD3F6YxS0Sje0\nVx1VS8I2yjSFuzD/F6KrjfER9u7A+hn5wwdNbiC7J0sYOskWYgDP34BlP+BNUqv3\nRt2TXyELURmv94dJnWs/7pXX71umvLY/H45iwTsCgYBqUUB9Q0GGc/ukogjd8ZWU\nzHdJYlJkPnnCZW6fR9VmVP31IF96LgR3FUmoP4rRS4v8414S9zFoZIK9JOqojtFD\nStAa98/Urb/ylW59xuYn8bKWN9j84rGejJ92w5VCUsSmIMNdVPeqVb8uSJsZvUFl\nd0TjF39w5K06oMdv9llboQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "team14-flutter-gsheets@team14fluttergsheets.iam.gserviceaccount.com",
  "client_id": "112956606859596799775",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/team14-flutter-gsheets%40team14fluttergsheets.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
// spreadsheet id
const _spreadsheetId = '1iwV5vIPly7Ts40JVTbDT5cxCouYqW8DP5j65bVwWRJE';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //init ggsheet
  final gsheets = GSheets(_credentials);
  //fetch spreadsheet by its id
  final ss = await gsheets.spreadsheet(_spreadsheetId);
  //get work sheet
  var sheet = ss.worksheetByTitle('my sheet');
  //update a cell
  await sheet!.values.insertValue('alo', column: 2, row: 1);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HLP Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness:
            themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: const Test(),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
    );
  }
}
