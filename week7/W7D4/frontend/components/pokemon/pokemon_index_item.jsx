import React from 'react';
import {Link} from 'react-router-dom';

export const PokemonIndexItem = (props) => (
  <li className="pokelink">
    <Link to={`/pokemon/${props.poke.id}`}>
      {props.poke.name}
      <img src={props.poke.image_url}/>
    </Link>
  </li>
);
