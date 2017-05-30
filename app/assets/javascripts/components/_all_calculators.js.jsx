var AllCalculators = React.createClass({
  handleDelete(id) {
    this.props.handleDelete(id);
  },

  onUpdate(calculator) {
    this.props.onUpdate(calculator);
  },

  render() {
      var calculators = this.props.calculators.map((calculator) => {
          return (
            <div key={calculator.id}>
              <Calculator calculator={calculator}
                          handleDelete={this.handleDelete.bind(this, calculator.id)}
                          handleUpdate={this.onUpdate} />
            </div>
          )
      });

      return(
        <div>
          {calculators}
        </div>
      )
  }
});