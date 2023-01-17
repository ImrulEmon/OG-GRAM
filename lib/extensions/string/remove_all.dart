extension RemoveAll on String {
  String removeAll(Iterable<String> values) => values.fold(
        this,
        (reslult, value) => reslult.replaceAll(
          value,
          '',
        ),
      );
}
