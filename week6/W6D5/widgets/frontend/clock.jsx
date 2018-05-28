import React from 'react';

class Clock extends React.Component {

  constructor() {
    super();
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({time: new Date()});

  }

  componentDidMount() {
    const handle = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(handle);
    handle = 0;
  }

  padTime(){

    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();

    hours = hours < 10 ? `0${hours}` : hours;
    minutes = minutes < 10 ? `0${minutes}` : minutes;
    seconds = seconds < 10 ? `0${seconds}` : seconds;

    return `${hours}:${minutes}:${seconds}`;
  }


  render() {
    return (
      <div className="clock">
        <h1>Clock</h1>
          {this.padTime()}
      </div>
    );
  }

}



export default Clock;
