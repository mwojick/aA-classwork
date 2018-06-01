import React from 'react';
import {PokemonIndexItem} from './pokemon_index_item';
import { Route } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';


class PokemonIndex extends React.Component {

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    let pokemon = this.props.pokemon;
    const pokemonItems = pokemon.map(poke => <PokemonIndexItem key={poke.id} poke={poke} />);

    return(
      <div className="main">
        <section className="pokedex">
          <ul className="pokelinks">
            {pokemonItems}
          </ul>
        </section>
        <section className="pokedetail">
          <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
        </section>
      </div>
    );
  }

}


export default PokemonIndex;
