import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const tabInfo = [
  {title: "one", content: "I am the first"},
  {title: "two", content: "I am the second"},
  {title: "three", content: "I am the third"}
];

const Root = () => {
  return (
    <ul>
      React Works maybe
      <Clock />
      <Tabs tabInfo={tabInfo}/>
    </ul>

  );
};




export default Root;
