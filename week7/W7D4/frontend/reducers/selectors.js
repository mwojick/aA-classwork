import values from 'lodash/values';

export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon);
};

// export const selectAllPokemon = (state) => {
//   let keys = Object.keys(state.entities.pokemon);
//   return keys.map((k)=>state.entities.pokemon[k]);
// };
