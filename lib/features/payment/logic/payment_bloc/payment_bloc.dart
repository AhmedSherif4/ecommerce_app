part of '../../payment.dart';

@Injectable()
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final CreateOrderUseCase createOrderUseCase;
  final CreatePaymentUseCase createPaymentUseCase;
  final InitiatePaymentUseCase initiatePaymentUseCase;
  final GetUserOrdersUseCase getUserOrdersUseCase;
  final PaymentBaseRepository _repository;

  PaymentBloc(
    this.createOrderUseCase,
    this.createPaymentUseCase,
    this.initiatePaymentUseCase,
    this.getUserOrdersUseCase,
    this._repository,
  ) : super(const PaymentState()) {
    on<CreateOrderEvent>(_createOrder);
    on<CreatePaymentEvent>(_createPayment);
    on<InitiatePaymentEvent>(_initiatePayment);
    on<GetUserOrdersEvent>(_getUserOrders);
    on<LoadCartProductsEvent>(_loadCartProducts);

    on<AddProductToCartEvent>(_addProductToCart);

    on<RemoveProductFromCartEvent>(_removeProductFromCart);

    on<ClearCartEvent>(_clearCart);
    on<IsProductInCartEvent>(_isProductInCart);
    on<UpdateCartQuantityEvent>(_updateCartQuantity);
  }

  void _createOrder(CreateOrderEvent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(createOrderState: RequestStates.loading));

    final result = await createOrderUseCase(event.createOrderRequest);

    result.fold(
      (failure) => emit(
        state.copyWith(
          createOrderState: RequestStates.error,
          createOrderMessage: failure.message,
        ),
      ),
      (entity) {
        entity.log();
        return emit(
          state.copyWith(
            createOrderState: RequestStates.loaded,
            createOrderEntity: entity,
            createOrderMessage: 'Order created successfully',
          ),
        );
      },
    );
  }

  void _createPayment(
    CreatePaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(createPaymentState: RequestStates.loading));

    final result = await createPaymentUseCase(event.createPaymentRequest);

    result.fold(
      (failure) => emit(
        state.copyWith(
          createPaymentState: RequestStates.error,
          createPaymentMessage: failure.message,
        ),
      ),
      (entity) {
        return emit(
          state.copyWith(
            createPaymentState: RequestStates.loaded,
            paymentEntity: entity,
            createPaymentMessage: 'Payment created successfully',
          ),
        );
      },
    );
  }

  void _initiatePayment(
    InitiatePaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(initiatePaymentState: RequestStates.loading));

    final result = await initiatePaymentUseCase(event.initiatePaymentRequest);

    result.fold(
      (failure) => emit(
        state.copyWith(
          initiatePaymentState: RequestStates.error,
          initiatePaymentMessage: failure.message,
        ),
      ),
      (entity) {
        return emit(
          state.copyWith(
            initiatePaymentState: RequestStates.loaded,
            initiatePaymentEntity: entity,
            initiatePaymentMessage: 'Payment initiated successfully',
          ),
        );
      },
    );
  }

  void _getUserOrders(
    GetUserOrdersEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(getUserOrdersState: RequestStates.loading));

    final result = await getUserOrdersUseCase(event.getUserOrdersRequest);

    result.fold(
      (failure) => emit(
        state.copyWith(
          getUserOrdersState: RequestStates.error,
          getUserOrdersMessage: failure.message,
        ),
      ),
      (orders) {
        return emit(
          state.copyWith(
            getUserOrdersState: RequestStates.loaded,
            userOrders: orders,
            getUserOrdersMessage: 'Orders retrieved successfully',
          ),
        );
      },
    );
  }

  FutureOr<void> _loadCartProducts(event, emit) async {
    try {
      final products = await _repository.getProductsCart();
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.loaded,
          localProductsCart: products,
        ),
      );
    } catch (e) {
      e.toString().log();
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.error,
          localProductsCartMessage: 'Failed to load cart',
        ),
      );
    }
  }

  FutureOr<void> _addProductToCart(event, emit) async {
    try {
      await _repository.saveProductAtCart(event.product);
      add(const LoadCartProductsEvent());
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.loaded,
          isProductInCart: true,
        ),
      );
    } catch (e) {
      e.toString().log();
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.error,
          localProductsCartMessage: 'Failed to add product',
        ),
      );
    }
  }

  FutureOr<void> _removeProductFromCart(event, emit) async {
    try {
      await _repository.removeProductFromCart(event.product);
      add(const LoadCartProductsEvent());
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.loaded,
          isProductInCart: false,
        ),
      );
    } catch (e) {
      e.toString().log();
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.error,
          localProductsCartMessage: 'Failed to remove product',
        ),
      );
    }
  }

  FutureOr<void> _clearCart(event, emit) async {
    try {
      await _repository.clearProductsCart();
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.loaded,
          localProductsCart: [],
        ),
      );
    } catch (e) {
      e.toString().log();
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.error,
          localProductsCartMessage: 'Failed to clear cart',
        ),
      );
    }
  }

  FutureOr<void> _isProductInCart(
    IsProductInCartEvent event,
    Emitter<PaymentState> emit,
  ) async {
    try {
      final result = await _repository.isProductInCart(event.productId);
      emit(state.copyWith(isProductInCart: result));
      'result: $result'.log();
      'isProductInCart: ${state.isProductInCart}'.log();
    } catch (e) {
      e.toString().log();
      "there's error at Is Product In Cart Function".log();
      emit(state.copyWith(isProductInCart: false));
    }
  }

  FutureOr<void> _updateCartQuantity(
    UpdateCartQuantityEvent event,
    Emitter<PaymentState> emit,
  ) async {
    try {
      final products = await _repository.updateProductAtCart(
        event.cartItemRequest,
        event.index,
      );
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.loaded,
          localProductsCart: products,
        ),
      );
    } catch (e) {
      e.toString().log();
      emit(
        state.copyWith(
          localProductsCartState: RequestStates.error,
          localProductsCartMessage: 'Failed to load cart',
        ),
      );
    }
  }
}
