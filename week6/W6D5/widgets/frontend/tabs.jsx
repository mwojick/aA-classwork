import React from 'react';

class Tabs extends React.Component {
  constructor() {
    super();
    this.state = {
      index: 0
    };
  }

  setIndex(num) {
    this.setState({index: num});
  }

  render() {
    return (
    <div>
      <ul>
        <h1 onClick={()=> this.setIndex(0)}>{this.props.tabInfo[0].title}</h1>
        <h1 onClick={()=> this.setIndex(1)}>{this.props.tabInfo[1].title}</h1>
        <h1 onClick={()=> this.setIndex(2)}>{this.props.tabInfo[2].title}</h1>
      </ul>
      <article>
        {this.props.tabInfo[this.state.index].content}
      </article>
    </div>
    );
  }
}


export default Tabs;
