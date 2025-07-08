function [data, auxData, metaData, txtData, weights] = mydata_Physella_acuta

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Physidae';
metaData.species    = 'Physella_acuta'; 
metaData.species_en = 'Acute bladder snail'; 

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

data.ab30 = 5;  units.ab30 = 'd';    label.ab30 = 'age at birth';               bibkey.ab30 = 'Nada2011';   
  temp.ab30 = C2K(30);  units.temp.ab30 = 'K'; label.temp.ab30 = 'temperature';
data.ab25 = 6;  units.ab25 = 'd';    label.ab25 = 'age at birth';               bibkey.ab25 = 'Nada2011';   
  temp.ab25 = C2K(25);  units.temp.ab25 = 'K'; label.temp.ab25 = 'temperature';
data.ab20 = 9;  units.ab20 = 'd';    label.ab20 = 'age at birth';               bibkey.ab20 = 'Nada2011';   
  temp.ab20 = C2K(20);  units.temp.ab20 = 'K'; label.temp.ab20 = 'temperature';

data.Lb  = 0.072; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Nada2011';
data.Lp  = 0.27; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Nada2011';
data.Li  = 1.20; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Nada2011';

data.Wwi = 0.319; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EoL';
 
data.Ri  = 150/7;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Nada2011';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), shell length (cm)
0.667	0.093
6.333	0.126
13.667	0.205
21.000	0.280
28.667	0.462
35.333	0.640
41.667	0.738
48.333	0.784
55.667	0.831
62.667	0.835
69.667	0.859
76.667	0.854
83.667	0.877
90.667	0.877
98.000	0.886
105.000	0.881
111.667	0.900
118.333	0.933
125.667	0.928
132.667	0.937
140.667	0.942
146.333	0.951
153.333	0.960
160.667	0.960
167.667	0.974
174.667	0.997
181.667	0.997
188.667	1.006
196.000	1.020];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Nada2011';

% time-survival
data.tS30 = [ ... % time since birth (d), fraction surviving
0.330	1.000
6.966	1.000
13.929	0.989
20.565	0.991
28.182	0.953
35.147	0.944
42.102	0.911
49.045	0.837
55.658	0.771
63.602	0.719
69.223	0.661
76.838	0.614
83.137	0.600
91.070	0.515
97.665	0.394
105.614	0.352
111.234	0.295
119.149	0.152
125.765	0.094
132.713	0.039
139.674	0.019
146.972	0.019
152.938	0.000];
units.tS30   = {'d', '-'};  label.tS30 = {'time since birth', 'fraction surviving', '30 C'};  
temp.tS30    = C2K(30);  units.temp.tS30 = 'K'; label.temp.tS30 = 'temperature';
bibkey.tS30 = 'Nada2011';
%
data.tS25 = [ ... % time since birth (d), shell length (cm)
0.329	1.000
7.962	1.000
14.929	1.000
21.567	1.000
28.865	1.000
35.495	0.997
42.401	0.936
49.346	0.914
56.294	0.895
63.562	0.865
70.822	0.826
77.410	0.779
85.021	0.760
91.632	0.735
98.900	0.704
105.135	0.635
112.378	0.580
118.281	0.511
126.213	0.481
132.735	0.367
139.647	0.312
147.225	0.260
153.805	0.204
160.383	0.146
168.301	0.102
174.228	0.058
182.171	0.039
189.122	0.022
195.740	0.000];
units.tS25   = {'d', '-'};  label.tS25 = {'time since birth', 'fraction surviving', '25 C'};  
temp.tS25    = C2K(25);  units.temp.tS25 = 'K'; label.temp.tS25 = 'temperature';
bibkey.tS25 = 'Nada2011';
%
data.tS20 = [ ... % time since birth (d), shell length (cm)
0.000	1.000
6.302	1.000
13.271	0.994
20.571	0.991
27.868	0.994
34.502	0.999
41.473	0.985
48.774	0.980
56.079	0.961
62.714	0.960
69.351	0.952
76.669	0.894
83.646	0.864
90.621	0.839
97.925	0.823
104.908	0.776
111.561	0.721
118.534	0.702
124.854	0.652
132.163	0.619
140.132	0.600
146.782	0.553
153.765	0.507
161.081	0.454
167.726	0.424
174.701	0.399
181.018	0.358
188.992	0.322
195.974	0.276
202.626	0.223
209.615	0.158
216.597	0.111
223.901	0.097
230.878	0.064
237.857	0.028
244.835	0.000];
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
metaData.links.id_CoL = '4HGZ8'; % Cat of Life
metaData.links.id_ITIS = '76699'; % ITIS
metaData.links.id_EoL = '452902'; % Ency of Life
metaData.links.id_Wiki = 'Physella_acuta'; % Wikipedia
metaData.links.id_ADW = 'Physella_acuta'; % ADW
metaData.links.id_Taxo = '169385'; % Taxonomicon
metaData.links.id_WoRMS = '234093'; % WoRMS
metaData.links.id_molluscabase = '234093'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Physella_acuta}}';
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

