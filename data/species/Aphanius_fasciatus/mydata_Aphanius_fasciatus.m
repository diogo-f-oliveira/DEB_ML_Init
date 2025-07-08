function [data, auxData, metaData, txtData, weights] = mydata_Aphanius_fasciatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Aphanius_fasciatus'; 
metaData.species_en = 'Mediterranean killifish'; 

metaData.ecoCode.climate = {'Csa', 'MB'};
metaData.ecoCode.ecozone = {'MAm','THp'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'; 'X-JX'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Alessandro Rinaldi'; 'Valeria Montalto'; 'Gianluca Sara'};    
metaData.date_subm = [2013 05 21];              
metaData.email    = {'arinaldi@unime.it'};            
metaData.address  = {'Department of Earth and Marine Sciences, University of Palermo'};   

metaData.author_mod_1 = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 08 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2017 11 20];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 20]; 


%% set data
% zero-variate data

data.ab = 11;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'SezeOlme2010';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 365;     units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'LeonSini1999';
  temp.ap = C2K(22);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 6 * 365;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'LeonSini1999';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.51;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'SezeOlme2010';  
data.Lp  = 2.02;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LeonSini1998'; 
  comment.Lp = 'Mean from females in the Stagnone di Marsala (2010-2011)';
data.Li  = 7.06;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'LeonSini1999';

data.Wwp = 0.116;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'LeonSini1998';
  comment.Wwp = 'Mean from females in the Stagnone di Marsala (2010-2011)';
data.Wwi = 7.46;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'LeonSini1998';
  comment.Wwi=  'from L-W relationship for females in the Stagnone di Marsala (2010-2011)';
  
data.Ri  = 1.4;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'LeonSini1998';   
temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'from fecundity length relationship(Tab.1 Leonardos 1998) of females in the Stagnone di Marsala (2010-2011)';

  % uni-variate data
% t-L data
%  Age(years)-Length(cm) relationships from females collected in the
%  field (Stagnone di Marsala 2010-2011)
data.tL = [ ... %  time (yr), length (cm)
0.5 1.14
1	2.02
2	2.52
3	3.47
4   3.96
5   4.51];
data.tL(:,1) = 365 * data.tL(:,1); % covert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeonSini1998';
comment.tL = 'relationships from females collected in the field (Stagnone di Marsala 2010-2011)'; 

%  Age(years)-Weight(g) relationships from females collected in the
%  field (Stagnone di Marsala 2010-2011)
data.tW = [ ... % time (yr), wet weight (g)
0.5 0.012
1	0.114
2	0.248
3	0.676
4	1.031
5   1.401];
data.tW(:,1) = 365 * data.tW(:,1); % covert yr to d
units.tW = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW  = C2K(17);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LeonSini1998';
comment.tW = 'relationships from females collected in the field (Stagnone di Marsala 2010-2011)'; 

