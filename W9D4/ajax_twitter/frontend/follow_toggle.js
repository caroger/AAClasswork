class FollowToggle {

  constructor(el, options){
    this.$el = $(el)
    this.userId = this.$eldata('user-id') || options.userId;
    this.followState = (this.$el.data('initial-follow-stat') || options.followState);
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

}