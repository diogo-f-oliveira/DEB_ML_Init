function [data, auxData, metaData, txtData, weights] = mydata_Dicerorhinus_sumatrensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Perissodactyla'; 
metaData.family     = 'Rhinocerotidae';
metaData.species    = 'Dicerorhinus_sumatrensis'; 
metaData.species_en = 'Sumatran rhinoceros'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1 = [2016 11 14];              
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 236;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp taken from Rhinoceros_unicornis';
data.tx = 502;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2738;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '1643 d for male';
data.am = 32.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 250;   units.Li  = 'cm';  label.Li  = 'ultimate body length for female';   bibkey.Li  = 'Wiki';

data.Wwb = 23e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 9.056e5;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 1.26e6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/1278;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.604	34615.385
6.782	42307.692
13.523	52564.103
21.387	62820.513
28.128	73076.923
34.870	83333.333
44.973	91025.641
51.153	100000.000
56.771	108974.359
62.949	116666.667
69.689	125641.026
76.429	134615.385
85.975	144871.795
93.281	157692.308
101.145	169230.769
106.200	175641.026
111.819	184615.385
116.872	189743.590
124.732	197435.897
128.668	206410.256
133.725	214102.564
139.899	219230.769
145.516	226923.077
151.132	233333.333
155.070	243589.744
160.121	247435.897
166.294	251282.051
169.665	256410.256
175.282	264102.564
180.337	270512.821
187.641	282051.282
193.817	288461.538
197.182	288461.538
201.681	298717.949
208.977	303846.154
214.030	308974.359
221.329	316666.667
226.384	323076.923
229.191	325641.026
233.685	332051.282
238.738	337179.487
242.670	342307.692
250.525	346153.846
253.897	352564.103
258.385	353846.154
264.564	362820.513
270.729	360256.410
274.661	365384.615
280.837	371794.872
285.317	366666.667
288.689	373076.923
290.932	373076.923
294.865	379487.179
299.915	382051.282
302.719	382051.282
307.215	389743.590
311.140	389743.590
315.626	389743.590
318.434	393589.744
321.246	400000.000
324.051	401282.051
329.651	394871.795
334.139	396153.846
336.949	401282.051
341.441	406410.256
345.365	405128.205
349.291	406410.256
352.656	406410.256
357.152	414102.564];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PlaiRein2011';
comment.tW = 'data for female in Cincinnati Zoo';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
% weights.psd.t_0 = 1e-6;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '35JV8'; % Cat of Life
metaData.links.id_ITIS = '625002'; % ITIS
metaData.links.id_EoL = '311504'; % Ency of Life
metaData.links.id_Wiki = 'Dicerorhinus_sumatrensis'; % Wikipedia
metaData.links.id_ADW = 'Dicerorhinus_sumatrensis'; % ADW
metaData.links.id_Taxo = '69137'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14100054'; % MSW3
metaData.links.id_AnAge = 'Dicerorhinus_sumatrensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dicerorhinus_sumatrensis}}';
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
bibkey = 'PlaiRein2011'; type = 'Article'; bib = [ ... 
'author = {B. L. Plair and P. R. Reinhart and T. L. Roth}, ' ... 
'year = {2011}, ' ...
'title = {Neonatal Milestones, Behavior and Growth Rate of {S}umatran Rhinoceros (\emph{Dicerorhinus sumatrensis}) Calves Born and Bred in Captivity}, ' ...
'journal = {Zoo Biol}, ' ...
'volume = {30}, ' ...
'pages = {1-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dicerorhinus_sumatrensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

