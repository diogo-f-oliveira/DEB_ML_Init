function [data, auxData, metaData, txtData, weights] = mydata_Mantella_expectata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Mantellidae';
metaData.species    = 'Mantella_expectata'; 
metaData.species_en = 'Blue-legged mantella'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'bjCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 05];

%% set data
% zero-variate data

data.tj = 180; units.tj = 'd';    label.tj = 'time birth at metam';        bibkey.tj = 'guess';   
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = '20 to 32 d';
data.am = 3*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'GuarTess2010';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.6;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'guess';
data.Lp  = 2.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'GuarTess2010';
data.Lpm  = 2.5;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'GuarTess2010';
data.Li  = 3;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'GuarTess2010';
data.Lim  = 2.7;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'GuarTess2010';

data.Wwb = 4.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 2.755;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Pelophylax_esculentus: (3/9.5)^3*87.5';
data.Wwim = 2.01;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of Pelophylax_esculentus: (2.7/9.5)^3*87.5';

data.Ri  = 210/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Pelophylax_esculentus: 4000*(3/8)^3 eggs per clutch';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (d), SVL (cm)
1	2.436 2.029
1	2.587 2.087
1   NaN   2.106
1   NaN   2.133
1   NaN   2.164
1   NaN   2.298
2	2.564 2.118
2	2.613 2.154
2	2.660 2.179
2	2.481 2.220
2   NaN   2.264
2   NaN   2.363
2   NaN   2.379
2   NaN   2.330
2   NaN   2.418
2   NaN   2.093
3	2.661 2.221
3	2.697 2.348
3	2.760 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.5) * 365; % convert yrs to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(27);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'GuarTess2010'; treat.tL_fm = {1, {'females','males',}}; 
comment.tL_fm = 'data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3XW7H'; % Cat of Life
metaData.links.id_ITIS = '664036'; % ITIS
metaData.links.id_EoL = '336836'; % Ency of Life
metaData.links.id_Wiki = 'Mantella_expectata'; % Wikipedia
metaData.links.id_ADW = 'Mantella_expectata'; % ADW
metaData.links.id_Taxo = '141216'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Mantella+expectata'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mantella_expectata}}';
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
bibkey = 'GuarTess2010'; type = 'Article'; bib = [ ...  
'doi = {10.1016/j.zool.2010.08.003}, ' ...
'author = {Guarino, F. M. and Tessa, G. and Mercurio, V. and Andreone, F.}, ' ...
'year = {2010}, ' ...
'title  = {Rapid sexual maturity and short life span in the blue-legged frog and the rainbow frog from the arid {I}salo {M}assif, southern-central {M}adagascar}, ' ...
'journal = {Zoology}, ' ...
'volme = {113(6)}, ' ...
'pages = {378–384}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Mantella+expectata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

