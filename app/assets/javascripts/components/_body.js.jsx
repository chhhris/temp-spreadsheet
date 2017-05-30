var Body = React.createClass({
    getInitialState() {
      return { calculators: [] }
    },

    componentDidMount() {
      $.getJSON('/api/v1/calculators.json', (response) => { this.setState({ calculators: response }) });
    },

    handleSubmit(calculator) {
      var newState = this.state.calculators.concat(calculator);
      this.setState({ calculators: newState })
    },

    handleUpdate(calculator) {
      $.ajax({
        url: `/api/v1/calculators/${calculator.id}`,
        type: 'PUT',
        data: { calculator: calculator },
        success:() => {
          this.updateCalculators(calculator);
        }
      });
    },

    updateCalculators(calculator) {
      var calculators = this.state.calculators.filter((i) => { return i.id != calculator.id });
      calculators.push(calculator);

      this.setState({calculators: calculators});
    },

    removeCalculatorClient(id) {
      var newCalculators = this.state.calculators.filter((calculator) => {
        return calculator.id != id;
      });

      this.setState({ calculators: newCalculators });
    },

    handleDelete(id) {
      $.ajax({
        url: `/api/v1/calculators/${id}`,
        type: 'DELETE',
        success:() => {
          this.removeCalculatorClient(id)
        }
      });
    },

    render() {
      return (
        <div>
          <NewCalculator handleSubmit={this.handleSubmit} />
          <AllCalculators calculators={this.state.calculators} handleDelete={this.handleDelete} onUpdate={this.handleUpdate} />
        </div>
      )
    }
});