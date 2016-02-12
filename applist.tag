<applist>

    <center class="centered">
        <div style="float:left;">
            <button class="btn" disabled={ page==0 } onclick={first}> &laquo; First </button>
            <button class="btn" disabled={ page==0 } onclick={prev}> &lt; Prev </button>
        </div>

        Page { page + 1 } / { Math.ceil(items.length / pagesize) }

        <div style="float:right;">
            <button class="btn" disabled={ page==M ath.floor(items.length / pagesize) } onclick={next}> Next &gt; </button>
            <button class="btn" disabled={ page==M ath.floor(items.length / pagesize) } onclick={last}> Last &raquo; </button>
        </div>
    </center>

    <table style="width: 100%; clear: both;">
        <thead>
            <tr>
                <th>#</th>
                <th each={ key, i in items[0] }>{ key }</th>
            </tr>
        </thead>
        <tbody>
            <tr each={ item, i in paged(items) }>
                <td>{ (page * pagesize) + i + 1 }.</td>
                <td each={ value, i in item } title={ item[value] }>
                    { item[value] }
                </td>
            </tr>
        </tbody>
    </table>


    <script>
    const _self = this;
    this.items = opts.data
    this.page = 0
    this.pagesize = 1000

    first() {
        this.page = 0
    }

    prev() {
        console.log('prev')
        if (this.page > 0) {
            this.page--
        }
    }

    next() {
        if (this.page < (this.items.length / this.pagesize) - 1) {
            this.page++
        }
    }

    last() {
        this.page = Math.ceil(this.items.length / this.pagesize) - 1
    }

    paged(items) {
        var part = items.slice(this.page * this.pagesize, (this.page + 1) * this.pagesize)
        console.log(part)
        return part
    }
    </script>

</applist>
