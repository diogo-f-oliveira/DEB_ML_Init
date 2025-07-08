function [data, auxData, metaData, txtData, weights] = mydata_Radix_natalensis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Lymnaeidae';
metaData.species    = 'Radix_natalensis'; 
metaData.species_en = 'Radix'; 

metaData.ecoCode.climate = {'Cfb', 'Cwb', 'Dfb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-S_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 26]; 

%% set data
% zero-variate data

data.ab30 = 10;  units.ab30 = 'd';    label.ab30 = 'age at birth';               bibkey.ab30 = 'Nada2011';   
  temp.ab30 = C2K(30);  units.temp.ab30 = 'K'; label.temp.ab30 = 'temperature';
data.ab25 = 12;  units.ab25 = 'd';    label.ab25 = 'age at birth';               bibkey.ab25 = 'Nada2011';   
  temp.ab25 = C2K(25);  units.temp.ab25 = 'K'; label.temp.ab25 = 'temperature';
data.ab20 = 15;  units.ab20 = 'd';    label.ab20 = 'age at birth';               bibkey.ab20 = 'Nada2011';   
  temp.ab20 = C2K(20);  units.temp.ab20 = 'K'; label.temp.ab20 = 'temperature';

data.Lb  = 0.082; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Nada2011';
data.Lp  = 0.42; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Nada2011';
data.Lp  = 0.66; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Nada2011';
data.Li  = 1.70; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Nada2011';

data.Wwi = 0.91; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EoL';
  comment.Wwi = 'based on size-corrected value for Physells acuta: 0.319*(1.7/1.2)^3';
 
data.Ri  = 80/7;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Nada2011';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), shell length (cm)
0.000	0.098
0.333	0.098
7.000	0.131
8.000	0.107
13.333	0.196
14.000	0.210
21.333	0.331
21.667	0.303
27.667	0.476
28.333	0.453
34.667	0.705
34.667	0.738
42.000	1.051
42.333	0.995
48.667	1.172
48.667	1.186
55.000	1.191
55.667	1.214
63.000	1.209
63.000	1.228
69.667	1.232
69.667	1.256
76.333	1.274
76.667	1.246
83.333	1.293
84.333	1.270
90.333	1.284
90.333	1.298
97.000	1.293
97.667	1.335
104.667	1.349
105.333	1.316
112.333	1.330
113.000	1.363
118.333	1.372
126.333	1.395];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length', '25 C'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Nada2011';

% time-survival
data.tS30 = [ ... % time since birth (d), fraction surviving
0.663	1.000
0.663	1.000
6.966	1.000
7.629	1.000
14.259	0.983
14.262	0.991
20.201	0.895
21.209	0.934
28.473	0.829
28.815	0.859
35.085	0.760
35.090	0.774
41.686	0.656
41.705	0.713
48.316	0.642
48.949	0.548
55.574	0.518
55.856	0.370
62.510	0.425
62.801	0.304
69.725	0.174
69.767	0.301
76.327	0.075
76.375	0.218
83.643	0.127
84.268	0.000
90.920	0.061
97.536	0.000];
units.tS30   = {'d', '-'};  label.tS30 = {'time since birth', 'fraction surviving', '30 C'};  
temp.tS30    = C2K(30);  units.temp.tS30 = 'K'; label.temp.tS30 = 'temperature';
bibkey.tS30 = 'Nada2011';
%
data.tS25 = [ ... % time since birth (d), shell length (cm)
0.998	1.000
0.998	1.000
7.633	1.000
7.633	1.000
14.932	1.000
14.932	1.000
21.885	0.989
21.890	0.994
28.174	0.975
28.446	0.914
35.363	0.865
35.368	0.870
42.256	0.790
42.930	0.801
48.863	0.762
49.154	0.721
56.090	0.691
56.403	0.671
63.317	0.619
63.619	0.588
69.823	0.489
70.232	0.566
76.710	0.409
77.467	0.503
84.047	0.448
84.576	0.312
90.937	0.370
91.397	0.166
98.262	0.064
98.485	0.287
105.185	0.019
105.712	0.215
111.801	0.000
111.944	0.144
118.826	0.058
126.398	0.000];
units.tS25   = {'d', '-'};  label.tS25 = {'time since birth', 'fraction surviving', '25 C'};  
temp.tS25    = C2K(25);  units.temp.tS25 = 'K'; label.temp.tS25 = 'temperature';
bibkey.tS25 = 'Nada2011';
%
data.tS20 = [ ... % time since birth (d), shell length (cm)
0.000	1.000
0.000	0.995
6.636	0.994
7.631	0.994
13.602	0.997
14.597	0.997
19.911	0.980
20.238	0.994
27.539	0.986
27.549	0.956
33.847	0.972
34.853	0.939
40.503	0.909
40.829	0.928
48.144	0.879
48.493	0.826
55.485	0.750
55.785	0.845
62.479	0.667
62.782	0.755
69.768	0.697
69.780	0.662
76.417	0.656
77.101	0.593
83.407	0.585
83.414	0.563
90.388	0.541
90.727	0.522
97.383	0.458
97.391	0.434
104.712	0.365
105.062	0.310
110.719	0.258
111.747	0.159
118.050	0.159
119.415	0.047
125.711	0.069
126.055	0.030
132.695	0.017
132.696	0.014
132.698	0.008
139.999	0.000];
units.tS20   = {'d', '-'};  label.tS20 = {'time since birth', 'fraction surviving', '20 C'};  
temp.tS20    = C2K(20);  units.temp.tS20 = 'K'; label.temp.tS20 = 'temperature';
bibkey.tS20 = 'Nada2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tS30','tS25','tS20'}; subtitle1 = {'Data for 30, 25, 20 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4R9GX'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '49876793'; % Ency of Life
metaData.links.id_Wiki = 'Radix_natalensis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5634213'; % Taxonomicon
metaData.links.id_WoRMS = '843744'; % WoRMS
metaData.links.id_molluscabase = '843744'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Radix_natalensis}}';
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
bibkey = 'Nada2011'; type = 'Phdthesis'; bib = [ ... 
'author = {Devandren Subramoney Nadasan}, ' ... 
'year = {2001}, ' ...
'title = {The invasive potential of the freshwater snail \emph{Radix rubiginosa} recently introduced into South Africa}, ' ...
'school = {University of KwaZulu-Natal}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/452902}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

