import 'dart:io';

/**
 * Created by IqbalMF on 2024.
 * Package helper
 */

String jsonReader(String name) => File('test/helper/$name').readAsStringSync();