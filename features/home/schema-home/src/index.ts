import { FeatureDescriptor } from '@vyuh/sanity-schema-core';
import { RouteDescriptor } from '@vyuh/sanity-schema-system';
import { SimpleContentDescriptor, SimpleContentSchemaBuilder } from './simple-content';

export const schemaHome = new FeatureDescriptor({
  name: 'schemaHome',
  title: 'Schema Home',
  description: 'Schema for the Schema Home feature',
  contents: [
    new RouteDescriptor({
      regionItems: [{ type: SimpleContentDescriptor.schemaName }],
    }),
  ],
  contentSchemaBuilders: [new SimpleContentSchemaBuilder()],
});
