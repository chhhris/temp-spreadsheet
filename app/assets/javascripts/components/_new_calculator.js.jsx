var NewCalculator = React.createClass({
    handleClick() {
      var cells = this.refs.cells.value;

      $.ajax({
        url: '/api/v1/calculators',
        type: 'POST',
        data: { calculator: { cells: cells } },
        success: (calculator) => {
          this.props.handleSubmit(calculator);
        }
      });
    },

    render() {
      return (
        <div>
          <input ref='cells' placeholder='Row, Columns e.g. 2, 2' />
          <button onClick={this.handleClick}>Save</button>
        </div>
      )
    }
});