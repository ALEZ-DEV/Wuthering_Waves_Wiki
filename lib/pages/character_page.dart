import 'package:flutter/material.dart';

import '../utils.dart';
import './../models/character.dart';
import './../widgets/video_player.dart';

import './base_page.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    required this.characterName,
    super.key,
  });

  static const route = '/characters/:name';

  final String? characterName;

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  bool hasLoad = false;
  bool loading = false;
  bool hasFailed = false;
  late Character character;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (!hasLoad && widget.characterName != null) {
      loading = true;
      try {
        character = await Character.loadFromName(widget.characterName!);
      } catch (e) {
        hasFailed = true;
      }

      setState(() {
        loading = false;
      });
      hasLoad = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: widget.characterName == null
          ? const Center(
              child: SelectableText('Please enter a valid character name'),
            )
          : loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : hasFailed
                  ? const Center(
                      child: SelectableText(
                          'Failed to get info of the character, check the character name please'),
                    )
                  : Utils.isMobileDevice(context)
                      ? CharacterPageMobile(character: character)
                      : CharacterPageDesktop(character: character),
    );
  }
}

class CharacterPageDesktop extends StatelessWidget {
  const CharacterPageDesktop({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: SelectableText(
            character.name,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      character.getImagePathOf(
                        character.presentation_img,
                      ),
                    ),
                    fit: MediaQuery.of(context).size.width > 1400
                        ? BoxFit.fitHeight
                        : BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 3,
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: SelectableText(
                    'Add any info here',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
        SelectableText(
          'Video demo',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.start,
        ),
        const Divider(),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 150.0, vertical: 20.0),
          child: VideoPlayer(
            url: character.videoDemoUrl,
          ),
        ),
      ],
    );
  }
}

class CharacterPageMobile extends StatelessWidget {
  const CharacterPageMobile({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectableText(
          character.name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Divider(),
      ],
    );
  }
}
