import 'package:shared/shared.dart';

class QuantityDestroy extends StatefulWidget {
  const QuantityDestroy({super.key});

  @override
  State<QuantityDestroy> createState() => _QuantityDestroyState();
}

class _QuantityDestroyState extends State<QuantityDestroy> {
  int? _groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.colorPalette.greyF2F,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            context.appLocalization.disposeQuantityItem,
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          CounterWidget(maxQuantity: 1, onChanged: (value) {}),
          Row(
            children: [
              Text(
                "*",
                style: TextStyle(
                  color: context.colorPalette.redC10,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                context.appLocalization.reasonForDisposal,
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CustomRadio(
                value: 0,
                title: context.appLocalization.damaged,
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                  });
                },
              ),
              CustomRadio(
                value: 1,
                title: context.appLocalization.poorTransportationOrStorage,
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              context.appLocalization.explanationsNotesAboutDisposal,
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BaseEditor(
              onChanged: (value) {},
              filled: true,
              fillColor: Colors.transparent,
              maxLines: 4,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorPalette.greyBDB),
                borderRadius: BorderRadius.circular(kRadiusSecondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorPalette.greyBDB),
                borderRadius: BorderRadius.circular(kRadiusSecondary),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              context.appLocalization.mustImageClarifyReasonDisposing,
              style: TextStyle(
                color: context.colorPalette.grey666,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ImagesAttacher(onChanged: (path) {}, title: context.appLocalization.attachImageOfMaterialsDisposed),
          const Spacer(),
          StretchedButton(
            onPressed: () {},
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              context.appLocalization.add,
              style: TextStyle(
                color: context.colorPalette.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
