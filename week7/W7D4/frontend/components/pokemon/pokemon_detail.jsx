import React from 'react';
import {Route} from 'react-router-dom';

class PokemonDetail extends React.Component {

  // componentWillReceiveProps (newProps) {
  //   if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
  //   this.props.requestPokemon(newProps.currentPoke.id);
  //  }
  // }
  //
  // componentDidMount () {
  //   this.props.requestPokemon(this.props.currentPoke.id);
  // }


  render () {
    const poke = this.props.currentPoke;
    const items = this.props.currentItems;

    return (
      <div>
         <img src={poke.image_url}/>
         {poke.name}
         {poke.type}
         {poke.attack}
         {poke.defense}
         {poke.moves}


      </div>
    )
  }
}

export default PokemonDetail;
