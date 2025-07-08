function [data, auxData, metaData, txtData, weights] = mydata_Radix_rubiginosa

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Lymnaeidae';
metaData.species    = 'Radix_rubiginosa'; 
metaData.species_en = 'Radix'; 

metaData.ecoCode.climate = {'Cfb', 'Cwb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp','TPa'};
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

data.ab30 = 6;  units.ab30 = 'd';    label.ab30 = 'age at birth';               bibkey.ab30 = 'Nada2011';   
  temp.ab30 = C2K(30);  units.temp.ab30 = 'K'; label.temp.ab30 = 'temperature';
data.ab25 = 8;  units.ab25 = 'd';    label.ab25 = 'age at birth';               bibkey.ab25 = 'Nada2011';   
  temp.ab25 = C2K(25);  units.temp.ab25 = 'K'; label.temp.ab25 = 'temperature';
data.ab20 = 12;  units.ab20 = 'd';    label.ab20 = 'age at birth';               bibkey.ab20 = 'Nada2011';   
  temp.ab20 = C2K(20);  units.temp.ab20 = 'K'; label.temp.ab20 = 'temperature';

data.Lb  = 0.0845; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Nada2011';
data.Lp  = 0.40; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Nada2011';
data.Li  = 1.80; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Nada2011';

data.Wwi = 0.408; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EoL';
 
data.Ri  = 140/7;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Nada2011';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), shell length (cm)
0.000	0.098
7.333	0.154
13.667	0.299
21.000	0.434
27.667	0.724
34.667	1.009
42.000	1.224
49.000	1.368
55.667	1.448
62.667	1.508
70.000	1.541
76.667	1.550
84.000	1.583
90.667	1.583
97.333	1.606
104.667	1.624
111.667	1.643
119.000	1.652
126.000	1.661
133.000	1.685
140.000	1.699
147.000	1.717
154.000	1.726
161.333	1.726
167.667	1.745
175.000	1.735];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Nada2011';

% time-survival
data.tS30 = [ ... % time since birth (d), fraction surviving
0.000	1.000
6.635	1.000
13.934	1.000
21.231	1.000
28.187	0.966
34.817	0.950
42.118	0.958
49.073	0.922
55.361	0.878
62.974	0.823
69.590	0.768
76.532	0.694
83.481	0.638
90.768	0.603
97.705	0.515
104.318	0.449
111.580	0.336
118.850	0.250
125.459	0.171
132.412	0.129
139.361	0.077
146.304	0.000];
units.tS30   = {'d', '-'};  label.tS30 = {'time since birth', 'fraction surviving', '30 C'};  
temp.tS30    = C2K(30);  units.temp.tS30 = 'K'; label.temp.tS30 = 'temperature';
bibkey.tS30 = 'Nada2011';
%
data.tS25 = [ ... % time since birth (d), shell length (cm)
0.000	1.000
7.628	1.000
14.923	1.000
21.564	1.000
28.202	1.003
35.160	0.994
42.741	0.945
49.672	0.909
56.576	0.845
63.512	0.815
70.444	0.779
76.686	0.718
84.270	0.671
91.204	0.638
98.776	0.580
104.698	0.530
112.277	0.478
119.545	0.448
125.429	0.359
132.965	0.265
140.242	0.243
146.786	0.152
153.673	0.072
160.604	0.036
168.224	0.025
174.505	0.000];
units.tS25   = {'d', '-'};  label.tS25 = {'time since birth', 'fraction surviving', '25 C'};  
temp.tS25    = C2K(25);  units.temp.tS25 = 'K'; label.temp.tS25 = 'temperature';
bibkey.tS25 = 'Nada2011';
%
data.tS20 = [ ... % time since birth (d), shell length (cm)
0.000	1.000
6.302	1.000
13.268	1.000
20.236	1.000
27.535	0.999
33.839	0.997
41.138	0.996
48.439	0.988
55.749	0.955
62.387	0.944
69.361	0.922
76.675	0.878
83.325	0.831
90.635	0.798
97.616	0.754
103.951	0.658
111.930	0.609
118.236	0.600
125.210	0.578
132.199	0.512
138.850	0.463
146.509	0.378
153.499	0.307
160.816	0.252
167.137	0.199
174.448	0.161
181.765	0.106
188.744	0.070
196.052	0.040
203.034	0.000];
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
%txtData.comment = comment;

%% Group plots
set1 = {'tS30','tS25','tS20'}; subtitle1 = {'Data for 30, 25, 20 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4R9HS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4803261'; % Ency of Life
metaData.links.id_Wiki = 'Radix_rubiginosa'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5634236'; % Taxonomicon
metaData.links.id_WoRMS = '724539'; % WoRMS
metaData.links.id_molluscabase = '724539'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Radix_rubiginosa}}';
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