%  Length(cm)-Weight(g) relationships from females collected in the
%  field (Stagnone di Marsala 2010-2011)
data.LW = [ ...
0.70	0.023
0.81	0.008
0.82	0.014
0.86	0.006
0.90	0.043
1.02	0.005
1.02	0.018
1.02	0.006
1.04	0.006
1.04	0.007
1.06	0.022
1.07	0.004
1.07	0.007
1.10	0.011
1.10	0.015
1.16	0.015
1.16	0.003
1.35	0.003
1.45	0.004
1.46	0.004
1.47	0.009
1.49	0.024
1.55	0.073
1.55	0.065
1.55	0.073
1.55	0.065
1.56	0.086
1.60	0.078
1.60	0.017
1.60	0.047
1.61	0.082
1.66	0.067
1.67	0.115
1.69	0.035
1.69	0.089
1.70	0.070
1.70	0.105
1.72	0.031
1.73	0.109
1.73	0.071
1.74	0.108
1.75	0.051
1.75	0.102
1.75	0.049
1.75	0.013
1.75	0.046
1.75	0.077
1.76	0.048
1.78	0.156
1.78	0.081
1.78	0.090
1.78	0.052
1.79	0.029
1.79	0.009
1.79	0.061
1.80	0.107
1.81	0.037
1.83	0.032
1.83	0.074
1.84	0.080
1.84	0.094
1.84	0.014
1.85	0.116
1.86	0.135
1.86	0.038
1.87	0.051
1.88	0.051
1.90	0.032
1.90	0.069
1.90	0.152
1.91	0.279
1.91	0.087
1.91	0.095
1.91	0.090
1.91	0.096
1.91	0.060
1.92	0.064
1.92	0.057
1.92	0.095
1.92	0.041
1.92	0.073
1.93	0.052
1.93	0.036
1.94	0.091
1.94	0.100
1.94	0.112
1.94	0.029
1.94	0.091
1.94	0.187
1.95	0.106
1.95	0.016
1.95	0.087
1.95	0.137
1.95	0.076
1.96	0.012
1.96	0.059
1.96	0.349
1.97	0.088
1.97	0.087
1.97	0.122
1.98	0.057
1.98	0.089
1.98	0.143
1.98	0.166
1.98	0.073
1.98	0.118
1.98	0.039
1.98	0.029
1.98	0.080
1.98	0.109
1.98	0.089
1.99	0.080
1.99	0.137
1.99	0.125
1.99	0.080
2.00	0.054
2.00	0.144
2.00	0.076
2.00	0.075
2.00	0.105
2.01	0.104
2.01	0.051
2.01	0.122
2.01	0.076
2.01	0.083
2.01	0.040
2.01	0.069
2.02	0.138
2.02	0.131
2.02	0.089
2.03	0.050
2.03	0.116
2.03	0.117
2.03	0.115
2.03	0.105
2.03	0.019
2.04	0.085
2.04	0.166
2.04	0.168
2.04	0.153
2.04	0.086
2.04	0.168
2.05	0.078
2.05	0.083
2.06	0.131
2.06	0.094
2.06	0.059
2.07	0.213
2.07	0.105
2.07	0.070
2.07	0.121
2.08	0.135
2.08	0.100
2.08	0.013
2.09	0.461
2.10	0.072
2.11	0.031
2.11	0.182
2.11	0.064
2.13	0.125
2.13	0.191
2.13	0.058
2.13	0.060
2.14	0.113
2.14	0.264
2.15	0.046
2.15	0.041
2.15	0.099
2.15	0.061
2.16	0.071
2.16	0.062
2.16	0.086
2.16	0.074
2.17	0.099
2.18	0.106
2.18	0.156
2.18	0.141
2.19	0.083
2.19	0.109
2.20	0.106
2.21	0.109
2.21	0.157
2.21	0.142
2.24	0.119
2.24	0.108
2.24	0.168
2.24	0.069
2.25	0.087
2.26	0.313
2.26	0.147
2.26	0.062
2.29	0.080
2.29	0.056
2.30	0.089
2.30	0.093
2.31	0.106
2.35	0.123
2.35	0.104
2.36	0.120
2.36	0.080
2.48	0.057
2.56	0.072
2.58	0.085
2.67	0.053
2.71	0.106
3.27	0.099
3.57	0.102
1.56	0.178
1.57	0.120
1.80	0.238
1.81	0.111
1.86	0.168
1.89	0.125
1.89	0.152
1.90	0.065
1.90	0.129
1.91	0.091
1.94	0.125
1.95	0.071
1.95	0.099
1.95	0.048
1.98	0.159
1.98	0.126
1.98	0.055
1.98	0.111
2.00	0.172
2.02	0.190
2.03	0.129
2.04	0.108
2.05	0.121
2.07	0.103
2.08	0.150
2.08	0.176
2.08	0.133
2.09	0.167
2.10	0.052
2.10	0.113
2.10	0.081
2.10	0.045
2.11	0.099
2.12	0.121
2.12	0.135
2.12	0.033
2.12	0.175
2.12	0.040
2.12	0.213
2.13	0.097
2.13	0.137
2.13	0.144
2.14	0.056
2.14	0.036
2.16	0.163
2.16	0.086
2.16	0.162
2.16	0.093
2.16	0.078
2.17	0.165
2.18	0.120
2.18	0.192
2.18	0.141
2.18	0.093
2.18	0.120
2.19	0.250
2.19	0.130
2.20	0.121
2.20	0.187
2.22	0.114
2.23	0.144
2.23	0.092
2.23	0.086
2.23	0.135
2.24	0.103
2.25	0.176
2.25	0.179
2.26	0.184
2.27	0.169
2.28	0.141
2.29	0.148
2.29	0.132
2.29	0.131
2.31	0.159
2.32	0.128
2.32	0.054
2.32	0.099
2.33	0.150
2.33	0.176
2.34	0.138
2.34	0.151
2.37	0.106
2.38	0.093
2.39	0.130
2.40	0.141
2.40	0.231
2.41	0.180
2.42	0.046
2.46	0.217
2.51	0.082
2.60	0.167
2.64	0.047
2.74	0.092
1.68	0.114
1.69	0.130
1.74	0.271
1.74	0.151
1.79	0.161
1.82	0.023
1.84	0.195
1.85	0.114
1.88	0.109
1.90	0.227
1.91	0.122
1.94	0.155
1.95	0.317
1.95	0.479
1.96	0.320
1.97	0.177
1.98	0.179
1.99	0.715
2.00	0.117
2.01	0.332
2.01	0.102
2.02	0.074
2.02	0.287
2.02	0.253
2.03	0.165
2.03	0.288
2.03	0.129
2.03	0.275
2.04	0.150
2.04	0.260
2.05	0.054
2.05	0.093
2.05	0.840
2.06	0.131
2.06	0.413
2.07	0.392
2.07	0.162
2.08	0.132
2.08	0.252
2.08	0.165
2.08	0.131
2.08	0.229
2.08	0.140
2.08	0.119
2.09	0.446
2.09	0.191
2.09	0.224
2.09	0.146
2.10	0.090
2.10	0.140
2.10	0.314
2.11	0.233
2.11	0.089
2.12	0.382
2.12	0.175
2.13	0.193
2.13	0.209
2.13	0.258
2.14	0.222
2.14	0.173
2.14	0.644
2.14	0.230
2.15	0.124
2.15	0.151
2.15	0.126
2.16	0.168
2.16	0.340
2.16	0.095
2.17	0.136
2.17	0.629
2.17	0.163
2.17	0.176
2.18	0.094
2.18	0.085
2.18	0.081
2.18	0.133
2.18	0.104
2.19	0.061
2.20	0.096
2.20	0.198
2.21	0.178
2.21	0.149
2.21	0.189
2.21	0.139
2.22	0.505
2.22	0.361
2.22	0.235
2.22	0.609
2.22	0.152
2.23	0.366
2.23	0.263
2.23	0.156
2.23	0.263
2.23	0.130
2.23	0.291
2.24	0.071
2.24	0.172
2.24	0.166
2.24	0.271
2.25	0.118
2.25	0.280
2.25	0.529
2.25	0.181
2.25	0.158
2.26	0.333
2.26	0.122
2.26	0.140
2.26	0.114
2.26	0.231
2.26	0.113
2.26	0.233
2.26	0.082
2.27	0.190
2.27	0.201
2.27	0.438
2.28	1.102
2.28	0.060
2.28	0.224
2.28	0.579
2.28	0.373
2.29	0.067
2.29	0.359
2.29	0.579
2.30	0.228
2.30	0.266
2.30	0.456
2.30	0.198
2.30	0.161
2.30	0.313
2.30	0.641
2.30	0.158
2.30	0.705
2.30	0.284
2.30	0.139
2.31	0.287
2.31	0.056
2.31	0.178
2.31	0.245
2.31	0.219
2.31	0.070
2.31	0.527
2.31	0.205
2.31	0.543
2.32	0.154
2.32	0.176
2.32	0.096
2.32	0.263
2.33	0.428
2.33	0.089
2.33	0.175
2.33	0.168
2.34	0.378
2.34	0.218
2.34	0.302
2.34	0.077
2.35	0.328
2.35	0.251
2.36	0.331
2.36	0.699
2.36	0.172
2.36	0.379
2.36	0.244
2.36	0.157
2.36	0.207
2.36	0.155
2.36	0.205
2.36	0.237
2.37	0.286
2.38	0.061
2.38	0.175
2.38	0.180
2.39	0.253
2.39	0.171
2.39	0.194
2.39	1.075
2.39	0.307
2.39	0.281
2.40	0.183
2.40	0.251
2.40	0.557
2.40	0.219
2.40	0.087
2.40	0.179
2.41	0.191
2.41	0.316
2.42	0.141
2.42	0.474
2.42	0.271
2.43	0.227
2.43	0.093
2.43	0.138
2.44	0.353
2.45	0.223
2.45	0.273
2.46	0.103
2.46	0.375
2.46	0.520
2.46	0.074
2.46	0.242
2.46	0.135
2.47	0.327
2.47	0.285
2.48	0.242
2.48	0.168
2.48	0.439
2.48	0.198
2.48	0.058
2.48	0.174
2.49	0.068
2.49	0.308
2.49	0.155
2.49	0.107
2.49	0.140
2.50	0.509
2.50	0.275
2.50	0.301
2.50	0.247
2.52	0.418
2.52	0.351
2.52	0.365
2.52	0.180
2.52	0.189
2.53	0.120
2.53	0.226
2.53	0.136
2.53	0.273
2.53	0.182
2.53	0.109
2.54	0.127
2.54	0.298
2.54	0.142
2.54	0.170
2.54	0.314
2.54	0.153
2.55	0.227
2.55	0.508
2.55	0.140
2.56	0.240
2.56	0.683
2.56	0.209
2.56	0.237
2.56	0.166
2.57	0.341
2.57	0.239
2.58	0.055
2.58	0.254
2.58	0.112
2.59	0.256
2.59	0.280
2.60	0.169
2.60	0.328
2.60	0.319
2.61	0.055
2.61	0.283
2.62	0.166
2.62	0.219
2.62	0.240
2.62	0.232
2.62	0.098
2.62	0.694
2.63	0.222
2.63	0.076
2.63	0.469
2.64	0.144
2.65	0.338
2.65	0.274
2.65	0.230
2.66	0.368
2.66	0.343
2.67	0.288
2.67	0.069
2.68	0.452
2.68	0.105
2.68	0.153
2.68	0.388
2.69	0.159
2.69	0.954
2.69	0.263
2.69	0.158
2.69	0.172
2.69	0.379
2.70	0.421
2.70	0.158
2.70	0.105
2.70	0.197
2.70	0.171
2.70	0.535
2.71	0.660
2.71	0.552
2.71	0.231
2.71	0.202
2.72	0.148
2.73	0.398
2.73	0.143
2.73	0.261
2.73	0.181
2.73	0.447
2.74	0.199
2.74	0.537
2.74	0.655
2.75	0.304
2.75	0.305
2.75	0.116
2.75	0.280
2.75	0.307
2.76	0.368
2.76	0.310
2.76	0.435
2.76	0.107
2.76	0.160
2.76	0.175
2.77	0.354
2.77	0.844
2.77	0.253
2.77	0.108
2.78	0.154
2.78	0.167
2.78	0.195
2.78	0.301
2.79	0.169
2.79	0.311
2.80	0.081
2.80	0.430
2.80	0.236
2.80	1.156
2.81	0.969
2.81	0.201
2.82	0.669
2.82	0.108
2.82	0.097
2.82	0.216
2.83	0.135
2.84	0.192
2.84	0.081
2.84	0.350
2.85	0.157
2.85	0.411
2.86	0.091
2.86	0.303
2.86	0.179
2.86	0.112
2.86	0.325
2.87	0.080
2.87	0.405
2.87	0.152
2.87	0.039
2.87	0.086
2.87	0.488
2.88	0.173
2.88	0.341
2.88	0.455
2.88	0.210
2.89	0.222
2.89	0.125
2.89	0.130
2.92	0.371
2.92	0.188
2.93	0.467
2.93	0.251
2.94	0.444
2.95	0.229
2.95	0.121
2.95	0.231
2.96	0.863
2.98	0.351
2.98	0.145
2.99	0.042
2.99	0.134
3.01	0.186
3.02	0.077
3.03	0.124
3.03	0.166
3.03	0.754
3.04	0.800
3.04	0.210
3.04	0.437
3.05	0.154
3.06	0.205
3.07	0.159
3.08	0.180
3.08	0.230
3.09	0.392
3.10	0.188
3.10	0.240
3.11	0.319
3.11	0.232
3.11	0.556
3.11	0.161
3.11	0.100
3.12	0.061
3.13	0.281
3.13	0.166
3.15	0.173
3.16	0.174
3.17	0.324
3.18	0.178
3.19	0.518
3.20	0.213
3.20	0.208
3.21	0.363
3.22	0.244
3.23	0.313
3.26	0.186
3.27	0.236
3.27	0.281
3.28	0.393
3.28	0.150
3.29	0.375
3.29	0.308
3.31	0.765
3.33	0.070
3.36	0.792
3.37	0.153
3.41	0.626
3.49	0.186
3.49	0.697
3.50	0.206
3.51	0.558
3.52	0.186
3.55	0.121
3.56	0.320
3.56	0.338
3.63	0.279
3.66	0.205
3.66	0.110
3.69	0.513
3.71	0.214
3.71	0.273
3.74	0.341
3.81	0.547
3.82	0.284
3.82	0.171
3.85	0.396
3.96	0.086
3.96	0.372
3.98	0.373
4.04	0.331
4.14	0.194
4.20	0.119
4.37	0.703
4.42	0.404
2.15	0.389
2.25	0.355
2.37	0.638
2.56	0.447
2.72	0.340
2.81	0.579
2.96	0.187
2.97	0.567
3.03	0.608
3.16	0.371
3.18	0.277
3.19	0.372
3.22	0.525
3.34	0.131
3.38	0.615
3.40	0.601
3.44	0.072
2.33	1.014
2.35	0.352
2.38	0.335
2.47	1.034
2.49	0.739
2.57	0.211
2.60	0.219
2.64	0.532
2.66	0.864
2.67	0.411
2.73	0.243
2.74	0.480
2.75	1.535
2.79	0.481
2.82	0.720
2.82	0.398
2.84	0.522
2.85	0.814
2.93	0.395
2.93	0.167
2.93	0.455
2.94	0.705
2.95	0.339
2.95	0.550
2.96	0.289
2.97	0.373
2.98	0.316
2.99	0.627
3.00	0.492
3.00	0.220
3.04	0.500
3.06	0.603
3.07	0.450
3.07	0.456
3.09	0.381
3.10	0.207
3.10	0.386
3.11	1.381
3.11	1.024
3.12	0.492
3.12	0.657
3.12	0.658
3.14	0.353
3.14	1.008
3.14	0.655
3.15	0.791
3.15	0.569
3.15	0.656
3.17	1.643
3.18	0.316
3.18	0.858
3.23	0.394
3.23	0.851
3.27	1.149
3.29	0.571
3.29	0.181
3.29	0.304
3.30	1.375
3.31	0.472
3.31	0.553
3.34	1.093
3.37	0.646
3.37	0.208
3.37	0.609
3.42	0.367
3.42	0.196
3.44	0.610
3.44	0.937
3.45	0.613
3.46	0.427
3.47	0.260
3.49	0.596
3.49	1.347
3.51	0.611
3.51	0.625
3.52	1.217
3.53	0.431
3.53	0.289
3.53	0.412
3.54	1.772
3.54	0.913
3.54	0.620
3.54	0.562
3.56	0.350
3.60	0.357
3.62	0.884
3.63	0.457
3.64	0.522
3.66	0.358
3.69	1.094
3.69	0.418
3.70	1.873
3.70	0.794
3.71	0.662
3.72	0.393
3.73	0.737
3.75	1.341
3.75	1.413
3.76	0.337
3.76	0.286
3.78	0.620
3.83	0.096
3.83	0.700
3.88	1.078
3.88	0.300
3.89	0.874
3.92	0.530
3.94	0.755
3.94	0.758
3.97	0.565
3.98	0.784
3.99	0.695
4.00	0.543
4.01	0.634
4.02	0.598
4.06	0.744
4.06	0.704
4.07	0.786
4.07	0.924
4.07	0.586
4.07	0.843
4.09	0.985
4.11	0.750
4.15	0.629
4.15	0.826
4.16	1.577
4.21	0.509
4.23	1.164
4.23	0.594
4.26	1.108
4.27	0.781
4.29	0.423
4.32	0.813
4.33	0.635
4.36	1.359
4.37	0.951
4.37	0.680
4.38	0.979
4.49	0.621
4.51	1.459
4.52	0.262
4.58	1.339
4.80	0.570
4.87	0.859
4.93	1.123
4.93	0.505
2.02	0.556
3.36	0.536
3.38	0.609
3.50	0.913
4.06	1.748
2.81	0.325
2.98	1.082
3.03	0.860
3.32	0.384
3.69	0.778
3.71	0.721
3.83	0.715
3.84	0.376
3.86	1.177
3.95	0.463
3.98	1.028
4.06	2.355
4.23	0.454
4.25	1.094
4.30	0.822
4.37	1.761
4.40	1.975
4.47	1.001
4.78	1.086
4.82	0.757
4.88	1.603
5.25	2.797
4.28	0.995
4.43	2.406
5.28	1.414
3.86	1.466
4.31	2.199
4.38	0.632
4.48	0.275
4.63	1.573
4.97	1.651];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW  = 'LeonSini1998';
comment.LW = 'relationships from females collected in the field (Stagnone di Marsala 2010-2011)'; 
  
