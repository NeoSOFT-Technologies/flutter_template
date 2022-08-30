/// A data transformer interface which is used to enable entity transformation between layers.
/// transform() function can be used to convert data type <F> to <T>
/// restore() function can be used convert <T> back to <F>
abstract class LayerDataTransformer<F, T> {
  T transform();

  F restore(T data);
}
