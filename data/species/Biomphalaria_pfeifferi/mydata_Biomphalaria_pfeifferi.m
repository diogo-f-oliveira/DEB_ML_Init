function [data, auxData, metaData, txtData, weights] = mydata_Biomphalaria_pfeifferi

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Biomphalaria_pfeifferi'; 
metaData.species_en = 'Freshwater snail'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.8); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 01]; 

%% set data
% zero-variate data

data.am = 350; units.am = 'd';    label.am = 'life span';                bibkey.am = 'LoreBalu1987';   
  temp.am = C2K(21.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.09; units.Lb  = 'cm';  label.Lb  = 'shell diameter at birth';   bibkey.Lb  = 'guess';
data.Lp  = 0.65; units.Lp  = 'cm';  label.Lp  = 'shell diameter at puberty'; bibkey.Lp  = 'guess';
data.Li  = 1.75; units.Li  = 'cm';  label.Li  = 'ultimate shell diameter';   bibkey.Li  = 'guess';
  comment.Li = 'value for Biomphalaria_glabrata';

data.Wwi  = 2.35; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'value for Biomphalaria_glabrata';

data.Ri  = 30/7;   units.Ri  = '#/d'; label.Ri  = 'number of eggs at 121 d since birth';     bibkey.Ri  = 'LoreBalu1987';   
  temp.Ri = C2K(21.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % age (d), shell diameter (cm)
0.000	0.111
5.861	0.127
13.206	0.166
20.604	0.230
27.448	0.295
35.945	0.350
42.767	0.406
50.082	0.431
56.855	0.465
65.871	0.503
70.965	0.534
76.534	0.528
85.035	0.586
93.466	0.611
97.989	0.637
104.776	0.677
112.635	0.696
118.859	0.734
128.406	0.760
133.452	0.769
142.999	0.795
148.112	0.835
155.997	0.866
161.623	0.886
168.871	0.882
178.405	0.902
182.915	0.922
188.554	0.947
197.521	0.963
204.228	0.967
210.940	0.973
216.022	0.999
225.546	1.014
233.388	1.026
240.667	1.036
247.392	1.048
254.112	1.058
262.512	1.070
266.428	1.074
276.516	1.091
282.107	1.095
289.390	1.107
294.981	1.111
304.510	1.129
310.650	1.129
316.795	1.131
324.091	1.149
330.249	1.156];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell diameter'};  
temp.tL    = C2K(21.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LoreBalu1987';
comment.tL = 'Uncrowded';
%
data.tL1 = [ ... % age (d), shell diameter (cm)
0.000	0.103
7.531	0.125
15.953	0.146
21.052	0.180
26.793	0.251
36.300	0.259
42.573	0.318
50.445	0.344
56.665	0.380
65.645	0.402
69.065	0.433
80.801	0.439
85.377	0.489
94.370	0.516
98.893	0.542
106.770	0.570
112.954	0.589
121.948	0.617
128.682	0.633
133.178	0.647
141.609	0.672
150.030	0.694
155.099	0.714
162.958	0.734
169.692	0.749
176.979	0.763
182.056	0.787
189.893	0.797
197.198	0.819
201.686	0.828
211.774	0.846
215.712	0.860
223.540	0.866
233.637	0.888
239.245	0.900
247.091	0.913
253.253	0.923
261.099	0.937
266.708	0.949
275.112	0.963
282.386	0.971
290.237	0.986
290.237	0.986
295.282	0.996
303.111	1.002
310.389	1.012
318.213	1.016
325.505	1.032
332.797	1.048];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'shell diameter'};  
temp.tL1    = C2K(21.8);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'LoreBalu1987';
comment.tL1 = 'crowed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL1 = 5 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for uncrowded, crowded'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LV3X'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4805254'; % Ency of Life
metaData.links.id_Wiki = 'Biomphalaria_pfeifferi'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1686745'; % Taxonomicon
metaData.links.id_WoRMS = '1058681'; % WoRMS
metaData.links.id_molluscabase = '1058681'; % Molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Biomphalaria_pfeifferi}}';
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
bibkey = 'LoreBalu1987'; type = 'Article'; bib = [ ... 
'author = {Michel Loreau and Bajope Baluku}, ' ... 
'title = {GROWTH AND DEMOGRAPHY OF POPULATIONS OF \emph{Biomphalaria pfeifferi} ({G}ASTROPODA, {P}LANORBIDAE) IN THE LABORATORY}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {53}, ' ...
'year = {1987}, ' ...
'pages = {171-177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