% food density - ingestion rate
% max surface area spec ingestion rate (mg food/d cm2)assuming a feeding time of 8/24 hours
% Length (cm), Ingestion rate (mg/d), Food conc (mg/l)
L_JX_X = [ ...    
3.66	16.00	5;
3.39	31.84	10;
3.63	52.19	15;
3.63	55.25	20;
3.93	85.09	25;
3.72	96.67	50;
3.41	85.57	100;];
data.XJX = L_JX_X(:,[3 2]); 
units.XJX = {'mg/l', 'mg/d'}; label.XJX = {'food conc', 'ingestion rate'};  
temp.XJX = C2K(17); units.temp.XJX = 'K'; label.temp.XJX = 'temperature';
bibkey.XJX = 'LeonSini1998';
length.XJX = L_JX_X(:, 1); units.length.XJX   = {'cm'};  label.length.XJX = {'total length'};  
treat.XJX = {0}; units.treat.XJX = ''; label.treat.XJX = '';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.length = length;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'This entry concerns the female only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'This entry is discussed in RinaMont2014';
metaData.bibkey.F1 = 'RinaMont2014';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FB5F'; % Cat of Life
metaData.links.id_ITIS = '165723'; % ITIS
metaData.links.id_EoL = '46566755'; % Ency of Life
metaData.links.id_Wiki = 'Aphanius_fasciatus'; % Wikipedia
metaData.links.id_ADW = 'Aphanius_fasciatus'; % ADW
metaData.links.id_Taxo = '44467'; % Taxonomicon
metaData.links.id_WoRMS = '126428'; % WoRMS
metaData.links.id_fishbase = 'Aphanius-fasciatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphanius_fasciatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeonSini1998'; type = 'Article'; bib = [ ... 
'author = {Leonardos, I. and Sinis, A.}, ' ... 
'year = {1998}, ' ...
'title = {Reproductive strategy of \emph{Aphanius fasciatus} {N}ardo, 1827 ({P}isces: {C}yprinodontidae)in the {M}esolongi and {E}tolikon lagoons ({W}. {G}reece)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {35}, ' ...
'pages = {171--181}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeonSini1999'; type = 'Article'; bib = [ ... 
'author = {Leonardos, I. and Sinis, A.}, ' ... 
'year = {1999}, ' ...
'title = {Reproductive strategy of \emph{Aphanius fasciatus} {N}ardo, 1827 ({P}isces: {C}yprinodontidae) in the {M}esolongi and {E}tolikon lagoons ({W}. {G}reece)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {40}, ' ...
'pages = {227--235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SezeOlme2010'; type = 'Article'; bib = [ ... 
'author = {Sezen, S. and Olmez, M.}, ' ... 
'year = {2010}, ' ...
'title = {Production of \emph{Aphanius mento} ({H}eckel, 1843) under controlled conditions}, ' ...
'journal = {A.A.C.L. Bioflux}, ' ...
'volume = {5}, ' ...
'pages = {94--98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RinaMont2014'; type = 'Article'; bib = [ ... 
'author = {Rinaldi, A. and Montalto, V. and Lika, K. and Sanfilippo, M. and Manganaro, A. and Sar\`{a}, G.}, ' ... 
'year = {2014}, ' ...
'title = {Estimation of dynamic energy budget parameters for the {M}editerranean toothcarp (\emph{Aphanius fasciatus})}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {94}, ' ...
'pages = {65-70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
