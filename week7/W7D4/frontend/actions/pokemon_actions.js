import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';


export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);


export const receivePokemon = poke => ({
  type: RECEIVE_POKEMON,
  poke
});

export const requestPokemon = (pokemonId) => (dispatch) => (
  APIUtil.fetchPokemon(pokemonId)
    .then(poke => dispatch(receivePokemon(poke)))
);
