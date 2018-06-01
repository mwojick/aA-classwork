import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_POKEMON:
      let poke = action.poke.pokemon;
      let pokeId = action.poke.pokemon.id;
      let pokeObj = { [pokeId]: merge({}, state[pokeId], poke) };
      let newPokemon = merge({}, state, pokeObj);
      return newPokemon;
    default:
      return state;
  }
};

export default pokemonReducer;
