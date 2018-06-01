import {connect} from 'react-redux';
import {selectAllPokemon} from '../../reducers/selectors';
import {requestAllPokemon} from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';

const mapStateToProps = (state, ownProps) => ({
  pokemon: selectAllPokemon(state)

  // items: selectPokemon(state, ownProps)
  // piece of state that container subscribes to
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: ()=> dispatch(requestAllPokemon())// dispatch requestAllPokemon action.
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);
