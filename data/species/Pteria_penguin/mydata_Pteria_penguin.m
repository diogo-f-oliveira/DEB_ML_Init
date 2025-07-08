function [data, auxData, metaData, txtData, weights] = mydata_Pteria_penguin
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pterioida'; 
metaData.family     = 'Pteriidae';
metaData.species    = 'Pteria_penguin'; 
metaData.species_en = 'Winged oyster'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsmm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'tj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 22]; 

%% set data
% zero-variate data

data.tj = 25;   units.tj = 'd';    label.tj = 'time since birth at settlement';  bibkey.tj = 'Mili2011';   
  temp.tj = C2K(27.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = '20-30 d';
data.am = 4*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Mili2011';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8.88;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Mili2011';
data.Li  = 18;      units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Mili2011';

data.Wwb = 8.7e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Mili2011';
  comment.Wwb = 'based on egg diameter of 55 mum: pi/6*0.0055^3';
data.Wwi = 317; units.Wwi = 'g';   label.Wwi = 'flesh wet weight';   bibkey.Wwi = 'EoL';
  
data.GSI  = 0.3; units.GSI  = '-'; label.GSI  = 'gonado somatic index';     bibkey.GSI  = 'guess';   
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since settlement (yr), shell length (cm)
0.327	5.217
0.329	1.616
0.329	1.250
0.330	0.885
0.341	3.651
0.341	3.495
0.341	3.338
0.341	3.234
0.342	3.025
0.342	2.973
0.342	2.712
0.342	2.451
0.342	2.242
0.342	1.981
0.354	4.799
0.367	4.434
0.407	4.016
0.486	4.277
0.486	4.016
0.486	3.807
0.486	3.650
0.487	3.546
0.487	3.442
0.499	5.738
0.499	5.477
0.499	5.112
0.499	4.694
0.500	3.233
0.500	3.128
0.526	2.972
0.526	2.919
0.527	2.345
0.538	6.207
0.540	2.032
0.540	1.823
0.554	1.667
0.567	0.831
0.580	1.405
0.643	7.355
0.644	4.797
0.644	4.797
0.644	4.484
0.645	4.119
0.645	3.962
0.646	2.292
0.646	2.031
0.656	6.781
0.657	5.111
0.670	6.467
0.670	5.528
0.671	3.701
0.671	3.492
0.671	3.388
0.672	3.023
0.672	2.605
0.683	6.206
0.790	4.327
0.803	5.005
0.804	3.126
0.817	3.492
0.827	8.032
0.828	7.041
0.829	5.788
0.829	5.370
0.829	5.109
0.841	6.362
0.842	5.892
0.842	4.640
0.843	3.961
0.854	7.771
0.855	5.631
0.869	4.953
0.881	6.675
0.882	5.370
0.882	4.431
0.882	4.378
0.882	3.804
0.883	3.648
0.883	3.543
0.883	3.335
0.908	6.257
0.920	7.249
0.921	6.257
0.921	5.892
0.922	4.222
1.013	6.935
1.025	8.448
1.025	8.187
1.026	7.770
1.051	10.275
1.051	9.701
1.077	9.492
1.078	9.335
1.080	5.369
1.091	8.552
1.091	8.552
1.091	8.396
1.091	8.135
1.091	8.030
1.093	5.055
1.104	9.022
1.105	7.717
1.105	7.508
1.118	7.508
1.118	7.456
1.118	7.247
1.118	7.039
1.118	6.830
1.119	6.673
1.119	6.360
1.130	9.857
1.145	6.099
1.159	5.995
1.159	5.055
1.170	8.969
1.275	11.109
1.277	7.299
1.288	10.378
1.288	9.960
1.290	7.559
1.290	6.359
1.290	6.202
1.291	6.046
1.291	5.837
1.315	9.543
1.316	8.603
1.316	8.603
1.316	8.447
1.316	8.290
1.316	8.133
1.316	7.925
1.316	7.872
1.317	6.620
1.328	9.334
1.329	9.073
1.329	9.021
1.329	8.864
1.407	11.264
1.433	10.951
1.433	10.847
1.433	10.429
1.447	9.959
1.460	9.698
1.472	11.995
1.487	9.437
1.500	9.176
1.500	8.915
1.500	8.498
1.515	6.671
1.526	10.794
1.528	7.193
1.540	8.184
1.554	7.819
1.565	11.837
1.565	11.681
1.565	11.263
1.565	11.002
1.565	10.428
1.566	10.167
1.579	9.854
1.579	9.645
1.591	12.724
1.606	9.488
1.606	7.923
1.618	10.898
1.619	9.123
1.619	9.019
1.619	8.653
1.619	8.340
1.684	11.784
1.709	12.724
1.710	11.523
1.710	11.210
1.711	10.166
1.711	10.062
1.724	11.053
1.724	9.696
1.737	10.897
1.737	10.792
1.737	10.584
1.737	10.375
1.738	8.705
1.738	8.287
1.776	11.523
1.776	11.262
1.855	11.940
1.855	11.366
1.856	10.478
1.856	10.218
1.856	9.852
1.856	9.487
1.868	12.514
1.868	12.149
1.869	10.635
1.883	8.965
1.907	12.931
1.907	12.670
1.908	12.096
1.908	12.096
1.908	11.783
1.908	11.052
1.920	13.140
1.921	11.626
1.935	11.365
1.935	11.156
1.935	10.896
1.948	10.530
1.962	10.217
1.962	9.382
2.039	12.930
2.040	12.565
2.054	10.634
2.054	10.112
2.065	13.556
2.066	13.191
2.066	12.460
2.066	12.304
2.066	12.095
2.066	11.991
2.066	11.886
2.066	11.782
2.066	11.678
2.066	11.573
2.067	11.260
2.067	11.208
2.093	10.999
2.120	9.276
2.225	11.050
2.225	10.476
2.237	12.877
2.238	12.616
2.238	12.459
2.238	12.303
2.238	12.198
2.238	12.042
2.238	11.833
2.238	11.781
2.238	11.729
2.238	11.415
2.239	9.954
2.250	14.390
2.250	13.868
2.250	13.503
2.355	15.120
2.355	14.703
2.356	14.076
2.357	10.736
2.396	13.450
2.396	13.346
2.396	12.302
2.396	12.197
2.396	11.989
2.396	11.884
2.397	11.571
2.409	13.189
2.409	13.032
2.409	12.980
2.409	12.719
2.409	12.667
2.409	12.458
2.607	13.553
2.607	13.344
2.633	13.083
2.634	12.039
2.647	11.569
2.659	15.118
2.659	14.857
2.659	14.544
2.659	14.127
2.659	13.918
2.659	13.761
2.660	12.822
2.673	13.657
2.673	13.553
2.673	13.396
2.673	13.292
2.673	12.926
2.673	12.352
2.699	13.970];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time', 'shell length'};  
temp.tL    = C2K(27.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mili2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k =  0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio'; weights.psd.k = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Potandric hermaphrodite: First male then female';
metaData.bibkey.F1 = {'Mili2011'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4PTRM'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46467348'; % Ency of Life
metaData.links.id_Wiki = 'Pteria_penguin'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '39267'; % Taxonomicon
metaData.links.id_WoRMS = '208448'; % WoRMS
metaData.links.id_molluscabase = '208448'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteria}}';
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
bibkey = 'Mili2011'; type = 'phdthesis'; bib = [ ... 
'author = {Michael Milione}, ' ... 
'year = {2011}, ' ...
'title = {Reproduction and growth of the winged pearl oyster, \emph{Pteria penguin} ({R}\"{o}ding, 1798) in the {G}reat {B}arrier {R}eef {L}agoon}, ' ...
'school = {James Cook University, Australia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46467348}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarcPrie2005'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v31i2.55}, ' ...
'author = {Jes''{u}s S. Marcano and Antulio Prieto and Asdr\''{u}bal L\''{a}rez and Jos\''{e} J. Ali\''{o} and Hargadys Sanabria}, ' ... 
'year = {2005}, ' ...
'title = {Growth and mortality of \emph{Pinctada imbricata} ({M}ollusca: {P}teridae) in {G}uamachito, {A}raya {P}eninsula, {S}ucre {S}tate, {V}enezuela}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {31}, ' ...
'pages = {387-397}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

