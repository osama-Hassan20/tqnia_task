import 'package:tqnia_task/core/utils/app_images.dart';

import '../../domain/models/on_bording_model.dart';

List<BoardingModel> welcome = [
  BoardingModel(
    image: AppAssets.welcome1,
    title: 'Examples',
    body: [
      '“Explain quantum computing in simple terms”',
      '“Got any creative ideas for a 10 year old’s birthday?”',
      '“How do I make an HTTP request in Javascript?”'
    ],
  ),
  BoardingModel(
    image: AppAssets.welcome2,
    title: 'Capabilities',
    body: [
      'Remembers what user said earlier in the conversation',
      'Allows user to provide follow-up corrections',
      'Trained to decline inappropriate requests'
    ],
  ),
  BoardingModel(
    image: AppAssets.welcome3,
    title: 'Limitations',
    body: [
      'May occasionally generate incorrect information',
      'May occasionally produce harmful instructions or biased content',
      'Limited knowledge of world and events after 2021'
    ],
  ),
];
