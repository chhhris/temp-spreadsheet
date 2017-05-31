var NewCalculator = React.createClass({
    handleClick() {
      var height = this.refs.height.value;
      var width = this.refs.width.value;

      $.ajax({
        url: '/api/v1/calculators',
        type: 'POST',
        data: { calculator: { height: height, width: width } },
        success: (calculator) => {
          this.props.handleSubmit(calculator);
        }
      });
    },

    render() {
      return (
        <div>
          <input ref='width' placeholder='Width' />
          <input ref='height' placeholder='Height' />
          <button onClick={this.handleClick}>Save</button>
        </div>
      )
    }
});