function [data, auxData, metaData, txtData, weights] = mydata_Thysanoteuthis_rhombus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Thysanoteuthidae';
metaData.species    = 'Thysanoteuthis_rhombus'; 
metaData.species_en = 'Diamond squid'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ww_t'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 02]; 

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'MiyaOta2006';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 60;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'sealifebase';
  comment.Lp = 'males 40 to 55 cm, females 55 to 65 cm';
data.Li  = 100; units.Li  = 'cm'; label.Li  = 'mantle length at death'; bibkey.Li  = 'sealifebase';
data.L300  = 80; units.L300  = 'cm'; label.L300  = 'mantle length at 300 d'; bibkey.L300  = 'sealifebase';
  temp.L300 = C2K(15); units.temp.L300 = 'K'; label.temp.L300 = 'temperature'; 

data.Wwb  = 14.1e-3; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'GuerGonz2002';
  comment.Wwb = 'based on egg diameter of 3mm: pi/6*0.3^3';
data.Wwi  = 30e3; units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';       bibkey.Wwi  = 'sealifebase';
data.Ww300  = 17.5e3; units.Ww300  = 'g'; label.Ww300  = 'mantle length at 300 d'; bibkey.Ww300  = 'sealifebase';
  temp.Ww300 = C2K(15); units.temp.Ww300 = 'K'; label.temp.Ww300 = 'temperature'; 

data.Ni  = 4.8e5; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'GuerGonz2002';   
  temp.Ni = C2K(15); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'upto 43800 eggs per egg mass';
  
% uni-variate data
% time-length data
data.tL = [ ... % time since birth (d), mantle length (cm)
99.113	12.612
99.896	9.419
102.242	8.569
109.283	9.640
110.065	9.215
113.194	13.051
114.759	10.284
124.928	17.108
132.751	17.328
132.752	18.818
134.315	13.709
136.662	11.795
142.920	15.421
143.703	12.440
148.396	23.304
149.179	11.381
152.308	19.901
158.566	22.888
162.477	18.420
167.171	34.181
168.735	35.460
174.211	41.215
181.252	37.814
185.163	41.012
186.727	38.245
188.292	34.840
192.986	43.787
200.026	29.527
200.027	54.228
201.591	56.997
206.284	32.727
209.413	28.684
213.325	61.267
214.107	31.882
218.018	30.608
218.019	41.255
220.365	67.448
223.494	38.279
227.405	51.272
229.752	45.099
234.446	47.446
234.447	52.343
238.357	48.301
238.358	53.837
240.704	59.376
243.051	35.955
243.052	63.211
251.656	54.275
261.043	51.516
268.866	68.558];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL   = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MiyaOta2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Reproductive output is assumed to correspond to death at 330 d';
D3 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'typically lives for 1 yr; planktontic egg masses';
metaData.bibkey.F1 = 'GuerGonz2002'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7BZ8S'; % Cat of Life
metaData.links.id_ITIS = '82546'; % ITIS
metaData.links.id_EoL = '453261'; % Ency of Life
metaData.links.id_Wiki = 'Thysanoteuthis_rhombus'; % Wikipedia
metaData.links.id_ADW = 'Thysanoteuthis_rhombus'; % ADW
metaData.links.id_Taxo = '136624'; % Taxonomicon
metaData.links.id_WoRMS = '141680'; % WoRMS
metaData.links.id_molluscabase = '141680'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thysanoteuthis_rhombus}}';
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
bibkey = 'MiyaOta2006'; type = 'Article'; bib = [ ... 
'author = {Kazutaka Miyahara and Taro Ota and Tsuneo Goto and Shigeaki Gorie}, ' ... 
'year = {2006}, ' ...
'title = {Age, growth and hatching season of the diamond squid \emph{Thysanoteuthis rhombus} estimated from statolith analysis and catch data in the western {S}ea of {J}apan}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {80}, ' ...
'pages = {211-220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GuerGonz2002'; type = 'Article'; bib = [ ... 
'doi = {10.1093/plankt/24.4.333}, ' ...
'author = {A. Guerra and A. F. Gonz\''{a}lez and F. J. Rocha and R. Sagarminaga and A. Canadas}, ' ... 
'year = {2002}, ' ...
'title = {Planktonic egg masses of the diamond-shaped squid \emph{Thysanoteuthis rhombus} in the eastern {A}tlantic and the {M}editerranean {S}ea}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {24}, ' ...
'pages = {333-338}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'tolweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://tolweb.org/Thysanoteuthis_rhombus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Thysanoteuthis-rhombus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
