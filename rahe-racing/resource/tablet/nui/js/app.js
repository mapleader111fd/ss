$(document).ready(function () {
    $(document).keydown(function (event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '27') {
            closeTablet();
        }
    });

    function closeTablet() {
        $.post("https://rahe-racing/closeTablet", JSON.stringify({}));
    }
});

function tracksData() {
    return {
        // Infinite scroll
        triggerElement: null,
        page: 1,
        lastPage: null,
        itemsPerPage: 12,
        observer: null,
        items: [],

        // Tracks
        tracks: [],
        showTrackSearch: false,
        showLoadingSpinner: false,
        trackSearchInput: '',
        filteredTracks: [],
        trackFilter: '',
        personalIdentifier: '',

        setTrackFilter(value) {
            const ctx = this
            ctx.showLoadingSpinner = true;

            setTimeout(function () {
                ctx.trackFilter = value;
                ctx.updateFilteredTracks();
                ctx.showLoadingSpinner = false;
            }, 10);
        },

        setTrackSearch(value) {
            const ctx = this
            ctx.showLoadingSpinner = true;

            setTimeout(function () {
                ctx.trackSearchInput = value;
                ctx.updateFilteredTracks();
                ctx.showLoadingSpinner = false;
            }, 10);
        },

        updateFilteredTracks() {
            let newFilteredTracks = [];

            if (this.trackFilter === 'PERSONAL') {
                const ownerIdentifier = this.personalIdentifier;
                newFilteredTracks = _.filter(this.tracks, function (track) {
                    return track.creator_identifier === ownerIdentifier;
                });
            } else if (this.trackFilter === 'FAVORITE') {
                newFilteredTracks = _.filter(this.tracks, function (track) {
                    return track.is_favorite === 1;
                });
            } else if (this.trackFilter === 'VERIFIED') {
                newFilteredTracks = _.filter(this.tracks, function (track) {
                    return track.is_verified === 1;
                });
            } else {
                newFilteredTracks = this.tracks;
            }

            if (this.trackSearchInput !== '') {
                let searchString = this.trackSearchInput.toLowerCase();

                newFilteredTracks = _.filter(newFilteredTracks, function (track) {
                    return track.name.toLowerCase().includes(searchString) || track.alias.toLowerCase().includes(searchString);
                });
            }

            this.filteredTracks = newFilteredTracks;

            this.lastPage = Math.ceil(newFilteredTracks.length / this.itemsPerPage);
            this.page = 1;
            this.items = [];

            if (newFilteredTracks.length === 0) {
                this.stopObserver();
                return
            }

            if (!this.observerStarted) {
                this.initObserver();
            } else {
                this.getItems();
            }
        },

        initObserver(elementId) {
            if (this.observerStarted) {
                return
            }

            this.observerStarted = true;
            const ctx = this;

            this.triggerElement = document.querySelector(elementId ? elementId : '#infinite-scroll-trigger')
            this.observer = new IntersectionObserver(function (entries) {
                if (entries[0].isIntersecting === true) {
                    ctx.getItems()
                }
            }, {threshold: [0]})

            this.observer.observe(this.triggerElement)
            this.getItems()
        },

        stopObserver() {
            this.observerStarted = false;

            this.observer.unobserve(this.triggerElement);
            this.observer = null;
        },

        getItems() {
            let firstRowElementIndex = this.page === 1 ? 1 : 1 + (this.page - 1) * this.itemsPerPage
            for (let i = 0; i < this.itemsPerPage; i++) {
                let track = this.filteredTracks[firstRowElementIndex + i - 1]
                if (track) {
                    this.items.push(track);
                }
            }

            // Next page
            this.page++

            // We have shown the last page - clean up
            if (this.lastPage && this.page > this.lastPage) {
                this.stopObserver();
            }
        },

        observerStarted: false,
        setTracks(tracks, identifier) {
            this.tracks = tracks;
            this.personalIdentifier = identifier;

            if (!this.observerStarted) {
                this.initObserver();
            } else {
                this.updateFilteredTracks();
            }
        },

        setVerified(trackId, trackName, value) {
            $.post('https://rahe-racing/setTrackVerified', JSON.stringify({trackId: trackId, trackName: trackName, value: value}));
        },
        setFavorite(trackId, trackName, value) {
            $.post('https://rahe-racing/setTrackFavorite', JSON.stringify({trackId: trackId, trackName: trackName, value: value}));
        }
    }
}