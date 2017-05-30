var Calculator = React.createClass({
  getInitialState() {
    return {editable: false}
  },

  handleEdit() {
    if(this.state.editable) {
      var cells = this.refs.cells.value;
      var id = this.props.calculator.id;
      var calculator = {id: id , cells: cells};

      this.props.handleUpdate(calculator);
      console.log('in handleEdit', this.state.editable, cells);
    }
    this.setState({editable: !this.state.editable})
  },

  render() {
    var cells = this.state.editable ? <input type='text' ref='cells' defaultValue={this.props.calculator.cells} /> : <div>{this.props.calculator.cells}</div>;

    return (
      <div>
        <div>{cells}</div>
        <button onClick={this.props.handleDelete}>Delete</button>
        <button onClick={this.handleEdit}> {this.state.editable ? 'Submit' : 'Edit' } </button>
      </div>
    )
  }
});