function [data, auxData, metaData, txtData, weights] = mydata_Loligo_vulgaris

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Loligo_vulgaris'; 
metaData.species_en = 'European squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MA','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.ab = 26;   units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'MoreLefk2015';   
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'RochGuer1999';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.31;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'MoreLefk2015';
data.Lp  = 16.9;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'sealifebase';
data.Lpm  = 10;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';       bibkey.Lpm  = 'sealifebase';
data.Li  = 32;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'RochGuer1999';
data.Lim = 46; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'RochGuer1999';

data.Wwim  = 1500; units.Wwim  = 'g'; label.Wwim  = 'wet weight at death for male'; bibkey.Wwim  = 'sealifebase';

data.Ni  = 6000; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'MoreLefk2015';   
  temp.Ni = C2K(18); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
165.479	9.859
199.267	17.077
206.225	18.486
221.272	14.613
223.216	17.254
226.248	15.317
227.292	13.028
233.192	17.430
233.273	13.380
242.220	15.141
246.092	21.127
246.191	16.197
251.111	19.718
252.161	17.077
253.194	15.317
264.074	20.246
269.064	20.246
277.016	21.831
280.053	19.718
281.128	15.845
285.050	19.366
288.012	20.951
299.925	24.120
305.874	26.056
307.730	33.099
308.917	23.592
308.963	21.303
333.702	31.866];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'RochGuer1999';
comment.tL_f = 'data for females, hathed in winter-spring'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
181.517	12.084
221.362	15.943
227.461	13.476
236.609	9.776
239.102	22.451
243.327	16.816
251.327	16.813
255.144	21.389
260.461	13.465
262.278	18.041
264.391	15.224
274.278	18.037
274.990	25.255
275.046	23.847
284.180	20.499
285.722	31.942
294.215	19.615
302.596	35.105
305.786	30.350
306.061	23.484
314.406	39.854
325.554	36.153
325.709	32.280
356.273	43.184];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'RochGuer1999';
comment.tL_m = 'data for males, hathed in winter-spring'; 


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
weights.Lim = 3 * weights.Lim; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72LBY'; % Cat of Life
metaData.links.id_ITIS = '82375'; % ITIS
metaData.links.id_EoL = '451497'; % Ency of Life
metaData.links.id_Wiki = 'Loligo_vulgaris'; % Wikipedia
metaData.links.id_ADW = 'Loligo_vulgaris'; % ADW
metaData.links.id_Taxo = '40238'; % Taxonomicon
metaData.links.id_WoRMS = '140271'; % WoRMS
metaData.links.id_molluscabase = '140271'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Loligo_vulgaris}}';
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
bibkey = 'BettCoel1996'; type = 'article'; bib = [ ... 
'author = {V. Bettencourt and L. Coelho and J.P. Andrade and A. Guerra}, ' ... 
'year = {1996}, ' ...
'title = {AGE AND GROWTH OF THE SQUID \emph{Loligo_vulgaris} OFF THE SOUTH COAST OF {P}ORTUGAL, USING STATOLITH ANALYSIS}, ' ...
'journal = {J. Moll Stud}, ' ...
'volume = {62}, ' ...
'pages = {359-366}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RochGuer1999'; type = 'article'; bib = [ ... 
'author = {F. Rocha and A. Guerra}, ' ... 
'year = {1999}, ' ...
'title = {Age and growth of two sympatric squid \emph{Loligo vulgaris} and \emph{Loligo forbesi}, in {G}alician waters (north-west {S}pain)}, ' ...
'journal = {J.Mar. Biol. Ass.U.K.}, ' ...
'volume = {79}, ' ...
'pages = {697-707}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoreLefk2015'; type = 'incollection'; bib = [ ... 
'author = {Ana Moreno and Evgenia Lefkaditou and Jean-Paul Robin and Jo\~{a}o Pereira and Angel F. Gonz\''{a}lez and Sonia Seixas and Roger Villanueva and Graham J. Pierce and A. Louise Allcock and Patrizia Jereb}, ' ... 
'year = {2015}, ' ...
'title = {\emph{Loligo vulgaris} Lamarck, 1798}, ' ...
'booktitle = {Cephalopod biology and fisheries in Europe: II. Species Accounts}, ' ...
'editor = {Patrizia Jereb and A. Louise Allcock and Evgenia Lefkaditou and Uwe Piatkowski and Lee C. Hastie and Graham J. Pierce}, ' ...
'publisher = {ICES Cooperative Research Report}, ' ...
'number = {325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Loligo-vulgaris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Loligo_forbesii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

