import React, {Component} from 'react';

class SortTable extends Component {
    constructor(props) {
        super(props);
        this.state = { sortColumnIndex: false, sortDirection: false };
    };

    DOWN_ARROW = "\u2b07";
    UP_ARROW = "\u2b06";
    ASCENDING = 'asc';
    DESCENDING = 'desc';

    //  Dictionary for determining the utf-8 char for the sorting arrows, and which way the sort works
    SORT_DIRECTIONS = {
        asc: {
            arrowCode: this.UP_ARROW,
            greaterItemMove: 1
        },
        desc: {
            arrowCode: this.DOWN_ARROW,
            greaterItemMove: -1
        }
    }

    handleSort = (columnIndex) => {
        if(this.state.sortColumnIndex === false || columnIndex !== this.state.sortColumnIndex) {
            this.setState({sortColumnIndex: columnIndex, sortDirection: this.ASCENDING} );
        } else {
            const newSortDirection = (this.state.sortDirection === this.ASCENDING ? this.DESCENDING : this.ASCENDING);
            this.setState({sortDirection: newSortDirection});
        }
    }

    sortedRows = () => {
        const rows = this.props.rows
        const sortIndex = this.state.sortColumnIndex
        if (sortIndex === false || this.state.sortDirection === false) {
            return rows
        } else {
            // This sets up the 1/-1 values in the right order for the sort call below to work
            const greaterItemMove = this.SORT_DIRECTIONS[this.state.sortDirection].greaterItemMove;
            const lesserItemMove = greaterItemMove * -1;

            return rows.sort((a, b) => {
                return (a[sortIndex] > b[sortIndex]) ? greaterItemMove : lesserItemMove
            });
        }
    }

    render() {
        return (
            <table className='sort-table'>
                <thead>
                    <tr>
                    {this.props.header.map((header, index) => {
                        if (header.sortable === true) {
                            let sortArrow = '';
                            if (index === this.state.sortColumnIndex) {
                                sortArrow = this.SORT_DIRECTIONS[this.state.sortDirection].arrowCode
                            }
                            return (
                                <th key={index} className={'sortable'} onClick={() => this.handleSort(index)} >
                                    {header.label} <span className={'arrow'}>{sortArrow}</span>
                                </th>
                            )
                        } else {
                            return (
                                <th key={index} className={'no-sort'}>
                                    {header.label} <span className={'arrow'}></span>
                                </th>
                            )

                        }
                    })}
                    </tr>
                </thead>
                <tbody>
                {this.sortedRows().map((row, index) => (
                    <tr key={index}>
                    {row.map((cell, index) => (
                       <td key={index}>{cell}</td>
                    ))}
                    </tr>
                ))}
                </tbody>
            </table>
        )
    }
}

export default SortTable
