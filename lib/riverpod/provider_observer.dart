import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {

  //1. provider를 업데이트하면 호출됨
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print('[Provider Updated] provider: $provider / prev: $previousValue / new: $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  //2. provider를 추가하면 호출됨
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    print('[Provider Added] provider: $provider / value: $value');
    super.didAddProvider(provider, value, container);
  }

  //3. provider가 삭제되었을 때 호출됨
  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    print('[Provider Disposed] provider: $provider');
    super.didDisposeProvider(provider, container);
  }
}
