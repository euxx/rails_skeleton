const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  Popper: ['popper.js', 'default'],
  bootstrap: ['bootstrap/dist/js/bootstrap.min.js'],
}))

const { CleanWebpackPlugin } = require('clean-webpack-plugin');
environment.plugins.prepend('CleanWebpackPlugin', new CleanWebpackPlugin());

module.exports = environment
