import 'package:sizer/sizer.dart';
import '../../../../core/constant/colory.dart';
import '../../../../lang/locale_keys.g.dart';
import '../widget/home_list.dart';
import '../widget/welcome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../manager/home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int _selected = 0;
  late TabController _controller;

  final List<String> _tabs = [
    LocaleKeys.allOrders.tr(),
    LocaleKeys.waitingOrder.tr(),
    LocaleKeys.onDelivered.tr(),
    LocaleKeys.delivered.tr(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: _selected,
    );
    _controller.addListener(() {
      setState(() {
        _selected = _controller.index;
      });
    });
    context.read<HomeCubit>().getOrders(null);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeCubit>();
    return NestedScrollView(
      headerSliverBuilder: (_, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: WelcomeAppBar(
              title:
                  "${context.tr(LocaleKeys.hey)}, ${read.getUser()?.name} 👋",
            ),
          ),
          PinnedHeaderSliver(
            child: Material(
              child: TabBar(
                isScrollable: true,
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.w),
                controller: _controller,
                onTap: (val) async {
                  _selected = val;
                  await context
                      .read<HomeCubit>()
                      .getOrders(_selected == 0 ? null : _selected - 1);
                },
                indicator: ShapeDecoration(
                  shape: StadiumBorder(
                    side: BorderSide(
                      width: .3.w,
                      color: StatusColors.getColor(
                          _selected == 0 ? -1 : _selected - 1, 2),
                    ),
                  ),
                ),
                tabs: List.generate(
                  _tabs.length,
                  (i) => Tab(
                    child: Text(
                      _tabs[i],
                      style: TextStyle(
                        color: _selected == i
                            ? StatusColors.getColor(
                                _selected == 0 ? -1 : _selected - 1, 2)
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ];
      },
      body: RefreshIndicator(
        color: StatusColors.getColor(_selected == 0 ? -1 : _selected - 1, 2),
        onRefresh: () async {
          await context
              .read<HomeCubit>()
              .getOrders(_selected == 0 ? null : _selected - 1);
        },
        child: const HomeList(),
      ),
    );
  }
}
